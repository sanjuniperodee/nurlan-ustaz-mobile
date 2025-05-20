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
    final token = await authLocalDs.getToken();
    if (token.isPresent) return resolver.next();
    final goToAuth = await router.push<bool>(AuthRequiredDialogRoute());
    if (goToAuth == true) {
      await resolver.redirectUntil(const AuthorizationRoute());
      final token = await authLocalDs.getToken();
      if (token.isPresent) return resolver.next();
    }
    return resolver.next(false);
  }
}
