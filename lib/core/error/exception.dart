abstract class AppException implements Exception {
  const AppException({required this.message});
  final String message;

  @override
  String toString() {
    return '$runtimeType: message = $message';
  }
}

sealed class ServerException extends AppException {
  const ServerException({required super.message, this.statusCode});
  final int? statusCode;

  R maybeWhenServerException<R>({
    required R Function(String message, int? statusCode) orElse,
    R Function(String message, int? statusCode)? internal,
    R Function(String message, int? statusCode)? client,
    R Function(String message, int? statusCode)? redirect,
  }) {
    return switch (this) {
      InternalServerException() =>
        internal?.call(message, statusCode) ?? orElse(message, statusCode),
      ClientServerException() =>
        client?.call(message, statusCode) ?? orElse(message, statusCode),
      RedirectServerException() =>
        redirect?.call(message, statusCode) ?? orElse(message, statusCode),
    };
  }

  @override
  String toString() {
    return '${super.toString()}, statusCode = $statusCode';
  }
}

final class InternalServerException extends ServerException {
  InternalServerException({required super.message, super.statusCode});
}

final class ClientServerException extends ServerException {
  ClientServerException({required super.message, super.statusCode});
}

final class RedirectServerException extends ServerException {
  RedirectServerException({required super.message, super.statusCode});
}

class CacheException extends AppException {
  CacheException({required super.message});
}
