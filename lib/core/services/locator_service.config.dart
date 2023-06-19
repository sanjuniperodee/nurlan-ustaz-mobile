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
import '../../features/home/presentation/bloc/charities_cubit.dart' as _i37;
import '../../features/home/presentation/bloc/comment_news_cubit.dart' as _i38;
import '../../features/home/presentation/bloc/comment_news_like_cubit.dart'
    as _i39;
import '../../features/home/presentation/bloc/comment_news_post_cubit.dart'
    as _i40;
import '../../features/home/presentation/bloc/comment_sem_cubit.dart' as _i41;
import '../../features/home/presentation/bloc/comment_sem_like_cubit.dart'
    as _i42;
import '../../features/home/presentation/bloc/comment_sem_post_cubit.dart'
    as _i43;
import '../../features/home/presentation/bloc/lives_cubit.dart' as _i18;
import '../../features/home/presentation/bloc/lives_fav_cubit.dart' as _i19;
import '../../features/home/presentation/bloc/news_cubit.dart' as _i21;
import '../../features/home/presentation/bloc/news_detail_cubit.dart' as _i22;
import '../../features/home/presentation/bloc/news_fav_cubit.dart' as _i23;
import '../../features/home/presentation/bloc/news_like_cubit.dart' as _i24;
import '../../features/home/presentation/bloc/partners_cubit.dart' as _i25;
import '../../features/home/presentation/bloc/post_service_cubit.dart' as _i27;
import '../../features/home/presentation/bloc/seminar_cubit.dart' as _i28;
import '../../features/home/presentation/bloc/seminar_detail_cubit.dart'
    as _i29;
import '../../features/home/presentation/bloc/seminar_fav_cubit.dart' as _i30;
import '../../features/home/presentation/bloc/seminar_like_cubit.dart' as _i31;
import '../../features/home/presentation/bloc/services_cubit.dart' as _i32;
import '../../features/Islam_teaching/data/datasource/local/Islam_teaching_local_ds.dart'
    as _i9;
import '../../features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart'
    as _i10;
import '../../features/Islam_teaching/data/repositories/Islam_teaching_repository.dart'
    as _i17;
import '../../features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart'
    as _i36;
import '../../features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart'
    as _i44;
import '../../features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart'
    as _i45;
import '../../features/Islam_teaching/presentation/bloc/duas_cubit.dart'
    as _i46;
import '../../features/Islam_teaching/presentation/bloc/duas_favorite_cubit.dart'
    as _i47;
import '../../features/Islam_teaching/presentation/bloc/islam_names_cubit.dart'
    as _i48;
import '../../features/Islam_teaching/presentation/bloc/islam_names_favorite_cubit.dart'
    as _i49;
import '../../features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart'
    as _i20;
import '../../features/Islam_teaching/presentation/bloc/pillars_cubit.dart'
    as _i26;
import '../../features/Islam_teaching/presentation/bloc/surah_cubit.dart'
    as _i33;
import '../../features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart'
    as _i34;
import '../../features/tandaulilar/presentation/bloc/tandaulilar_cubit.dart'
    as _i35;
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
    gh.singleton<_i18.LivesCubit>(_i18.LivesCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i19.LivesFavCubit>(
        _i19.LivesFavCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i20.NamesOfAllahCubit>(
        _i20.NamesOfAllahCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i21.NewsCubit>(_i21.NewsCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i22.NewsDetailCubit>(
        _i22.NewsDetailCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i23.NewsFavCubit>(
        _i23.NewsFavCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i24.NewsLikeCubit>(
        _i24.NewsLikeCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i25.PartnersCubit>(
        _i25.PartnersCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i26.PillarsCubit>(
        _i26.PillarsCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i27.PostServiceCubit>(
        _i27.PostServiceCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i28.SeminarCubit>(
        _i28.SeminarCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i29.SeminarDetailCubit>(
        _i29.SeminarDetailCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i30.SeminarFavCubit>(
        _i30.SeminarFavCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i31.SeminarLikeCubit>(
        _i31.SeminarLikeCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i32.ServicesCubit>(
        _i32.ServicesCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i33.SurahCubit>(
        _i33.SurahCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i34.SurahFavoriteCubit>(
        _i34.SurahFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i35.TandaulilarCubit>(
        _i35.TandaulilarCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i36.AyatOfDayCubit>(
        _i36.AyatOfDayCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i37.CharitiesCubit>(
        _i37.CharitiesCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i38.CommentNewsCubit>(
        _i38.CommentNewsCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i39.CommentNewsLikeCubit>(
        _i39.CommentNewsLikeCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i40.CommentNewsPostCubit>(
        _i40.CommentNewsPostCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i41.CommentSemCubit>(
        _i41.CommentSemCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i42.CommentSemLikeCubit>(
        _i42.CommentSemLikeCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i43.CommentSemPostCubit>(
        _i43.CommentSemPostCubit(gh<_i16.HomeRepository>()));
    gh.singleton<_i44.DhikrsCubit>(
        _i44.DhikrsCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i45.DhikrsFavoriteCubit>(
        _i45.DhikrsFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i46.DuasCubit>(
        _i46.DuasCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i47.DuasFavoriteCubit>(
        _i47.DuasFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i48.IslamNamesCubit>(
        _i48.IslamNamesCubit(gh<_i17.IslamTeachingRepository>()));
    gh.singleton<_i49.IslamNamesFavoriteCubit>(
        _i49.IslamNamesFavoriteCubit(gh<_i17.IslamTeachingRepository>()));
    return this;
  }
}
