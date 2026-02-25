import 'package:dio/dio.dart';

mixin DioHelperMixin {
  /// Stored in Options.extra only (never sent to server) to avoid CORS.
  static const requiresAuthorizationExtraKey = 'requiresAuthorization';
  static Options requiresAuthorizationOption = Options(
    extra: {requiresAuthorizationExtraKey: true},
  );

  /// Use for public endpoints (AllowAny) to avoid 401 when token is expired.
  /// JWTAuthentication fails before AllowAny is checked.
  static const skipAuthExtraKey = 'skipAuth';
  static Options skipAuthOption = Options(extra: {skipAuthExtraKey: true});
}

extension DioOptionsExtension on Options {
  Options addRequiresAuthorizationHeader() {
    return copyWith(
      extra: {
        ...?extra,
        DioHelperMixin.requiresAuthorizationExtraKey: true,
      },
    );
  }
}

extension DioRequestOptionsExtension on RequestOptions {
  bool get doesRequireAuthorization {
    return extra[DioHelperMixin.requiresAuthorizationExtraKey] == true;
  }

  bool get shouldSkipAuth {
    return extra[DioHelperMixin.skipAuthExtraKey] == true;
  }
}
