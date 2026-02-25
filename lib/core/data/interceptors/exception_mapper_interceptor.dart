import 'package:dio/dio.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';

/// Extracts user-facing message from API error response body.
/// Supports: { "message": "..." } or { "field_name": ["error1", "error2"], ... }
String _messageFromResponse(int statusCode, dynamic data, String fallback) {
  if (data is Map<String, dynamic>) {
    final map = data;
    if (map['message'] is String) return map['message'] as String;
    final List<String> parts = [];
    for (final entry in map.entries) {
      if (entry.key == 'code' || entry.key == 'message') continue;
      if (entry.value is List) {
        for (final item in entry.value as List) {
          if (item is String) parts.add(item);
        }
      } else if (entry.value is String) {
        parts.add(entry.value);
      }
    }
    if (parts.isNotEmpty) return parts.join(' ');
  }
  return fallback;
}

final class ExceptionMapperInterceptor extends Interceptor {
  const ExceptionMapperInterceptor();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    if (statusCode != null) {
      final data = err.response?.data;
      final fallback = err.message ?? '';
      final msg = statusCode >= 400
          ? _messageFromResponse(
              statusCode,
              data,
              statusCode >= 500 ? '' : fallback,
            )
          : fallback;
      final useMsg = msg.isNotEmpty ? msg : fallback;
      final exc = switch (statusCode) {
        >= 300 && < 400 =>
          RedirectServerException(message: useMsg, statusCode: statusCode),
        >= 400 && < 500 =>
          ClientServerException(message: useMsg, statusCode: statusCode),
        _ => InternalServerException(message: useMsg, statusCode: statusCode),
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
