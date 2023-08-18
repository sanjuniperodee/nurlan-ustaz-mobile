import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/Allah_names_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/Islam_teaching_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/ayat_day_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/dhikr_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/dhikr_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/duty_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/duty_page.dart';

import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/namaz_pattern_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/namaz_read_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/wudhu_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/name_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/prayers_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/surah_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/launcher.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/splash.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/code_verification_page.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_passwords_pages/code_verification_forgot.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_passwords_pages/forgot_password_page.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/login_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/comment_page_sem.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/news_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/notifications_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/about_app_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/add_new_card_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/change_password_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/payment_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/profile_cards_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/profile_info_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/profile_main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/profile_notification_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/qr_scanner_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/technical_support_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/qiblah_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/services_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/shop_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/ui/ustaz_aitinizhi.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/geonames_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandaulilar_main_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/custom_tus_zhoru_details_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/question_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_details_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_page.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/ui/zhosparym_page.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/holiday_details_page.dart';

import '../../features/Islam_teaching/presentation/ui/detail_prayers_page.dart';
import '../../features/Islam_teaching/presentation/ui/name_detail_page.dart';
import '../../features/Islam_teaching/presentation/ui/surah_detail_page.dart';
import '../../features/auth/data/model/user_payload.dart';
import '../../features/home/presentation/ui/comment_page_news.dart';
import '../../features/home/presentation/ui/live_broadcasts_page.dart';
import '../../features/home/presentation/ui/namaz_page.dart';
import '../../features/home/presentation/ui/news_detail_page.dart';
import '../../features/home/presentation/ui/profile/profile_main/faq_page.dart';
import '../../features/zhosparlar/data/models/checklist_dto.dart';
import '../../features/zhosparlar/data/models/event_dto.dart';
import '../../features/zhosparlar/presentation/ui/ramazan_checklist.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [

    AutoRoute(
      page: LauncherAppRoute.page,
      // path: '/',
      children: [
        AutoRoute(
          page: MainRouterPage.page,
        ),
        AutoRoute(page: IslamTeachingRouterPage.page),
        AutoRoute(page: TusZhoruRouterPage.page),
        AutoRoute(page: TandaulilarMainRouterPage.page),
        AutoRoute(
          page: ZhosparymMainRouterPage.page,
        ),
      ],
    ),
    AutoRoute(
      initial: true,
      page: SplashRoute.page,
    ),
    AutoRoute(
      page: GeonamesRoute.page,
    ),
    AutoRoute(page: TechnicalSupportRoute.page),
    AutoRoute(page: RamazanChecklistRoute.page),
    AutoRoute(page: AddNewCardRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: ProfileNotificationRoute.page),
    AutoRoute(page: FaqRoute.page),
    AutoRoute(page: AboutAppRoute.page),
    AutoRoute(page: ProfileCardsRoute.page),
    AutoRoute(page: ProfileMainRoute.page),
    AutoRoute(page: PaymentsRoute.page),
    AutoRoute(page: ProfileInfoRoute.page),
    AutoRoute(page: UstazAitinizhiRoute.page),
    AutoRoute(page: SeminarRoute.page),
    AutoRoute(page: SeminarDetailRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: CharityRoute.page),
    AutoRoute(page: CharityDetailRoute.page),
    AutoRoute(page: ServicesRoute.page),
    AutoRoute(page: LiveBroadcastsRoute.page),
    AutoRoute(page: ShopRoute.page),
    AutoRoute(page: NewsRoute.page),
    AutoRoute(page: NewsDetailRoute.page),
    AutoRoute(page: NamazRoute.page),
    AutoRoute(page: QiblahRoute.page),
    AutoRoute(page: CommentRouteSem.page),
    AutoRoute(page: CommentRouteNews.page),
    AutoRoute(page: TusZhoruRouterPage.page),
    AutoRoute(page: TusZhoruDetailRoute.page),
    AutoRoute(page: CustomTusZhoruDetailRoute.page),
    AutoRoute(page: QuestionRoute.page),
    AutoRoute(page: ProfileMainRoute.page),
    AutoRoute(page: PaymentsRoute.page),
    AutoRoute(page: AyatDayRoute.page),
    AutoRoute(page: DutyRoute.page),
    AutoRoute(page: AllahNamesRoute.page),
    AutoRoute(page: DhikrRoute.page),
    AutoRoute(page: DhikrDetailRoute.page),
    AutoRoute(page: PrayersRoute.page),
    AutoRoute(page: SurahRoute.page),
    AutoRoute(page: SurahDetailRoute.page),
    AutoRoute(page: PrayersDetailRoute.page),
    AutoRoute(page: NameDetailRoute.page),
    AutoRoute(page: NameRoute.page),
    AutoRoute(page: DutyDetailRoute.page),
    AutoRoute(page: NamazReadRoute.page),
    AutoRoute(page: NamazPatternRoute.page),
    AutoRoute(page: WudhuRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: CodeVerificationRoute.page),
    AutoRoute(page: CodeVerificationForgotRoute.page),
    AutoRoute(page: HolidayDetailRoute.page),
    AutoRoute(page: QrScannerRoute.page),



  ];
}
