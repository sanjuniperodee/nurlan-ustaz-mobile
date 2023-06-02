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
    as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/app/bloc/app_bloc.dart' as _i16;
import '../../features/app/bloc/other_list_bloc/language_cubit.dart' as _i10;
import '../../features/app/logic/not_auth_logic.dart' as _i13;
import '../../features/auth/data/datasource/local/auth_local_ds.dart' as _i3;
import '../../features/auth/data/datasource/remote/auth_remote_ds.dart' as _i5;
import '../../features/auth/data/repositories/auth_repository.dart' as _i7;
import '../../features/Islam_teaching/data/datasource/local/Islam_teaching_local_ds.dart'
    as _i8;
import '../../features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart'
    as _i9;
import '../../features/Islam_teaching/data/repositories/Islam_teaching_repository.dart'
    as _i17;
import '../../features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart'
    as _i22;
import '../../features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart'
    as _i23;
import '../../features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart'
    as _i24;
import '../../features/Islam_teaching/presentation/bloc/duas_cubit.dart'
    as _i25;
import '../../features/Islam_teaching/presentation/bloc/duas_favorite_cubit.dart'
    as _i26;
import '../../features/Islam_teaching/presentation/bloc/islam_names_cubit.dart'
    as _i27;
import '../../features/Islam_teaching/presentation/bloc/islam_names_favorite_cubit.dart'
    as _i28;
import '../../features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart'
    as _i18;
import '../../features/Islam_teaching/presentation/bloc/pillars_cubit.dart'
    as _i19;
import '../../features/Islam_teaching/presentation/bloc/surah_cubit.dart'
    as _i20;
import '../../features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart'
    as _i21;
import '../../features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart'
    as _i14;
import '../../features/tus_zhoru/presentation/bloc/tus_zhoru_state.dart'
    as _i15;
import '../platform/dio_wrapper.dart' as _i6;
import '../platform/network_info.dart' as _i11;

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
    gh.factory<_i8.IslamTeachingLocalDs>(() => _i8.IslamTeachingLocalDsImpl(
        sharedPreferences: gh<_i4.SharedPreferences>()));
    gh.factory<_i9.IslamTeachingRemoteDs>(
        () => _i9.IslamTeachingRemoteDsImpl(gh<_i6.DioWrapper>()));
    gh.singleton<_i10.LanguageCubit>(
        _i10.LanguageCubit(gh<_i7.AuthRepository>()));
    gh.singleton<_i11.NetworkInfo>(
        _i11.NetworkInfoImp(gh<_i12.InternetConnectionChecker>()));
    gh.singleton<_i13.NotAuthLogic>(_i13.NotAuthLogic());
    gh.factory<_i14.TusZhoruCubit>(
        () => _i14.TusZhoruCubit(gh<_i15.TusZhoruState>()));
    gh.singleton<_i16.AppBloc>(_i16.AppBloc(
      gh<_i7.AuthRepository>(),
      gh<_i13.NotAuthLogic>(),
    ));
    gh.singleton<_i17.IslamTeachingRepository>(_i17.IslamTeachingRepositoryImpl(
      remoteDS: gh<_i9.IslamTeachingRemoteDs>(),
      networkInfo: gh<_i11.NetworkInfo>(),
    ));
    gh.singleton<_i18.NamesOfAllahCubit>(
        _i18.NamesOfAllahCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i19.PillarsCubit>(
        _i19.PillarsCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i20.SurahCubit>(
        _i20.SurahCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i21.SurahFavoriteCubit>(
        _i21.SurahFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i22.AyatOfDayCubit>(
        _i22.AyatOfDayCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i23.DhikrsCubit>(
        _i23.DhikrsCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i24.DhikrsFavoriteCubit>(
        _i24.DhikrsFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i25.DuasCubit>(
        _i25.DuasCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i26.DuasFavoriteCubit>(
        _i26.DuasFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i27.IslamNamesCubit>(
        _i27.IslamNamesCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i28.IslamNamesFavoriteCubit>(
        _i28.IslamNamesFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    return this;
  }
}
