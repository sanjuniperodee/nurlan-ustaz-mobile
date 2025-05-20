import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';

final class ExceptionMapperInterceptor extends Interceptor {
  const ExceptionMapperInterceptor();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    if (statusCode != null) {
      final msg = err.message ?? '';
      final exc = switch (statusCode) {
        >= 300 && < 400 =>
          RedirectServerException(message: msg, statusCode: statusCode),
        >= 400 && < 500 =>
          ClientServerException(message: msg, statusCode: statusCode),
        _ => InternalServerException(message: msg, statusCode: statusCode),
      };
      return handler.reject(
        DioException(
          error: exc,
          requestOptions: err.requestOptions,
        ),
      );
    }
    handler.next(err);
  }
}
