import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool isFlutterLocalNotificationsInitialized = false;
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
}

@pragma('vm:entry-point')
Future<void> notificationTapBackground(
    NotificationResponse notificationResponse) async {
  try {
    log(notificationResponse.payload.toString());
    Map<String, dynamic> data = json.decode(
      notificationResponse.payload!,
    );
    log('NOTIFICATION');
    log('NOTIFICATION${data.toString()}');
    if (data['object_type'] == 'seminar' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      log('YESSSSS');
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        SeminarDetailRoute(id: int.parse(id))
      ]);
      // getIt<OrderByIdCubit>().getOrderById(id: int.parse(id));
    } else if (data['object_type'] == 'news' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        NewsDetailRoute(id: int.parse(id))
      ]);
    } else if (data['object_type'] == 'charity' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        const CharityRoute()
      ]);
    } else if (data['object_type'] == 'muslim_name' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        NameDetailRoute(id: int.parse(id)),
      ]);
    } else if (data['object_type'] == 'dream_interpretation' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        TusZhoruDetailRoute(id: int.parse(id)),
      ]);
    } else if (data['object_type'] == 'partner_shop' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        const ShopRoute(),
      ]);
    } else if (data['object_type'] == 'imam_service' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        const ServicesRoute(),
      ]);
    } else if (data['object_type'] == 'custom_dream' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        CustomTusZhoruDetailRoute(id: int.parse(id)),
      ]);
    } else if (data['object_type'] == 'order_dream' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        TusZhoruDetailRoute(id: int.parse(id)),
      ]);
    } else if (data['object_type'] == 'order_seminar' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        SeminarDetailRoute(id: int.parse(id))
      ]);
    } else if (data['object_type'] == 'live_in_progress' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      String id = data['object_id'];
      final Uri url = Uri.parse(id);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch');
      }
    } else if (data['object_type'] == 'live' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        LiveBroadcastsRoute(),
      ]);
    } else if (data['object_type'] == 'tell_me_ustaz') {
      log('TEMAAA');
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        const UstazAitinizhiRoute(),
      ]);
    } else if (data['object_type'] == 'checklist' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            MainRouterPage(),
          ],
        ),
        const ZhosparymMainRouterPage(),
      ]);
    } else if (data['object_type'] == 'ayat_of_the_day' &&
        data['object_type'] != 0 &&
        data['object_type'] != '') {
      // String id = data['object_id'];
      getIt<AppRouter>().pushAll([
        const LauncherAppRoute(
          children: [
            IslamTeachingRouterPage(),
          ],
        ),
        // const ShopRoute(),
      ]);
    } else {
      log('NO');
    }
    log(data.toString());
  } catch (e) {
    log(e.toString());
  }
}

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  final DarwinInitializationSettings initializationSettingsIOS =
      // ignore: prefer_const_constructors
      DarwinInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: null,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      notificationTapBackground(details);
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );
  const AndroidNotificationChannel(
    'chanel_id_13a', // id
    'Max Importance Notifications', // title
    playSound: true,
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  isFlutterLocalNotificationsInitialized = true;
}

Future<void> showFlutterNotification(RemoteMessage message) async {
  log(message.data.toString());
  await flutterLocalNotificationsPlugin.show(
    message.hashCode,
    message.data["title"],
    message.data["body"],
    payload: json.encode(message.data),
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        importance: channel.importance,
        playSound: true,
        autoCancel: true,
        sound: channel.sound,
        priority: Priority.high,
      ),
    ),
  );
}

class NotificationService {
  // SharedPreferences sharedPreferences;

  NotificationService();
  late FirebaseMessaging _messaging;
  Future<void> init() async {
    _messaging = FirebaseMessaging.instance;
    _messaging.getInitialMessage().then((value) => log('Message is $value'));

    if (Platform.isIOS) {
      await _requestPermissionToNotifications(_messaging);
    }

    _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await getDeviceToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      final RemoteNotification? notification = event.notification;

      final AndroidNotification? android =
          Platform.isAndroid ? event.notification?.android : null;

      if (notification != null) {
        if (Platform.isAndroid && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: '@mipmap/ic_launcher',
              ),
            ),
          );
        }
      }
    });
    await setupFlutterNotifications();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  Future<String?> getDeviceToken() async {
    final String? deviceToken = await FirebaseMessaging.instance.getToken();

    log('DEVICE TOKEN :::::${deviceToken}');
    return deviceToken;
  }

  Future<void> _requestPermissionToNotifications(
    FirebaseMessaging _messaging,
  ) async {
    final NotificationSettings settings = await _messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }
}
