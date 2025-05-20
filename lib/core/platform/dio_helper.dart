import 'package:dio/dio.dart';

mixin DioHelperMixin {
  static const requiresAuthorizationKey = 'requiresAuthorization';
  static const requiresAuthorizationHeader = {requiresAuthorizationKey: true};
  static Options requiresAuthorizationOption = Options(
    headers: requiresAuthorizationHeader,
  );
}

extension DioOptionsExtension on Options {
  Options addRequiresAuthorizationHeader() {
    return copyWith(
      headers: {
        ...?headers,
        ...DioHelperMixin.requiresAuthorizationHeader,
      },
    );
  }
}

extension DioRequestOptionsExtension on RequestOptions {
  bool get doesRequireAuthorization {
    return headers[DioHelperMixin.requiresAuthorizationKey] == true;
  }
}
