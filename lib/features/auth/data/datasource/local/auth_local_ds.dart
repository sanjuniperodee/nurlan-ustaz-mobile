import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDs {
  Future<bool> getOnboardingStatusFromCache();

  Future<void> saveOnboardingStatusToCache({
    required bool isOnboarding,
  });

  Future<void> saveLocale({
    required String locale,
  });

  Future<void> saveToken({
    required String token
  });

  String getLocale();

  String? getToken();
  Future<void> removeUserFromCache();


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
  String getLocale() {
    try {
      final String? locale = sharedPreferences.getString(SharedKeys.APP_LOCALE);
      if (locale == null) {
        return 'ru'; // default locale
      }
      return locale;
    } catch (e) {
      log('##### getLocale::: $e AppLocale не был найден в кэше');
      throw CacheException(message: 'AppLocale не был найден в кэше');
    }
  }

  @override
  Future<void> saveLocale({required String locale}) async {
    await sharedPreferences.setString(SharedKeys.APP_LOCALE, locale);
  }

  @override
  Future<void> saveOnboardingStatusToCache({required bool isOnboarding}) async {
    sharedPreferences.setBool(SharedKeys.IS_ONBOARDING, isOnboarding);

    // if onboarding true i open login/reg page
    // else when onboarding false or null i show onboarding screen
  }

  @override
  Future<void> saveToken({required String token}) async {
    sharedPreferences.setString(
        SharedKeys.ACCESS_TOKEN, token);
  }

  @override
  String? getToken() {
    try {
      final  token = sharedPreferences.getString(SharedKeys.ACCESS_TOKEN);
      if (token != null) {
        return token;
      }
      return null;
    } catch (e) {
      log('AuthLocalDSImpl getUserFromCacheNull:: $e');
      throw CacheException(message: 'В кэше нет запрашиваемые данные');
    }
  }

  @override
  Future<void> removeUserFromCache() async {
    sharedPreferences.remove(SharedKeys.ACCESS_TOKEN);

  }
}