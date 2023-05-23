import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/launcher.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/news_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/notifications_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/qiblah_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/services_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/shop_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/question_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/tus_zhoru_details_page.dart';

import '../../features/home/presentation/ui/live_broadcasts_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/tus_zhoru_page.dart';

import '../../features/home/presentation/ui/namaz_page.dart';
import '../../features/home/presentation/ui/news_detail_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[
    AutoRoute(
      page: LauncherApp,
      initial: true,
      children: [
        AutoRoute(page: MainPage, name: 'MainRouterPage'),
        AutoRoute(page: TusZhoruPage, name: 'TusZhoruRouterPage'),
      ],
    ),
    //
    //HOME
    //
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
  ],
)
class AppRouter extends _$AppRouter {}
