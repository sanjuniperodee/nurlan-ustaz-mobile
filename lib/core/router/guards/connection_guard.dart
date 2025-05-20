part of '../app_router.dart';

final class ConnectionGuard extends AutoRouteGuard {
  const ConnectionGuard({required this.connectionService});

  @protected
  final ConnectionService connectionService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (connectionService.data) return resolver.next();
    unawaited(resolver.redirectUntil(const NoConnectionRoute()));
    unawaited(
      connectionService.firstWhere((element) => element).then((value) {
        resolver.next();
      }),
    );
  }
}
