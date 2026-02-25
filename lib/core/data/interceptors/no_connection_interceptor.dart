import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/services/connection_service.dart';

class NoConnectionInterceptor extends QueuedInterceptor {
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
    // Retry ONLY when there was no internet connection and it is restored.
    // If the backend host is unreachable (wrong URL/port), blindly retrying
    // on every `connectionError` will lead to an infinite loop and the UI
    // will stay in the loading state forever.
    if (err.type == DioExceptionType.connectionError) {
      // Re-check actual connectivity state.
      final hasConnection = await connectionService.checkConnection();

      // If we were offline, wait until we go online and retry once.
      if (!hasConnection) {
        await connectionService.firstWhere((isOnline) => isOnline);

        final options = err.requestOptions;
        try {
          final response = await client.request(
            options.path,
            data: options.data,
            options: Options(
              method: options.method,
              headers: options.headers,
              contentType: options.contentType,
            ),
            queryParameters: options.queryParameters,
          );

          return handler.resolve(response);
        } on DioException catch (e) {
          // If retry also fails, propagate the error so higher layers
          // can emit an error state instead of hanging.
          return handler.next(e);
        }
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
