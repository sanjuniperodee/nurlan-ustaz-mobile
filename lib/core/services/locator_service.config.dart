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
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/app/bloc/app_bloc.dart' as _i15;
import '../../features/app/bloc/other_list_bloc/language_cubit.dart' as _i11;
import '../../features/app/logic/not_auth_logic.dart' as _i12;
import '../../features/auth/data/datasource/local/auth_local_ds.dart' as _i3;
import '../../features/auth/data/datasource/remote/auth_remote_ds.dart' as _i5;
import '../../features/auth/data/repositories/auth_repository.dart' as _i7;
import '../../features/Islam_teaching/data/datasource/local/Islam_teaching_local_ds.dart'
    as _i8;
import '../../features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart'
    as _i9;
import '../../features/Islam_teaching/data/repositories/Islam_teaching_repository.dart'
    as _i10;
import '../../features/tus_zhoru/cubit/tus_zhoru_cubit.dart' as _i13;
import '../../features/tus_zhoru/cubit/tus_zhoru_state.dart' as _i14;
import '../platform/dio_wrapper.dart' as _i6;

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
    gh.singleton<_i10.IslamTeachingRepository>(_i10.IslamTeachingRepositoryImpl(
      remoteDS: gh<_i5.AuthRemoteDs>(),
      localDS: gh<_i3.AuthLocalDs>(),
    ));
    gh.singleton<_i11.LanguageCubit>(
        _i11.LanguageCubit(gh<_i7.AuthRepository>()));
    gh.singleton<_i12.NotAuthLogic>(_i12.NotAuthLogic());
    gh.factory<_i13.TusZhoruCubit>(
        () => _i13.TusZhoruCubit(gh<_i14.TusZhoruState>()));
    gh.singleton<_i15.AppBloc>(_i15.AppBloc(
      gh<_i7.AuthRepository>(),
      gh<_i12.NotAuthLogic>(),
    ));
    return this;
  }
}
