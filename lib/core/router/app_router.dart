import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/launcher.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/notifications_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/services_page.dart';

import '../../features/home/presentation/ui/live_broadcasts_page.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[
    AutoRoute(
      page: LauncherApp,
      initial: true,
      children: [
        AutoRoute(page: MainPage, name: 'MainRouterPage'),
        // AutoRoute(
        //   page: EmptyRouterPage,
        //   name: 'BaseHomeRouter',
        //   children: [
        //     AutoRoute(page:  MainPage(), initial: true),
        //   ],
        // ),
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
  ],
)
class AppRouter extends _$AppRouter {}
