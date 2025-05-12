import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDs {
  Future<bool> getOnboardingStatusFromCache();

  Future<void> saveOnboardingStatusToCache({
    required bool isOnboarding,
  });

  Future<void> saveLocale({
    required String locale,
  });

  Future<void> saveToken(TokenDTO token);

  Future<void> saveUser({
    required UserDto user,
  });
  String getLocale();

  // TokenDTO getTokenFromCache();
  Future<UserDto?> getUserFromCacheNull();
  Future<TokenDTO?> getTokenFromCacheNull();
  Future<void> removeUserFromCache();
  // Future<TokenDTO> refreshJwt({
  //   required TokenDTO token,
  // });
  // Future<bool> verifyJwt({required String accessToken});
}

@Injectable(as: AuthLocalDs)
class AuthLocalDsImpl extends AuthLocalDs {
  AuthLocalDsImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  }) : _token = null;

  final SharedPreferences sharedPreferences;

  final FlutterSecureStorage secureStorage;

  Option<TokenDTO>? _token;

  // @override
  // Future<TokenDTO> refreshJwt({
  //   required TokenDTO token,
  // }) async {
  //   try {
  //     Dio dio = Dio(
  //       BaseOptions(
  //         baseUrl: SERVER_.trim(),
  //       ),
  //     );

  //     final response = await dio.post(
  //       EndPoints.refreshToken,
  //       data: {
  //         'refresh': token.refresh,
  //       },
  //     );
  //     saveToken(token: TokenDTO.fromJson(response.data));
  //     log('refreshJwt::::${TokenDTO.fromJson(response.data).toString()}');

  //     return TokenDTO.fromJson(response.data);
  //   } catch (e) {
  //     log('REFRESH EXCEPTION::::$e');
  //     throw ServerException(message: e.toString());
  //   }
  // }

  // @override
  // Future<bool> verifyJwt({required String accessToken}) async {
  //   try {
  //     Dio dio = Dio(
  //       BaseOptions(
  //         baseUrl: SERVER_.trim(),
  //       ),
  //     );
  //     // dio.options.headers = {'Authorization': 'Bearer $accessToken'};
  //      await dio.post(
  //       EndPoints.verifyToken,
  //       data: {
  //         'token': accessToken,
  //       },
  //     );
  //     log('TESTMADII');
  //     return true;
  //   } catch (e) {
  //     log('TOKEN EXCEPTION::::${e.toString()}');
  //     return false;
  //   }
  // }

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
        return 'kk'; // default locale
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
  Future<void> saveToken(TokenDTO token) async {
    _token = Some(token);
    await secureStorage.write(
      key: SharedKeys.TOKEN,
      value: jsonEncode(token.toJson()),
    );
  }

  @override
  Future<void> saveUser({required UserDto user}) async {
    await secureStorage.write(
      key: SharedKeys.USER,
      value: jsonEncode(user.toJson()),
    );
  }

  @override
  Future<UserDto?> getUserFromCacheNull() async {
    final string = await secureStorage.read(key: SharedKeys.USER);

    if (string == null) return null;

    return UserDto.fromJson(jsonDecode(string));
    // try {
    //   UserDto? token = UserDto.fromJson(
    //     jsonDecode(sharedPreferences.get(SharedKeys.USER).toString())
    //         as Map<String, dynamic>,
    //   );

    //   return token;
    // } catch (e) {
    //   log('AuthLocalDSImpl getUserFromCacheNull:: $e');
    //   throw CacheException(message: 'В кэше нет запрашиваемые данные');
    // }
  }

  @override
  Future<TokenDTO?> getTokenFromCacheNull() async {
    if (_token == null) {
      final string = await secureStorage.read(key: SharedKeys.TOKEN);

      if (string == null) return null;

      _token = Some(TokenDTO.fromJson(jsonDecode(string)));
    }

    return _token?.toNullable();

    // try {
    //   // log('TOKEN:::${sharedPreferences.get(SharedKeys.TOKEN).toString()}');

    //   TokenDTO? token = TokenDTO.fromJson(
    //     jsonDecode(sharedPreferences.get(SharedKeys.TOKEN).toString())
    //         as Map<String, dynamic>,
    //   );

    //   log(token.access!.toString());
    //   if (token != null) {
    //     log('TOKEN ECTTTT!');
    //     bool verifyJwtBool = false;

    //     try {
    //       verifyJwtBool = await verifyJwt(accessToken: token.access!);
    //     } catch (e) {
    //       log(' verifyJwtBoolERROR:::${e.toString()}');
    //     }

    //     log('VERBOOLL:::${verifyJwtBool.toString()}');
    //     if (verifyJwtBool == true) {
    //       return token;
    //     } else {
    //       token = await refreshJwt(token: token);
    //       log('NEWACCESTOK:::::${token.access.toString()}');
    //     }
    //     return token;
    //   }
    //   return null;
    // } catch (e) {
    //   log('AuthLocalDSImpl getUserFromCacheNull:: $e');
    //   throw CacheException(message: 'В кэше нет запрашиваемые данные');
    // }
  }

  @override
  Future<void> removeUserFromCache() async {
    secureStorage.delete(key: SharedKeys.TOKEN);
    secureStorage.delete(key: SharedKeys.USER);
    _token = const None();
    // sharedPreferences.remove(SharedKeys.USER_FROM_CACHE);
  }
}
