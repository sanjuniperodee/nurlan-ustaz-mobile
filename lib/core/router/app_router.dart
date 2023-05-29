import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/Allah_names_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/Islam_teaching_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/ayat_day_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/dhikr_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/dhikr_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/fatua_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/name_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/prayers_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/surah_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/launcher.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/comment_page.dart';
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
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/qiblah_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/services_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/shop_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandaulilar_main_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandaulir_dugalar_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandauly_dhikr_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandauly_live_broadcast.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandauly_seminar_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandauly_zhanalyktar.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/question_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_details_page.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/ui/zhosparym_page.dart';

import '../../features/Islam_teaching/presentation/ui/detail_prayers_page.dart';
import '../../features/Islam_teaching/presentation/ui/name_detail_page.dart';
import '../../features/Islam_teaching/presentation/ui/surah_detail_page.dart';
import '../../features/home/presentation/ui/live_broadcasts_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_page.dart';

import '../../features/home/presentation/ui/namaz_page.dart';
import '../../features/home/presentation/ui/news_detail_page.dart';
import '../../features/home/presentation/ui/profile/profile_main/faq_page.dart';
import '../../features/tandaulilar/presentation/ui/tandauly_name_page.dart';
import '../../features/tandaulilar/presentation/ui/tandauly_tus_zhoru.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[
    AutoRoute(
      page: LauncherApp,
      initial: true,
      children: [
        AutoRoute(page: MainPage, name: 'MainRouterPage'),
        AutoRoute(page: IslamTeachingPage, name: 'IslamTeachingRouterPage'),
        AutoRoute(page: TusZhoruPage, name: 'TusZhoruRouterPage'),
        AutoRoute(page: TandaulilarMainPage,name: 'TandaulilarMainRouterPage'),
        AutoRoute(page: ZhosparymPage,name: 'ZhosparymRouterPage'),
      ],
    ),
    //
    //HOME
    //
    AutoRoute(page: AddNewCardPage),
    AutoRoute(page: ChangePasswordPage),
    AutoRoute(page: ProfileNotificationPage),
    AutoRoute(page: FaqPage),
    AutoRoute(page: AboutAppPage),
    AutoRoute(page: ProfileCardsPage),
    AutoRoute(page: ProfileMainPage),
    AutoRoute(page: PaymentsPage),
    AutoRoute(page: ProfileInfoPage),
    AutoRoute(
      page: SeminarPage,
    ),
    AutoRoute(
      page: SeminarDetailPage,
    ),
    AutoRoute(
      page: NotificationPage,
    ),
    AutoRoute(
      page: CharityPage,
    ),
    AutoRoute(
      page: CharityDetailPage,
    ),
    AutoRoute(
      page: ServicesPage,
    ),
    AutoRoute(
      page: LiveBroadcastsPage,
    ),
    AutoRoute(
      page: ShopPage,
    ),
    AutoRoute(
      page: NewsPage,
    ),
    AutoRoute(
      page: NewsDetailPage,
    ),
    AutoRoute(
      page: NamazPage,
    ),
    AutoRoute(
      page: QiblahPage,
    ),
    //TosZhoru

    AutoRoute(page: TusZhoruDetailPage),
    AutoRoute(page: QuestionPage),
    AutoRoute(
      page: CommentPage,
    ),

    //Islam teaching
    AutoRoute(page: AyatDayPage),
    AutoRoute(page: DutyPage),
    AutoRoute(page: AllahNamesPage),
    AutoRoute(page: DhikrPage),
    AutoRoute(page: DhikrDetailPage),
    AutoRoute(page: FatuaPage),
    AutoRoute(page: PrayersPage),
    AutoRoute(page: SurahPage),
    AutoRoute(page: SurahDetailPage),
    AutoRoute(page: PrayersDetailPage),
    AutoRoute(page: NameDetailPage),
    AutoRoute(page: NamePage),
    //Tandaulilar
    AutoRoute(page: TandaulyNewsPage),
    AutoRoute(page: TandaulyLiveBroadcastsPage),
    AutoRoute(page: TandaulySeminarPage),
    AutoRoute(page: TandaulyTusZhoruPage),
    AutoRoute(page: TandaulyDugalarPage),
    AutoRoute(page: TandaulyNamePage),
    AutoRoute(page: TandaulyDhikrPage),
  ],
)
class AppRouter extends _$AppRouter {}
