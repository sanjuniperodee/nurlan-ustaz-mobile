import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio/dio_for_native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nurlan_ustaz_flutter/core/data/interceptors/auth_interceptor.dart';
import 'package:nurlan_ustaz_flutter/core/data/interceptors/exception_mapper_interceptor.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/core/data/interceptors/no_connection_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locator_service.config.dart';

@InjectableInit()
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt
    ..registerFactory(() => FlutterSecureStorage())
    ..registerLazySingleton(() => sharedPreferences)
    ..registerLazySingleton<Dio>(
      () => CustomExceptionDio(
        BaseOptions(
          baseUrl: EndPoints.apiUrl,
          headers: {HttpHeaders.acceptHeader: ContentType.json},
        ),
      ),
    )
    ..registerFactory(Connectivity.new);
  //
  await getIt.init();
  //
  getIt.get<Dio>().interceptors.addAll([
    NoConnectionInterceptor(
      client: getIt.get(),
      connectionService: getIt.get(),
    ),
    AuthInterceptor(
      authLocalDs: getIt.get(),
      authRemoteDs: getIt.get(),
      client: getIt.get(),
      tokenIsExpiredCallback: Jwt.isExpired,
    ),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
    ),
    const ExceptionMapperInterceptor(),
  ]);
}

final class CustomExceptionDio extends DioForNative {
  CustomExceptionDio([super.baseOptions]);

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    try {
      return await super.fetch<T>(requestOptions);
    } catch (e) {
      if (e is DioException) {
        final customException = e.error;
        if (customException != null) throw customException;
      }

      rethrow;
    }
  }
}
