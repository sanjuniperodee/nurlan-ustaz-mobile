// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/app/bloc/app_bloc.dart' as _i15;
import '../../features/app/bloc/other_list_bloc/language_cubit.dart' as _i11;
import '../../features/app/logic/not_auth_logic.dart' as _i14;
import '../../features/auth/data/datasource/local/auth_local_ds.dart' as _i3;
import '../../features/auth/data/datasource/remote/auth_remote_ds.dart' as _i5;
import '../../features/auth/data/repositories/auth_repository.dart' as _i7;
import '../../features/home/data/datasource/remote/home_remote_ds.dart' as _i8;
import '../../features/home/data/repositories/home_repository.dart' as _i16;
import '../../features/home/presentation/bloc/news_cubit.dart' as _i19;
import '../../features/Islam_teaching/data/datasource/local/Islam_teaching_local_ds.dart'
    as _i9;
import '../../features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart'
    as _i10;
import '../../features/Islam_teaching/data/repositories/Islam_teaching_repository.dart'
    as _i17;
import '../../features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart'
    as _i23;
import '../../features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart'
    as _i24;
import '../../features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart'
    as _i25;
import '../../features/Islam_teaching/presentation/bloc/duas_cubit.dart'
    as _i26;
import '../../features/Islam_teaching/presentation/bloc/duas_favorite_cubit.dart'
    as _i27;
import '../../features/Islam_teaching/presentation/bloc/islam_names_cubit.dart'
    as _i28;
import '../../features/Islam_teaching/presentation/bloc/islam_names_favorite_cubit.dart'
    as _i29;
import '../../features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart'
    as _i18;
import '../../features/Islam_teaching/presentation/bloc/pillars_cubit.dart'
    as _i20;
import '../../features/Islam_teaching/presentation/bloc/surah_cubit.dart'
    as _i21;
import '../../features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart'
    as _i22;
import '../platform/dio_wrapper.dart' as _i6;
import '../platform/network_info.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthLocalDs>(() =>
        _i3.AuthLocalDsImpl(sharedPreferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i5.AuthRemoteDs>(
        () => _i5.AuthRemoteDsImpl(gh<_i6.DioWrapper>()));
    gh.singleton<_i7.AuthRepository>(_i7.AuthRepositoryImpl(
      remoteDS: gh<_i5.AuthRemoteDs>(),
      localDS: gh<_i3.AuthLocalDs>(),
    ));
    gh.factory<_i8.HomeRemoteDs>(
        () => _i8.HomeRemoteDsImpl(gh<_i6.DioWrapper>()));
    gh.factory<_i9.IslamTeachingLocalDs>(() => _i9.IslamTeachingLocalDsImpl(
        sharedPreferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i10.IslamTeachingRemoteDs>(
        () => _i10.IslamTeachingRemoteDsImpl(gh<_i6.DioWrapper>()));
    gh.singleton<_i11.LanguageCubit>(
        _i11.LanguageCubit(gh<_i7.AuthRepository>()));
    gh.singleton<_i12.NetworkInfo>(
        _i12.NetworkInfoImp(gh<_i13.InternetConnectionChecker>()));
    gh.singleton<_i14.NotAuthLogic>(_i14.NotAuthLogic());
    gh.singleton<_i15.AppBloc>(_i15.AppBloc(
      gh<_i7.AuthRepository>(),
      gh<_i14.NotAuthLogic>(),
    ));
    gh.singleton<_i16.HomeRepository>(_i16.HomeRepositoryImpl(
      remoteDS: gh<_i8.HomeRemoteDs>(),
      networkInfo: gh<_i12.NetworkInfo>(),
    ));
    gh.singleton<_i17.IslamTeachingRepository>(_i17.IslamTeachingRepositoryImpl(
      remoteDS: gh<_i10.IslamTeachingRemoteDs>(),
      networkInfo: gh<_i12.NetworkInfo>(),
    ));
    gh.singleton<_i18.NamesOfAllahCubit>(
        _i18.NamesOfAllahCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i19.NewsCubit>(_i19.NewsCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i20.PillarsCubit>(
        _i20.PillarsCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i21.SurahCubit>(
        _i21.SurahCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i22.SurahFavoriteCubit>(
        _i22.SurahFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i23.AyatOfDayCubit>(
        _i23.AyatOfDayCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i24.DhikrsCubit>(
        _i24.DhikrsCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i25.DhikrsFavoriteCubit>(
        _i25.DhikrsFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i26.DuasCubit>(
        _i26.DuasCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i27.DuasFavoriteCubit>(
        _i27.DuasFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i28.IslamNamesCubit>(
        _i28.IslamNamesCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i29.IslamNamesFavoriteCubit>(
        _i29.IslamNamesFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    return this;
  }
}
