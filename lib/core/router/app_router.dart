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
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/comment_sem_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/news_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/notifications_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/about_app_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/add_new_card_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/change_password_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/payment_check_page.dart';
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
import '../../features/home/presentation/ui/comment_news_page.dart';
import '../../features/home/presentation/ui/live_broadcasts_page.dart';
import '../../features/home/presentation/ui/namaz_page.dart';
import '../../features/home/presentation/ui/news_detail_page.dart';
import '../../features/home/presentation/ui/profile/profile_main/faq_page.dart';
import '../../features/zhosparlar/data/models/checklist_dto.dart';
import '../../features/zhosparlar/data/models/event_dto.dart';
import '../../features/zhosparlar/presentation/ui/ramazan_checklist.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return TweenAnimationBuilder<Offset>(
            tween: Tween(begin: const Offset(0.0, 1.0), end: Offset.zero),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            builder: (context, offset, child) {
              return Transform.translate(
                offset: offset,
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              );
            },
            child: child,
          );
        },
      );

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: LauncherAppRoute.page,
      path: '/',
      children: [
        AutoRoute(
          page: MainRouterPage.page,
        ),
        AutoRoute(
          path: 'islam-teaching',
          page: IslamTeachingRouterPage.page,
        ),
        AutoRoute(
          path: 'tus-zhoru',
          page: TusZhoruRouterPage.page,
        ),
        AutoRoute(
          path: 'tandaulilar',
          page: TandaulilarMainRouterPage.page,
        ),
        AutoRoute(
          path: 'zhosparym',
          page: ZhosparymMainRouterPage.page,
        ),
      ],
    ),
    // AutoRoute(
    //   initial: true,
    //   page: SplashRoute.page,
    // ),
    AutoRoute(
      path: '/geonames',
      page: GeonamesRoute.page,
    ),
    AutoRoute(
      path: '/technical-support',
      page: TechnicalSupportRoute.page,
    ),
    AutoRoute(
      path: '/ramazan-check-list',
      page: RamazanChecklistRoute.page,
    ),
    AutoRoute(
      path: '/add-new-card',
      page: AddNewCardRoute.page,
    ),
    AutoRoute(
      path: '/change-password',
      page: ChangePasswordRoute.page,
    ),
    AutoRoute(
      path: '/profile-notification',
      page: ProfileNotificationRoute.page,
    ),
    AutoRoute(
      path: '/faq',
      page: FaqRoute.page,
    ),
    AutoRoute(
      path: '/about-app',
      page: AboutAppRoute.page,
    ),
    AutoRoute(
      path: '/profile-cards',
      page: ProfileCardsRoute.page,
    ),
    AutoRoute(
      path: '/profile',
      page: ProfileMainRoute.page,
    ),
    AutoRoute(
      path: '/payments',
      page: PaymentsRoute.page,
    ),
    AutoRoute(
      path: '/profile-info',
      page: ProfileInfoRoute.page,
    ),
    AutoRoute(
      path: '/ustaz-aitinizh',
      page: UstazAitinizhiRoute.page,
    ),
    AutoRoute(
      path: '/seminar',
      page: SeminarRoute.page,
    ),
    AutoRoute(
      path: '/seminar-detail',
      page: SeminarDetailRoute.page,
    ),
    AutoRoute(
      path: '/notification',
      page: NotificationRoute.page,
    ),
    AutoRoute(
      path: '/charity',
      page: CharityRoute.page,
    ),
    AutoRoute(
      path: '/charity-detail',
      page: CharityDetailRoute.page,
    ),
    AutoRoute(
      path: '/services',
      page: ServicesRoute.page,
    ),
    AutoRoute(
      path: '/live-broadcast',
      page: LiveBroadcastsRoute.page,
    ),
    AutoRoute(
      path: '/shop',
      page: ShopRoute.page,
    ),
    AutoRoute(
      path: '/news',
      page: NewsRoute.page,
    ),
    AutoRoute(
      path: '/news-detail',
      page: NewsDetailRoute.page,
    ),
    AutoRoute(
      path: '/namaz',
      page: NamazRoute.page,
    ),
    AutoRoute(
      path: '/qiblah',
      page: QiblahRoute.page,
    ),
    AutoRoute(
      path: '/comment-seminar',
      page: CommentSemRoute.page,
    ),
    AutoRoute(
      path: '/comment-news',
      page: CommentNewsRoute.page,
    ),
    AutoRoute(
      path: '/tus-zhoru',
      page: TusZhoruRouterPage.page,
    ),
    AutoRoute(
      path: '/tus-zhoru-detail',
      page: TusZhoruDetailRoute.page,
    ),
    AutoRoute(
      path: '/custom-tus-zhoru-detail',
      page: CustomTusZhoruDetailRoute.page,
    ),
    AutoRoute(
      path: '/question',
      page: QuestionRoute.page,
    ),
    AutoRoute(
      path: '/ayat-day',
      page: AyatDayRoute.page,
    ),
    AutoRoute(
      path: '/duty',
      page: DutyRoute.page,
    ),
    AutoRoute(
      path: '/duty-detail',
      page: DutyDetailRoute.page,
    ),
    AutoRoute(
      path: '/Allah-names',
      page: AllahNamesRoute.page,
    ),
    AutoRoute(
      path: '/dhikr',
      page: DhikrRoute.page,
    ),
    AutoRoute(
      path: '/dhikr-detail',
      page: DhikrDetailRoute.page,
    ),
    AutoRoute(
      path: '/prayers',
      page: PrayersRoute.page,
    ),
    AutoRoute(
      path: '/prayers-detail',
      page: PrayersDetailRoute.page,
    ),
    AutoRoute(
      path: '/surah',
      page: SurahRoute.page,
    ),
    AutoRoute(
      path: '/surah-detail',
      page: SurahDetailRoute.page,
    ),
    AutoRoute(
      path: '/name',
      page: NameRoute.page,
    ),
    AutoRoute(
      path: '/name-detail',
      page: NameDetailRoute.page,
    ),
    AutoRoute(
      path: '/namaz-read',
      page: NamazReadRoute.page,
    ),
    AutoRoute(
      path: '/namaz-pattern',
      page: NamazPatternRoute.page,
    ),
    AutoRoute(
      path: '/wudhu',
      page: WudhuRoute.page,
    ),
    AutoRoute(
      path: '/forgot-password',
      page: ForgotPasswordRoute.page,
    ),
    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: '/code-verification',
      page: CodeVerificationRoute.page,
    ),
    AutoRoute(
      path: '/code-verification-forgot',
      page: CodeVerificationForgotRoute.page,
    ),
    AutoRoute(
      path: '/holiday-detail',
      page: HolidayDetailRoute.page,
    ),
    AutoRoute(
      path: '/qr-scanner',
      page: QrScannerRoute.page,
    ),
    AutoRoute(
      path: '/payment-check',
      page: PaymentCheckRoute.page,
    )
  ];
}
