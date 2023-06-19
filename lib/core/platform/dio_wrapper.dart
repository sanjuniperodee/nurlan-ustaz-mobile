import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/not_auth_logic.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
    // Prefs prefs = Prefs();
    // final TokenModel? tokenModel = await prefs.getTokenFromCacheNull();
    // final String locale = _authLocalDS.getLocale();

    // if (tokenModel?.access != null) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2OTgyNTU3LCJpYXQiOjE2ODY4OTYxNTcsImp0aSI6IjcyMDRhZjdhMDJlZjRiYTg4YWE0YWY1ZmE2ZTYyM2U2IiwidXNlcl9pZCI6M30.PYVhLwpWxg_kInoQmX-ziNwf0R1jUND11P5gbyUm9Qc';
    // }
    options.headers['Accept'] = "application/json";
    // options.headers['Content-Language'] = locale.replaceAll('kk', 'kz');
    super.onRequest(options, handler);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    getIt<NotAuthLogic>().statusSubject.add(err.response?.statusCode ?? 0);
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
