import 'dart:async';

import 'package:dry_bloc/dry_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/nurlan_ustaz_app.dart';
import 'package:nurlan_ustaz_flutter/firebase_options.dart';
import 'core/services/notification_service.dart';

/// Errors we do not report to Crashlytics (expected or plugin not implemented).
bool _shouldSkipCrashlytics(Object error) {
  if (error is ClientServerException) return true;
  if (error is InternalServerException) return true;
  if (error is DryFatalException) {
    final inner = error.fatalError;
    if (inner is ClientServerException) return true;
    if (inner is InternalServerException) return true;
    if (inner is MissingPluginException) return true;
    return false;
  }
  if (error is MissingPluginException) return true;
  return false;
}

Future<void> firebaseListen() async {
  FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onMessage.listen((message) {
    showFlutterNotification(message);
  });
}

// Future<void> firebaseInit() async {
//   FirebaseDynamicLinks.instance.onLink.listen((event) {
//     log(event.toString());
//     if (event.link.queryParameters['type'] == 'tusZhoru') {
//       navigateToTusZhoru(event.link);
//     }
//     if (event.link.queryParameters['type'] == 'customTusZhoru') {
//       navigateToCustomTusZhoru(event.link);
//     }
//     if (event.link.queryParameters['type'] == 'seminar') {
//       navigateToSeminar(event.link);
//     }
//     if (event.link.queryParameters['type'] == 'duas') {
//       navigateToDuas(event.link);
//     }
//     if (event.link.queryParameters['type'] == 'news') {
//       navigateToNews(event.link);
//     }
//     if (event.link.queryParameters['type'] == 'muslim_names') {
//       navigateToName(event.link);
//     }
//   }).onError((e) {
//     print(e);
//   });
// }

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (!kIsWeb) {
        await FirebaseCrashlytics.instance
            .setCrashlyticsCollectionEnabled(kReleaseMode);
        FlutterError.onError = (errorDetails) {
          FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        };
        PlatformDispatcher.instance.onError = (error, stack) {
          if (!_shouldSkipCrashlytics(error)) {
            FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          }
          return true;
        };
      }
      await FirebaseAnalytics.instance
          .setAnalyticsCollectionEnabled(kReleaseMode);
      // TODO(Radomir): Remove Firebase Dynamix Links from project, as it is deprecated
      // await FirebaseDynamicLinks.instance.getInitialLink();
      // await firebaseListen();
      // await firebaseInit();
      // await checkLocationPermission();

      await configureDependencies();
      await EasyLocalization.ensureInitialized();
      EasyLocalization.logger.enableLevels = [];

      // TODO: notification service crashing the application when something goes wrong
      // await NotificationService().init();

      // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      runApp(const NurlanUstazApp());
    },
    (error, stack) {
      if (!kIsWeb && !_shouldSkipCrashlytics(error)) {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
    },
  );
}

Future<void> checkLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {}
  }

  if (permission == LocationPermission.deniedForever) {
    // Handle the case when the user has denied location permission permanently
  }

  // Permission has been granted, proceed with accessing the location.
}

// Future<void> navigateToTusZhoru(Uri link) async {
//   print("event.link.queryParameters ${link.queryParameters}");

//   var deepLink = link;
//   final queryParams = deepLink.queryParameters;
//   if (queryParams.isNotEmpty) {
//     var id = queryParams['id'];
//     if (id != null) {
//       GetIt.I<AppRouter>().pushAll([
//         const LauncherAppRoute(
//           children: [
//             MainRouterPage(),
//           ],
//         ),
//         TusZhoruDetailRoute(id: int.parse(id))
//       ]);
//     }
//   }
// }

// Future<void> navigateToCustomTusZhoru(Uri link) async {
//   var deepLink = link;
//   final queryParams = deepLink.queryParameters;
//   if (queryParams.isNotEmpty) {
//     var id = queryParams['id'];
//     if (id != null) {
//       GetIt.I<AppRouter>().pushAll([
//         const LauncherAppRoute(
//           children: [
//             MainRouterPage(),
//           ],
//         ),
//         CustomTusZhoruDetailRoute(id: int.parse(id))
//       ]);
//     }
//   }
// }

// Future<void> navigateToSeminar(Uri link) async {
//   print("event.link.queryParameters ${link.queryParameters}");

//   var deepLink = link;
//   final queryParams = deepLink.queryParameters;
//   if (queryParams.isNotEmpty) {
//     var id = queryParams['id'];
//     if (id != null) {
//       GetIt.I<AppRouter>().pushAll([
//         const LauncherAppRoute(
//           children: [
//             MainRouterPage(),
//           ],
//         ),
//         SeminarDetailRoute(id: int.parse(id))
//       ]);
//     }
//   }
// }

// Future<void> navigateToDuas(Uri link) async {
//   print("event.link.queryParameters ${link.queryParameters}");

//   var deepLink = link;
//   final queryParams = deepLink.queryParameters;
//   if (queryParams.isNotEmpty) {
//     var id = queryParams['id'];
//     if (id != null) {
//       GetIt.I<AppRouter>().pushAll([
//         const LauncherAppRoute(
//           children: [
//             MainRouterPage(),
//           ],
//         ),
//         PrayersDetailRoute(id: int.parse(id))
//       ]);
//     }
//   }
// }

// Future<void> navigateToNews(Uri link) async {
//   print("event.link.queryParameters ${link.queryParameters}");

//   var deepLink = link;
//   final queryParams = deepLink.queryParameters;
//   if (queryParams.isNotEmpty) {
//     var id = queryParams['id'];
//     if (id != null) {
//       GetIt.I<AppRouter>().pushAll([
//         const LauncherAppRoute(
//           children: [
//             MainRouterPage(),
//           ],
//         ),
//         NewsDetailRoute(id: int.parse(id))
//       ]);
//     }
//   }
// }

// Future<void> navigateToName(Uri link) async {
//   print("event.link.queryParameters ${link.queryParameters}");

//   var deepLink = link;
//   final queryParams = deepLink.queryParameters;
//   if (queryParams.isNotEmpty) {
//     var id = queryParams['id'];
//     if (id != null) {
//       GetIt.I<AppRouter>().pushAll([
//         const LauncherAppRoute(
//           children: [
//             MainRouterPage(),
//           ],
//         ),
//         NameDetailRoute(id: int.parse(id))
//       ]);
//     }
//   }
// }
