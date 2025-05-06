import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../platform/dio_wrapper.dart';
import 'locator_service.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

Future<void> initLocator() async {
  // BLoC / Cubit

  //Auth
  // sl.registerFactory(() => LanguageCubit(sl()));

  ///
  ///
  // /// Core
  // getIt.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImp(getIt()),
  // );
  // getIt.registerLazySingleton<NotAuthLogic>(
  //   () => NotAuthLogic(),
  // );

  ///
  ///
  /// Repository

  ///
  ///
  /// DS
  // getIt.registerLazySingleton<AuthRemoteDs>(
  //   () => AuthRemoteDsImpl(getIt()),
  // );

  ///
  ///
  // /// LS
  // getIt.registerLazySingleton<AuthLocalDs>(
  //   () => AuthLocalDsImpl(sharedPreferences: getIt()),
  // );x

  ///
  ///
  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  // getIt.registerLazySingleton(() => APIRequester(d));
  getIt.registerLazySingleton(() => DioWrapper(getIt<AuthLocalDs>()));
  getIt.registerLazySingleton(() => InternetConnectionChecker.instance);
  configureDependencies();
  // sl.registerLazySingleton(() => AppRouter());
}
