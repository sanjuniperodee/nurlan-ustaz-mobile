import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nurlan_ustaz_flutter/core/model/async_app_dependecies.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/main_runner.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/nurlan_ustaz_app.dart';

import 'core/router/app_router.dart';
import 'core/services/locator_service.dart';

// Future<void> firebaseListen() async {
//   FirebaseMessaging.instance.getInitialMessage();
//   FirebaseMessaging.onMessage.listen((message) {
//     log('MESSAGEEEE ${message.data} : ${message.data}');
//     // if (message.data['order_id'] != '' && message.data['order_id'] != 0) {

//     // } else {
//     //   log('NO');
//     // }
//   });
// }

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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  await FirebaseDynamicLinks.instance.getInitialLink();
  getIt.registerSingleton<AppRouter>(AppRouter());
  // await firebaseListen();
  await firebaseInit();
  await checkLocationPermission();

  MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) {
        return const NurlanUstazApp();
      });
  FlutterNativeSplash.remove();
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
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        TusZhoruDetailRoute(id: int.parse(id))
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
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        CustomTusZhoruDetailRoute(id: int.parse(id))
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
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        SeminarDetailRoute(id: int.parse(id))
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
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        PrayersDetailRoute(id: int.parse(id))
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
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        NewsDetailRoute(id: int.parse(id))
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
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        NameDetailRoute(id: int.parse(id))
      ]);
    }
  }
}
