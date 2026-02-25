import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_helper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.client,
    required this.authRemoteDs,
    required this.authLocalDs,
    required this.tokenIsExpiredCallback,
    this.exceptionsHandler,
    this.eventLogger,
    this.onUnauthorizedHit,
  });

  @protected
  final AuthLocalDs authLocalDs;

  @protected
  final AuthRemoteDs authRemoteDs;

  @protected
  final Dio client;

  @protected
  final bool Function(String token) tokenIsExpiredCallback;

  @protected
  final void Function(Object err, StackTrace stack)? exceptionsHandler;

  @protected
  final void Function(String event)? eventLogger;

  @protected
  final void Function()? onUnauthorizedHit;

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.realUri.path.contains(EndPoints.createToken)) {
      await authLocalDs.saveToken(TokenDTO.fromJson(response.data));
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    eventLogger?.call('401 status code. Trying to refresh tokens...');
    final token = await authLocalDs.getToken();
    final response = await token.when<Future<Response<dynamic>?>>(
      undefined: () async {
        eventLogger?.call('Tokens were not loaded');
        onUnauthorizedHit?.call();
        return null;
      },
      presented: (t) async {
        try {
          if (tokenIsExpiredCallback(t.refresh)) {
            eventLogger?.call('Refresh token is expired. Token: ${t.refresh}');
            await authLocalDs.removeToken();
            onUnauthorizedHit?.call();
          } else {
            eventLogger?.call('Sending refresh request to the server...');
            final freshTokens = await authRemoteDs.refreshJwt(t);
            eventLogger?.call('Received fresh tokens: $freshTokens');

            await authLocalDs.saveToken(freshTokens);
            final options = err.requestOptions;

            eventLogger?.call('Repeating the request with new token...');

            return client.request<dynamic>(
              options.path,
              data: options.data,
              options: Options(
                method: options.method,
                headers: {
                  ...options.headers,
                  'authorization': 'Bearer ${freshTokens.access}',
                },
                contentType: options.contentType,
                validateStatus: (status) => true,
              ),
              queryParameters: options.queryParameters,
            );
          }
        } on DioException catch (error) {
          eventLogger?.call('DioError: $error');

          if (error.response?.statusCode == 401) {
            await authLocalDs.removeToken();
            onUnauthorizedHit?.call();
          }
        } catch (error, stack) {
          eventLogger?.call('Exception: $error\nStack Trace:\n$stack');
          exceptionsHandler?.call(error, stack);
          onUnauthorizedHit?.call();
        }
        return null;
      },
    );

    if (response != null) {
      eventLogger?.call('Response status: ${response.statusCode}');

      return handler.resolve(response);
    }

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Public endpoints (AllowAny): don't send token — backend JWTAuthentication
    // returns 401 for invalid tokens before AllowAny is checked.
    if (options.shouldSkipAuth) {
      return handler.next(options);
    }

    final token = await authLocalDs.getToken();

    return token.when(
      presented: (t) {
        options.headers['authorization'] = 'Bearer ${t.access}';
        return handler.next(options);
      },
      undefined: () {
        // If authorization is required, but there is no auth token - do not send
        // the request, that will fail guaranteed. Instead reject it locally.
        if (options.doesRequireAuthorization) {
          return handler.resolve(
            Response(
              requestOptions: options,
              statusCode: 412,
              statusMessage: 'No auth token. '
                  'Auth token is required for this endpoint'
                  '(${options.path})',
            ),
          );
        }
        return handler.next(options);
      },
    );
  }
}
