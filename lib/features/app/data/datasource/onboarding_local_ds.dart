import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:re_seedwork/re_seedwork.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDs extends ValueStore<bool> {
  Future<bool> wasOnboardingShowed();

  Future<void> markOnboardingShowed();
}

@Singleton(as: OnboardingLocalDs)
final class OnboardingLocalDsImpl extends InMemoryValueStore<bool>
    implements OnboardingLocalDs {
  OnboardingLocalDsImpl({required this.prefs})
      : super(prefs.getBool(kWasOnboardingShowedKey) ?? false);

  @visibleForTesting
  static const kWasOnboardingShowedKey = 'WasOnboardingShowed';

  @protected
  final SharedPreferences prefs;

  @override
  Future<void> markOnboardingShowed() async {
    await prefs.setBool(kWasOnboardingShowedKey, true);
    add(true);
  }

  @override
  Future<bool> wasOnboardingShowed() async => data;
}
