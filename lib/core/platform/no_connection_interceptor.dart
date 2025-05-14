import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/services/connection_service.dart';

class NoConnectionInterceptor extends Interceptor {
  NoConnectionInterceptor({
    required this.client,
    required this.connectionService,
  });

  @protected
  final ConnectionService connectionService;

  @protected
  final Dio client;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final error = err.error;
    // If an exception was thrown, saying that there is no connection,
    // wait until the connection is established, and repeat the request
    if (error is SocketException) {
      if (error.osError?.message == 'No address associated with hostname') {
        await connectionService.firstWhere((hasConnection) => hasConnection);
        final options = err.requestOptions;

        return handler.resolve(
          await client.request(
            options.path,
            data: options.data,
            options: Options(
              method: options.method,
              headers: options.headers,
              contentType: options.contentType,
            ),
            queryParameters: options.queryParameters,
          ),
        );
      }
    }
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // If there is no connection,
    // send the request after connection is established
    if (!connectionService.data) {
      await connectionService.firstWhere((hasConnection) => hasConnection);
      handler.next(options);
    } else {
      handler.next(options);
    }
  }
}
