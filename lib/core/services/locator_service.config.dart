// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nurlan_ustaz_flutter/core/platform/secure_storage.dart'
    as _i1046;
import 'package:nurlan_ustaz_flutter/core/services/connection_service.dart'
    as _i436;
import 'package:nurlan_ustaz_flutter/features/app/data/datasource/onboarding_local_ds.dart'
    as _i224;
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/bloc/on_boarding_cubit.dart'
    as _i922;
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/data/datasource/on_boarding_ds.dart'
    as _i522;
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/data/repositories/on_boarding_repository.dart'
    as _i66;
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart'
    as _i904;
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart'
    as _i236;
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart'
    as _i716;
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository_impl.dart'
    as _i1051;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/home_local_ds.dart'
    as _i326;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart'
    as _i967;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/charity_remote_ds.dart'
    as _i333;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/comment_remote_ds.dart'
    as _i541;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/home_misc_remote_ds.dart'
    as _i761;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/lives_remote_ds.dart'
    as _i746;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/news_remote_ds.dart'
    as _i911;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/notification_remote_ds.dart'
    as _i759;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/payment_remote_ds.dart'
    as _i377;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/seminar_remote_ds.dart'
    as _i861;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/domain/tell_me_ustaz_remote_ds.dart'
    as _i198;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/home_remote_ds.dart'
    as _i261;
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/profile_remote_ds.dart'
    as _i848;
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart'
    as _i1027;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/change_pass_cubit.dart'
    as _i490;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/charities_cubit.dart'
    as _i816;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_cubit.dart'
    as _i834;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_like_cubit.dart'
    as _i71;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_post_cubit.dart'
    as _i615;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_report_cubit.dart'
    as _i1056;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_cubit.dart'
    as _i178;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_like_cubit.dart'
    as _i962;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_post_cubit.dart'
    as _i666;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/create_seminar_payment_cubit.dart'
    as _i577;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/faq_cubit.dart'
    as _i65;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/geonames_cubit.dart'
    as _i444;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_noti_cubit.dart'
    as _i663;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_cubit.dart'
    as _i638;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_fav_cubit.dart'
    as _i99;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart'
    as _i769;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_detail_cubit.dart'
    as _i332;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_fav_cubit.dart'
    as _i335;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_main_cubit.dart'
    as _i900;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/partners_cubit.dart'
    as _i851;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/payment_tick_cubit.dart'
    as _i10;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/post_service_cubit.dart'
    as _i653;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/prj_info_cubit.dart'
    as _i932;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/profile_notification_cubit.dart'
    as _i210;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_cubit.dart'
    as _i551;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_detail_cubit.dart'
    as _i493;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_fav_cubit.dart'
    as _i56;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/services_cubit.dart'
    as _i906;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/set_city_cubit.dart'
    as _i609;
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart'
    as _i322;
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/cards_cubit.dart'
    as _i892;
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/qr_scanner_cubit.dart'
    as _i757;
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/technical_support_cubit.dart'
    as _i574;
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/calendar_chats_cubit.dart'
    as _i933;
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/today_chat_cubit.dart'
    as _i330;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/datasource/local/Islam_teaching_local_ds.dart'
    as _i788;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/datasource/remote/Islam_teaching_remote_ds.dart'
    as _i105;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart'
    as _i684;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ablutions_cubit.dart'
    as _i343;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart'
    as _i519;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart'
    as _i900;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart'
    as _i139;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dua_detail_cubit.dart'
    as _i698;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_cubit.dart'
    as _i532;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_name_detail_cubit.dart'
    as _i312;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_cubit.dart'
    as _i822;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/namaz_detail_cubit.dart'
    as _i738;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart'
    as _i334;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/pillars_cubit.dart'
    as _i367;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_cubit.dart'
    as _i851;
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart'
    as _i172;
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/bloc/tandaulilar_cubit.dart'
    as _i265;
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/datasource/remote/tus_zhoru_remote_ds.dart'
    as _i426;
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart'
    as _i562;
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/create_tus_zhoru_cubit.dart'
    as _i290;
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/custom_tus_zhoru_details_cubit.dart'
    as _i185;
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart'
    as _i208;
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_details_cubit.dart'
    as _i667;
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/datasources/zhosparym_remote_ds.dart'
    as _i174;
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/repository/zhosparym_repository.dart'
    as _i266;
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/checklist_cubit.dart'
    as _i1043;
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/zhosparym_cubit.dart'
    as _i859;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i861.SeminarRemoteDs>(
        () => _i861.SeminarRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i522.OnBoardingDs>(
        () => _i522.OnBoardingDsImpl(gh<_i361.Dio>()));
    gh.factory<_i105.IslamTeachingRemoteDs>(
        () => _i105.IslamTeachingRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i541.CommentRemoteDs>(
        () => _i541.CommentRemoteDsImpl(gh<_i361.Dio>()));
    gh.singleton<_i66.OnBoardingRepository>(() =>
        _i66.OnBoardingRepositoryImpl(remoteDS: gh<_i522.OnBoardingDs>()));
    gh.factory<_i198.TellMeUstazRemoteDs>(
        () => _i198.TellMeUstazRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i377.PaymentRemoteDs>(
        () => _i377.PaymentRemoteDsImpl(gh<_i361.Dio>()));
    gh.singleton<_i684.IslamTeachingRepository>(() =>
        _i684.IslamTeachingRepositoryImpl(
            remoteDS: gh<_i105.IslamTeachingRemoteDs>()));
    gh.factory<_i761.HomeMiscRemoteDs>(
        () => _i761.HomeMiscRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i333.CharityRemoteDs>(
        () => _i333.CharityRemoteDsImpl(gh<_i361.Dio>()));
    gh.singleton<_i851.SurahCubit>(
        () => _i851.SurahCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i343.AblutionsCubit>(
        () => _i343.AblutionsCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i334.NamesOfAllahCubit>(
        () => _i334.NamesOfAllahCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i519.AyatOfDayCubit>(
        () => _i519.AyatOfDayCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i900.DhikrsCubit>(
        () => _i900.DhikrsCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i139.DhikrsFavoriteCubit>(
        () => _i139.DhikrsFavoriteCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i312.IslamNameDetailCubit>(
        () => _i312.IslamNameDetailCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i532.DuasCubit>(
        () => _i532.DuasCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i367.PillarsCubit>(
        () => _i367.PillarsCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i698.DuaDetailCubit>(
        () => _i698.DuaDetailCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i738.NamazDetailCubit>(
        () => _i738.NamazDetailCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i172.SurahFavoriteCubit>(
        () => _i172.SurahFavoriteCubit(gh<_i684.IslamTeachingRepository>()));
    gh.singleton<_i822.IslamNamesCubit>(
        () => _i822.IslamNamesCubit(gh<_i684.IslamTeachingRepository>()));
    gh.factory<_i911.NewsRemoteDs>(
        () => _i911.NewsRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i174.ZhosparymRemoteDs>(
        () => _i174.ZhosparymRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i426.TusZhoruRemoteDs>(
        () => _i426.TusZhoruRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i746.LivesRemoteDs>(
        () => _i746.LivesRemoteDsImpl(gh<_i361.Dio>()));
    gh.factory<_i759.HomeNotificationRemoteDs>(
        () => _i759.HomeNotificationRemoteDsImpl(gh<_i361.Dio>()));
    gh.singleton<_i236.AuthRemoteDs>(
        () => _i236.AuthRemoteDsImpl(gh<_i361.Dio>()));
    gh.singleton<_i1046.SecureStorage>(() => _i1046.SecureStorage(
          preferences: gh<_i460.SharedPreferences>(),
          secureStorage: gh<_i558.FlutterSecureStorage>(),
        ));
    gh.singleton<_i574.TechnicalSupportCubit>(
        () => _i574.TechnicalSupportCubit(gh<_i460.SharedPreferences>()));
    gh.factory<_i848.ProfileRemoteDs>(
        () => _i848.ProfileRemoteDsImpl(client: gh<_i361.Dio>()));
    gh.factory<_i788.IslamTeachingLocalDs>(() => _i788.IslamTeachingLocalDsImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    await gh.singletonAsync<_i436.ConnectionService>(
      () => _i436.ConnectionServiceImpl.init(
          connectivity: gh<_i895.Connectivity>()),
      preResolve: true,
    );
    gh.factory<_i967.ProfileLocalDs>(() =>
        _i967.ProfileLocalDsImpl(secureStorage: gh<_i1046.SecureStorage>()));
    gh.singleton<_i922.OnBoardingCubit>(
        () => _i922.OnBoardingCubit(gh<_i66.OnBoardingRepository>()));
    gh.factory<_i326.HomeLocalDs>(() => _i326.HomeLocalDsImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    await gh.singletonAsync<_i904.AuthLocalDs>(
      () =>
          _i904.AuthLocalDsImpl.init(secureStorage: gh<_i1046.SecureStorage>()),
      preResolve: true,
    );
    gh.singleton<_i224.OnboardingLocalDs>(() =>
        _i224.OnboardingLocalDsImpl(prefs: gh<_i460.SharedPreferences>()));
    gh.singleton<_i716.AuthRepository>(
        () => _i1051.AuthRepositoryImpl(gh<_i236.AuthRemoteDs>()));
    gh.singleton<_i266.ZhosparymRepository>(() =>
        _i266.ZhosparymRepositoryImpl(remoteDS: gh<_i174.ZhosparymRemoteDs>()));
    gh.factory<_i261.HomeRemoteDs>(() => _i261.HomeRemoteDsImpl(
          newsDs: gh<_i911.NewsRemoteDs>(),
          seminarDs: gh<_i861.SeminarRemoteDs>(),
          livesDs: gh<_i746.LivesRemoteDs>(),
          charityDs: gh<_i333.CharityRemoteDs>(),
          notificationDs: gh<_i759.HomeNotificationRemoteDs>(),
          paymentDs: gh<_i377.PaymentRemoteDs>(),
          tellMeUstazDs: gh<_i198.TellMeUstazRemoteDs>(),
          commentDs: gh<_i541.CommentRemoteDs>(),
          miscDs: gh<_i761.HomeMiscRemoteDs>(),
        ));
    gh.singleton<_i562.TusZhoruRepository>(() =>
        _i562.TusZhoruRepositoryImpl(remoteDS: gh<_i426.TusZhoruRemoteDs>()));
    gh.singleton<_i859.ZhosparymCubit>(
        () => _i859.ZhosparymCubit(gh<_i266.ZhosparymRepository>()));
    gh.singleton<_i1043.CheckListCubit>(
        () => _i1043.CheckListCubit(gh<_i266.ZhosparymRepository>()));
    gh.singleton<_i490.ChangePassCubit>(
        () => _i490.ChangePassCubit(gh<_i716.AuthRepository>()));
    gh.singleton<_i1027.HomeRepository>(() => _i1027.HomeRepositoryImpl(
          gh<_i326.HomeLocalDs>(),
          remoteDS: gh<_i261.HomeRemoteDs>(),
        ));
    gh.singleton<_i757.QrScannerCubit>(() => _i757.QrScannerCubit(
          gh<_i1027.HomeRepository>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.singleton<_i330.TodayChatCubit>(() => _i330.TodayChatCubit(
          gh<_i1027.HomeRepository>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.singleton<_i10.PaymentTickCubit>(() => _i10.PaymentTickCubit(
          gh<_i1027.HomeRepository>(),
          gh<_i562.TusZhoruRepository>(),
        ));
    gh.singleton<_i577.CreateSeminarPaymentCubit>(
        () => _i577.CreateSeminarPaymentCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i933.CalendarChatsCubit>(
        () => _i933.CalendarChatsCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i834.CommentNewsCubit>(
        () => _i834.CommentNewsCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i551.SeminarCubit>(
        () => _i551.SeminarCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i615.CommentNewsPostCubit>(
        () => _i615.CommentNewsPostCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i900.NewsMainCubit>(
        () => _i900.NewsMainCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i178.CommentSemCubit>(
        () => _i178.CommentSemCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i816.CharitiesCubit>(
        () => _i816.CharitiesCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i65.FaqCubit>(
        () => _i65.FaqCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i609.SetCityCubit>(
        () => _i609.SetCityCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i663.GetNotiCubit>(
        () => _i663.GetNotiCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i769.NewsCubit>(
        () => _i769.NewsCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i99.LivesFavCubit>(
        () => _i99.LivesFavCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i666.CommentSemPostCubit>(
        () => _i666.CommentSemPostCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i851.PartnersCubit>(
        () => _i851.PartnersCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i653.PostServiceCubit>(
        () => _i653.PostServiceCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i638.LivesCubit>(
        () => _i638.LivesCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i335.NewsFavCubit>(
        () => _i335.NewsFavCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i1056.CommentReportCubit>(
        () => _i1056.CommentReportCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i932.PrjInfoCubit>(
        () => _i932.PrjInfoCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i332.NewsDetailCubit>(
        () => _i332.NewsDetailCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i962.CommentSemLikeCubit>(
        () => _i962.CommentSemLikeCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i493.SeminarDetailCubit>(
        () => _i493.SeminarDetailCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i71.CommentNewsLikeCubit>(
        () => _i71.CommentNewsLikeCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i444.GeonamesCubit>(
        () => _i444.GeonamesCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i906.ServicesCubit>(
        () => _i906.ServicesCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i210.ProfileNotificationCubit>(
        () => _i210.ProfileNotificationCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i56.SeminarFavCubit>(
        () => _i56.SeminarFavCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i265.TandaulilarCubit>(
        () => _i265.TandaulilarCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i290.CreateTusZhoruCubit>(
        () => _i290.CreateTusZhoruCubit(gh<_i562.TusZhoruRepository>()));
    gh.singleton<_i208.TusZhoruCubit>(
        () => _i208.TusZhoruCubit(gh<_i562.TusZhoruRepository>()));
    gh.singleton<_i185.CustomTusZhoruDetailsCubit>(
        () => _i185.CustomTusZhoruDetailsCubit(gh<_i562.TusZhoruRepository>()));
    gh.singleton<_i667.TusZhoruDetailsCubit>(
        () => _i667.TusZhoruDetailsCubit(gh<_i562.TusZhoruRepository>()));
    gh.singleton<_i892.CardsCubit>(
        () => _i892.CardsCubit(gh<_i1027.HomeRepository>()));
    gh.singleton<_i322.TimingsCubit>(() => _i322.TimingsCubit(
          gh<_i1027.HomeRepository>(),
          gh<_i326.HomeLocalDs>(),
        ));
    return this;
  }
}
