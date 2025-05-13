part of '../app_router.dart';

final class OnboardingGuard extends AutoRouteGuard {
  const OnboardingGuard({required this.onboardingLocalDs});

  @protected
  final OnboardingLocalDs onboardingLocalDs;

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final wasShowed = await onboardingLocalDs.wasOnboardingShowed();
    if (wasShowed) return resolver.next();
    unawaited(resolver.redirectUntil(const OnBoardingRoute()));
    unawaited(
      onboardingLocalDs.firstWhere((wasShowed) => wasShowed).then(
            (value) => resolver.next(),
          ),
    );
  }
}
