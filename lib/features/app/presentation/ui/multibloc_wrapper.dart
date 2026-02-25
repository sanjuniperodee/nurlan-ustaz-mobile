import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ablutions_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/ayat_of_day_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dua_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_name_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/namaz_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/pillars_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/bloc/on_boarding_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/change_pass_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/charities_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_post_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_report_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_post_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/create_seminar_payment_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/faq_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/geonames_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_noti_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_main_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/partners_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/payment_tick_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/post_service_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/prj_info_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/profile_notification_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/services_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/set_city_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/cards_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/load_profile_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/profile_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/qr_scanner_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/technical_support_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/calendar_chats_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/today_chat_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/bloc/tandaulilar_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/create_tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_details_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/checklist_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/zhosparym_cubit.dart';
import 'package:provider/provider.dart';

import '../../../tus_zhoru/presentation/bloc/custom_tus_zhoru_details_cubit.dart';

class MultiblocWrapper extends StatelessWidget {
  const MultiblocWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        InheritedProvider<ProfileLocalDs>(
          create: (context) => GetIt.I(),
          dispose: (context, value) => value.close(),
        ),
        //On Boarding
        BlocProvider<OnBoardingCubit>(
          create: (context) => GetIt.I<OnBoardingCubit>(),
        ),
        //AUTH
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            authLocalDs: GetIt.I(),
            profileLocalDs: GetIt.I(),
            authRemoteDs: GetIt.I(),
          ),
        ),
        BlocProvider<ChangePassCubit>(
          create: (context) => GetIt.I<ChangePassCubit>(),
        ),

        //
        //HOME
        //

        BlocProvider<TechnicalSupportCubit>(
          create: (context) => GetIt.I<TechnicalSupportCubit>(),
        ),

        BlocProvider(
          create: (context) => LoadProfileBloc(
            profileRemoteDs: GetIt.I(),
            profileLocalDs: context.read(),
          )..add(const LoadProfileEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            profileLocalDs: context.read(),
          ),
        ),

        BlocProvider<PaymentTickCubit>(
          create: (context) => GetIt.I<PaymentTickCubit>(),
        ),

        BlocProvider<GetNotiCubit>(
          create: (context) => GetIt.I<GetNotiCubit>(),
        ),
        BlocProvider<TimingsCubit>(
          create: (context) => GetIt.I<TimingsCubit>(),
        ),
        BlocProvider<SetCityCubit>(
          create: (context) => GetIt.I<SetCityCubit>(),
        ),
        BlocProvider<GeonamesCubit>(
          create: (context) => GetIt.I<GeonamesCubit>(),
        ),
        BlocProvider<FaqCubit>(
          create: (context) => GetIt.I<FaqCubit>(),
        ),
        BlocProvider<CreateSeminarPaymentCubit>(
          create: (context) => GetIt.I<CreateSeminarPaymentCubit>(),
        ),
        BlocProvider<NewsCubit>(
          create: (context) => GetIt.I<NewsCubit>(),
        ),
        BlocProvider<SeminarCubit>(
          create: (context) => GetIt.I<SeminarCubit>(),
        ),
        BlocProvider<ServicesCubit>(
          create: (context) => GetIt.I<ServicesCubit>(),
        ),
        BlocProvider<CharitiesCubit>(
          create: (context) => GetIt.I<CharitiesCubit>(),
        ),
        BlocProvider<CommentReportCubit>(
          create: (context) => GetIt.I<CommentReportCubit>(),
        ),
        BlocProvider<CommentNewsCubit>(
          create: (context) => GetIt.I<CommentNewsCubit>(),
        ),
        BlocProvider<CommentNewsLikeCubit>(
          create: (context) => GetIt.I<CommentNewsLikeCubit>(),
        ),
        BlocProvider<CommentNewsPostCubit>(
          create: (context) => GetIt.I<CommentNewsPostCubit>(),
        ),
        BlocProvider<CommentSemCubit>(
          create: (context) => GetIt.I<CommentSemCubit>(),
        ),
        BlocProvider<CommentSemPostCubit>(
          create: (context) => GetIt.I<CommentSemPostCubit>(),
        ),
        BlocProvider<LivesCubit>(
          create: (context) => GetIt.I<LivesCubit>(),
        ),
        BlocProvider<PartnersCubit>(
          create: (context) => GetIt.I<PartnersCubit>(),
        ),
        BlocProvider<NewsMainCubit>(
          create: (context) => GetIt.I<NewsMainCubit>(),
        ),
        BlocProvider<PostServiceCubit>(
          create: (context) => GetIt.I<PostServiceCubit>(),
        ),
        BlocProvider<PrjInfoCubit>(
          create: (context) => GetIt.I<PrjInfoCubit>(),
        ),
        BlocProvider<SeminarFavCubit>(
          create: (context) => GetIt.I<SeminarFavCubit>(),
        ),
        BlocProvider<LivesFavCubit>(
          create: (context) => GetIt.I<LivesFavCubit>(),
        ),

        BlocProvider<CommentSemLikeCubit>(
          create: (context) => GetIt.I<CommentSemLikeCubit>(),
        ),
        BlocProvider<NewsFavCubit>(
          create: (context) => GetIt.I<NewsFavCubit>(),
        ),
        BlocProvider<NewsDetailCubit>(
          create: (context) => GetIt.I<NewsDetailCubit>(),
        ),
        BlocProvider<SeminarDetailCubit>(
          create: (context) => GetIt.I<SeminarDetailCubit>(),
        ),

        BlocProvider<ProfileNotificationCubit>(
          create: (context) => GetIt.I<ProfileNotificationCubit>(),
        ),
        //ISlAM TEACHING
        //
        BlocProvider<AblutionsCubit>(
          create: (context) => GetIt.I<AblutionsCubit>(),
        ),
        BlocProvider<DhikrsCubit>(
          create: (context) => GetIt.I<DhikrsCubit>(),
        ),
        BlocProvider<DhikrsFavoriteCubit>(
          create: (context) => GetIt.I<DhikrsFavoriteCubit>(),
        ),
        BlocProvider<DuaDetailCubit>(
          create: (context) => GetIt.I<DuaDetailCubit>(),
        ),
        BlocProvider<AyatOfDayCubit>(
          create: (context) => GetIt.I<AyatOfDayCubit>(),
        ),
        BlocProvider<PillarsCubit>(
          create: (context) => GetIt.I<PillarsCubit>(),
        ),
        BlocProvider<SurahCubit>(
          create: (context) => GetIt.I<SurahCubit>(),
        ),
        BlocProvider<DuasCubit>(
          create: (context) => GetIt.I<DuasCubit>(),
        ),
        BlocProvider<IslamNamesCubit>(
          create: (context) => GetIt.I<IslamNamesCubit>(),
        ),

        BlocProvider<NamazDetailCubit>(
          create: (context) => GetIt.I<NamazDetailCubit>(),
        ),
        BlocProvider<SurahFavoriteCubit>(
          create: (context) => GetIt.I<SurahFavoriteCubit>(),
        ),
        BlocProvider<NamesOfAllahCubit>(
          create: (context) => GetIt.I<NamesOfAllahCubit>(),
        ),

        BlocProvider<IslamNameDetailCubit>(
          create: (context) => GetIt.I<IslamNameDetailCubit>(),
        ),
        //TANDAULILAR
        //
        BlocProvider<TandaulilarCubit>(
          create: (context) => GetIt.I<TandaulilarCubit>(),
        ),
        //USTAZ AITNIZH
        BlocProvider<CalendarChatsCubit>(
            create: (context) => GetIt.I<CalendarChatsCubit>()),
        BlocProvider<TodayChatCubit>(
            create: (context) => GetIt.I<TodayChatCubit>()),
        //TUS ZHORU
        BlocProvider<TusZhoruCubit>(
            create: (context) => GetIt.I<TusZhoruCubit>()),
        BlocProvider<CreateTusZhoruCubit>(
            create: (context) => GetIt.I<CreateTusZhoruCubit>()),
        BlocProvider<TusZhoruDetailsCubit>(
            create: (context) => GetIt.I<TusZhoruDetailsCubit>()),
        BlocProvider<CustomTusZhoruDetailsCubit>(
            create: (context) => GetIt.I<CustomTusZhoruDetailsCubit>()),
        //ZHOSPARLARIM
        BlocProvider<ZhosparymCubit>(
            create: (context) => GetIt.I<ZhosparymCubit>()),
        BlocProvider<CheckListCubit>(
            create: (context) => GetIt.I<CheckListCubit>()),
        BlocProvider<QrScannerCubit>(
            create: (context) => GetIt.I<QrScannerCubit>()),
        BlocProvider<CardsCubit>(create: (context) => GetIt.I<CardsCubit>()),
      ],
      child: child,
    );
  }
}
