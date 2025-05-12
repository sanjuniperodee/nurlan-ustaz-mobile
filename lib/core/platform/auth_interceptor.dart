import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

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
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: $response');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != HttpStatus.unauthorized)
      return handler.next(err);

    eventLogger?.call('401 status code. Trying to refresh tokens...');
    final token = optionOf(await authLocalDs.getTokenFromCacheNull());
    final response = await token.fold<Future<Response<dynamic>?>>(
      () async {
        eventLogger?.call('Tokens were not loaded');
        onUnauthorizedHit?.call();
        return null;
      },
      (t) async {
        try {
          if (tokenIsExpiredCallback(t.refresh)) {
            eventLogger?.call('Refresh token is expired. Token: ${t.refresh}');
            await authLocalDs.removeUserFromCache();
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
                  HttpHeaders.authorizationHeader: freshTokens.access,
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
            await authLocalDs.removeUserFromCache();
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
    final token = await authLocalDs.getTokenFromCacheNull();

    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${token.access}';
    }

    return handler.next(options);
  }
}
