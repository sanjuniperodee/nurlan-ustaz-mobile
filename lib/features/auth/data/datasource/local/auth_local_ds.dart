import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDs {
  Future<bool> getOnboardingStatusFromCache();

  Future<void> saveOnboardingStatusToCache({
    required bool isOnboarding,
  });
}

@Injectable(as: AuthLocalDs)
class AuthLocalDsImpl extends AuthLocalDs {
  final SharedPreferences sharedPreferences;

  AuthLocalDsImpl({required this.sharedPreferences});

  @override
  Future<bool> getOnboardingStatusFromCache() async {
    final bool? isOnboarding =
        sharedPreferences.getBool(SharedKeys.IS_ONBOARDING);
    try {
      if (isOnboarding == null) {
        throw CacheException(
          message: 'В кэше нет запрашиваемые данные: isOnboarding',
        );
      } else {
        return isOnboarding;
      }
    } catch (e) {
      throw CacheException(
        message: 'В кэше нет запрашиваемые данные: isOnboarding, $e',
      );
    }
  }

  @override
  Future<void> saveOnboardingStatusToCache({required bool isOnboarding}) async {
    sharedPreferences.setBool(SharedKeys.IS_ONBOARDING, isOnboarding);

    // if onboarding true i open login/reg page
    // else when onboarding false or null i show onboarding screen
  }
}
