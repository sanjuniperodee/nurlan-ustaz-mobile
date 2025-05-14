import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:nurlan_ustaz_flutter/core/platform/auth_interceptor.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/no_connection_interceptor.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/app_bloc.dart';
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
    ..registerLazySingleton(() => Dio()
      ..options = BaseOptions(
        baseUrl: EndPoints.apiUrl,
        headers: {HttpHeaders.acceptHeader: ContentType.json},
      ))
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
      onUnauthorizedHit: () =>
          getIt.get<AppBloc>().add(AppEvent.nonAuthorized()),
    ),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
    ),
  ]);
}
