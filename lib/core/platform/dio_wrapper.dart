import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/not_auth_logic.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'cache_helper/prefs.dart';

class DioWrapper {
  final AuthLocalDs _authLocalDS;

  Dio dio = Dio(BaseOptions(baseUrl: SERVER_));

  Dio get instance => dio;

  void path(String path) {
    dio = Dio(
      BaseOptions(baseUrl: SERVER_.trim() + path.trim()),
    )..interceptors.addAll([
        _KausarDioInterceptor(
          _authLocalDS,
        ),

        // LogInterceptor(
        //   request: true,
        //   requestBody: true,
        //   requestHeader: true,
        //   responseBody: true,
        //   responseHeader: false,
        //   error: true,
        // ),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: false,
          // ignore: avoid_redundant_argument_values
          responseHeader: false,
          // ignore: avoid_redundant_argument_values
          compact: true,
        ),
      ]);
  }

  DioWrapper(this._authLocalDS) {
    dio.interceptors.addAll([
      _KausarDioInterceptor(_authLocalDS),
      // LogInterceptor(
      //   request: true,
      //   requestBody: true,
      //   requestHeader: true,
      //   responseBody: true,
      //   responseHeader: false,
      //   error: true,
      // ),
    ]);
  }
}

class _KausarDioInterceptor extends Interceptor {
  final AuthLocalDs _authLocalDS;

  _KausarDioInterceptor(this._authLocalDS);

  Dio dio = Dio(BaseOptions(baseUrl: SERVER_));

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String locale = _authLocalDS.getLocale();

    try {
      TokenDTO? tokenDto = await _authLocalDS.getTokenFromCacheNull();
      log('!!1111');
      if (tokenDto != null) {
        print('------------------------------${tokenDto.access}');
        options.headers['Authorization'] = 'Bearer ${tokenDto.access}';
      }
    } catch (e) {
      log('ERROR:::${e.toString()}');
    } finally {
      options.headers['Accept'] = "application/json";
      options.headers['Accept-Language'] = locale.replaceAll('kz', 'kk');
      super.onRequest(options, handler);
    }
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    getIt<NotAuthLogic>().statusSubject.add(err.response?.statusCode ?? 0);
    // AuthRepository _authRepository = getIt<AuthRepository>();
    // final TokenDTO? tokenDto = _authLocalDS.getTokenFromCacheNull();
    // if (err.response!.statusCode == 401) {
    //   // log(token.refresh.toString());
    //   log('TEST2.toString()');
    //   await _authRepository.refreshToken(refreshToken: tokenDto!.refresh ?? '');
    // }

    if ((err.response?.statusCode ?? 0) == HttpStatus.unauthorized) {
      getIt<NotAuthLogic>().statusSubject.add(401);

      // try {
      //   // await refreshToken();
      // } on DioError {
      //   rethrow;
      // }
    } else if ((err.response?.statusCode ?? 0) ==
        HttpStatus.unprocessableEntity) {
      // try {
      //   await refreshToken();
      // } on DioError catch (e) {
      //   throw e;
      // }
    } else if ((err.response?.statusCode ?? 0) == HttpStatus.notFound) {
      // getIt<NotFoundLogic>().statusSubject.add(404);
    }
    return super.onError(err, handler);
  }
}
