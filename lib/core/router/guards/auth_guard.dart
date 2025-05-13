part of '../app_router.dart';

final class AuthGuard extends AutoRouteGuard {
  const AuthGuard({required this.authLocalDs});

  @protected
  final AuthLocalDs authLocalDs;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final token = await authLocalDs.getTokenFromCacheNull();
    if (token != null) return resolver.next();
    unawaited(resolver.redirectUntil(const MainRouterPage()));
    unawaited(
      authLocalDs.firstWhere((token) => token != null).then(
            (value) => resolver.next(),
          ),
    );
  }
}
