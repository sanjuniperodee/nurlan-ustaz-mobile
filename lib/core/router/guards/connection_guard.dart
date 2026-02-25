part of '../app_router.dart';

final class ConnectionGuard extends AutoRouteGuard {
  const ConnectionGuard({required this.connectionService});

  @protected
  final ConnectionService connectionService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final resolved = [false];
    void doNext() {
      if (resolved[0]) return;
      resolved[0] = true;
      resolver.next();
    }

    if (connectionService.data) {
      doNext();
      return;
    }
    unawaited(resolver.redirectUntil(const NoConnectionRoute()));
    unawaited(
      connectionService.firstWhere((element) => element).then((_) => doNext()),
    );
  }
}
