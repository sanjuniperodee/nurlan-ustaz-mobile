import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nurlan_ustaz_flutter/core/model/async_app_dependecies.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/detail_prayers_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/name_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/main_runner.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/nurlan_ustaz_app.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/news_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_details_page.dart';


import 'core/router/app_router.dart';
import 'core/services/locator_service.dart';

import 'features/tus_zhoru/presentation/ui/custom_tus_zhoru_details_page.dart';

Future<void> firebaseInit() async {
  FirebaseDynamicLinks.instance.onLink.listen((event) {
    log(event.toString());
    if (event.link.queryParameters['type'] == 'tusZhoru') {
      navigateToTusZhoru(event.link);
    }
    if (event.link.queryParameters['type'] == 'customTusZhoru') {
      navigateToCustomTusZhoru(event.link);
    }
    if (event.link.queryParameters['type'] == 'seminar') {
      navigateToSeminar(event.link);
    }
    if (event.link.queryParameters['type'] == 'duas') {
      navigateToDuas(event.link);
    }
    if (event.link.queryParameters['type'] == 'news') {
      navigateToNews(event.link);
    }
    if (event.link.queryParameters['type'] == 'muslim_names') {
      navigateToName(event.link);
    }
  }).onError((e) {
    print(e);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await FirebaseDynamicLinks.instance.getInitialLink();
  getIt.registerSingleton<AppRouter>(AppRouter());

  await firebaseInit();
  await checkLocationPermission();
  MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) {
        return NurlanUstazApp();
      });
}

Future<void> checkLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle the case when the user has denied location permission permanently
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Handle the case when the user has denied location permission permanently
  }

  // Permission has been granted, proceed with accessing the location.
}

Future<void> navigateToTusZhoru(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.isNotEmpty) {
    var id = queryParams['id'];
    if (id != null) {
      getIt<AppRouter>().pushAll([
        LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        TusZhoruDetailPageRoute(id: int.parse(id))
      ]);
    }
  }
}

Future<void> navigateToCustomTusZhoru(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.length > 0) {
    var id = queryParams['id'];
    if (id != null) {
      getIt<AppRouter>().pushAll([
        LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        CustomTusZhoruDetailPageRoute(id: int.parse(id))
      ]);
    }
  }
}

Future<void> navigateToSeminar(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.length > 0) {
    var id = queryParams['id'];
    if (id != null) {
      getIt<AppRouter>().pushAll([
        LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        SeminarDetailPageRoute(id: int.parse(id))
      ]);
    }
  }
}

Future<void> navigateToDuas(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.length > 0) {
    var id = queryParams['id'];
    if (id != null) {
      getIt<AppRouter>().pushAll([
        LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        PrayersDetailPageRoute(id: int.parse(id))
      ]);
    }
  }
}

Future<void> navigateToNews(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.length > 0) {
    var id = queryParams['id'];
    if (id != null) {
      getIt<AppRouter>().pushAll([
        LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        NewsDetailPageRoute(id: int.parse(id))
      ]);
    }
  }
}

Future<void> navigateToName(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.length > 0) {
    var id = queryParams['id'];
    if (id != null) {
      getIt<AppRouter>().pushAll([
        LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        NameDetailPageRoute(id: int.parse(id))
      ]);
    }
  }
}
