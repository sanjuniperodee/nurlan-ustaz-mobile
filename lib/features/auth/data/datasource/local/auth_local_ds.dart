import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
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
    required TokenDTO token,
  });

  String getLocale();

  TokenDTO getTokenFromCache();
  Future<TokenDTO?> getTokenFromCacheNull();
  Future<void> removeUserFromCache();
  Future<TokenDTO> refreshJwt({
    required TokenDTO token,
  });
  Future<bool> verifyJwt({required String accessToken});
}

@Injectable(as: AuthLocalDs)
class AuthLocalDsImpl extends AuthLocalDs {
  final SharedPreferences sharedPreferences;

  AuthLocalDsImpl({required this.sharedPreferences});

  @override
  Future<TokenDTO> refreshJwt({
    required TokenDTO token,
  }) async {
    try {
      Dio dio = Dio(
        BaseOptions(
          baseUrl: SERVER_.trim() + '',
        ),
      );

      final response = await dio.post(
        EndPoints.refreshToken,
        data: {
          'refresh': token.refresh,
        },
      );
      saveToken(token: TokenDTO.fromJson(response.data));
      log('refreshJwt::::${TokenDTO.fromJson(response.data).toString()}');
      return TokenDTO.fromJson(response.data);
    } catch (e) {
      log('REFRESH EXCEPTION::::${e}');
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> verifyJwt({required String accessToken}) async {
    try {
      Dio dio = Dio(
        BaseOptions(
          baseUrl: SERVER_.trim() + '',
        ),
      );
      // dio.options.headers = {'Authorization': 'Bearer $accessToken'};
      final response = await dio.post(
        EndPoints.verifyToken,
        data: {
          'token': accessToken,
        },
      );
      log('TESTMADII');
      return true;
    } catch (e) {
      log('TOKEN EXCEPTION::::${e.toString()}');
      return false;
    }
  }

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
  Future<void> saveToken({required TokenDTO token}) async {
    await sharedPreferences.setString(
        SharedKeys.TOKEN, jsonEncode(token.toJson()));
    log('saveToken"""""${jsonEncode(token.toJson())}');
  }

  @override
  TokenDTO getTokenFromCache() {
    try {
      final token = sharedPreferences.get(SharedKeys.TOKEN);
      if (token != null) {
        log('____________TOKEN${token.toString()}');
        return TokenDTO.fromJson(
          jsonDecode(token.toString()) as Map<String, dynamic>,
        );
      } else {
        throw CacheException(message: 'В кэше нет запрашиваемые данные');
      }
    } catch (e) {
      log('AuthLocalDSImpl:: ${e.runtimeType == CacheException ? (e as CacheException).message : e}');
      throw CacheException(message: 'В кэше нет запрашиваемые данные');
    }
  }

  @override
  Future<TokenDTO?> getTokenFromCacheNull() async {
    try {
      log('TOKEN:::${sharedPreferences.get(SharedKeys.TOKEN).toString()}');

      TokenDTO? token = TokenDTO.fromJson(
        jsonDecode(sharedPreferences.get(SharedKeys.TOKEN).toString())
            as Map<String, dynamic>,
      );

      log(token.access!);
      if (token != null) {
        log('TOKEN ECTTTT!');
        bool verifyJwtBool = false;

        try {
          verifyJwtBool = await verifyJwt(accessToken: token.access!);
        } catch (e) {
          log(' verifyJwtBoolERROR:::${e.toString()}');
        }

        log('VERBOOLL:::${verifyJwtBool.toString()}');
        if (verifyJwtBool == true) {
          // log();
          return token;
        } else {
          token = await refreshJwt(token: token);
          log('NEWACCESTOK:::::${token.access.toString()}');
        }
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
    sharedPreferences.remove(SharedKeys.TOKEN);
  }
}
