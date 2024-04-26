import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool isFlutterLocalNotificationsInitialized = false;
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log(message.data.toString());

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

    final String objectType = data['object_type'];
    final String objectId = data['object_id'];

    switch (objectType) {
      case 'seminar':
        getIt<AppRouter>().pushAll([
          const LauncherAppRoute(
            children: [
              MainRouterPage(),
            ],
          ),
          SeminarDetailRoute(id: int.parse(objectId)),
        ]);
        break;

      case 'news':
        getIt<AppRouter>().pushAll([
          const LauncherAppRoute(
            children: [
              MainRouterPage(),
            ],
          ),
          NewsDetailRoute(id: int.parse(objectId)),
        ]);
        break;

      case 'charity':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            const CharityRoute(),
          ]);
        }
        break;

      case 'muslim_name':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            NameDetailRoute(id: int.parse(objectId)),
          ]);
        }
        break;

      case 'dream_interpretation':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            TusZhoruDetailRoute(id: int.parse(objectId)),
          ]);
        }
        break;

      case 'partner_shop':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            const ShopRoute(),
          ]);
        }
        break;

      case 'imam_service':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            const ServicesRoute(),
          ]);
        }
        break;

      case 'custom_dream':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            CustomTusZhoruDetailRoute(id: int.parse(objectId)),
          ]);
        }
        break;

      case 'order_dream':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            TusZhoruDetailRoute(id: int.parse(objectId)),
          ]);
        }
        break;

      case 'order_seminar':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            SeminarDetailRoute(id: int.parse(objectId)),
          ]);
        }
        break;

      case 'live_in_progress':
        if (objectId != '0' && objectId.isNotEmpty) {
          final Uri url = Uri.parse(objectId);
          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
            throw Exception('Could not launch');
          }
        }
        break;

      case 'live':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            LiveBroadcastsRoute(),
          ]);
        }
        break;

      case 'tell_me_ustaz':
        getIt<AppRouter>().pushAll([
          const LauncherAppRoute(
            children: [
              MainRouterPage(),
            ],
          ),
          const UstazAitinizhiRoute(),
        ]);
        break;

      case 'checklist':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                MainRouterPage(),
              ],
            ),
            const ZhosparymMainRouterPage(),
          ]);
        }
        break;

      case 'ayat_of_the_day':
        if (objectId != '0' && objectId.isNotEmpty) {
          getIt<AppRouter>().pushAll([
            const LauncherAppRoute(
              children: [
                IslamTeachingRouterPage(),
              ],
            ),
            // const ShopRoute(),
          ]);
        }
        break;

      default:
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
  String title = message.data['title'];
  if (title == 'None' || title.isEmpty || title.trim() == '') {
    title = 'Nurlan Ustaz'; // Replace with the default value
  }
  final bigTextStyleInformation = BigTextStyleInformation(
    message.data["description"],
    contentTitle: title, // Title of the full notification
  );

  await flutterLocalNotificationsPlugin.show(
    message.hashCode,
    title,
    message.data["description"],
    payload: json.encode(message.data),
    NotificationDetails(
      android: AndroidNotificationDetails(
        styleInformation: bigTextStyleInformation,
        fullScreenIntent: true,
        setAsGroupSummary: true,
        category: AndroidNotificationCategory.message,
        channelShowBadge: true,
        visibility: NotificationVisibility.public,
        channel.id,
        channel.name,
        channelDescription: channel.description,
        importance: channel.importance,
        playSound: true,
        autoCancel: true,
        sound: channel.sound,
        priority: Priority.max,
      ),
      iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          interruptionLevel: InterruptionLevel.timeSensitive),
    ),
  );
}

Future<void> scheduledNotification(
    String title, String description, String time, int id) async {
  try {
    flutterLocalNotificationsPlugin
        .schedule(
          id + 1,
          title,
          description.tr(),
          // ignore: sdk_version_since
          DateTime.now().copyWith(
            hour: int.parse(time.split(':').first),
            minute: int.parse(time.split(':').last),
          ),
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: channel.importance,
                playSound: true,
                autoCancel: false,
                priority: Priority.high,
                icon: '@mipmap/ic_launcher'),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
        )
        .then((value) => log(
            'notifi-time2-${DateTime.now().copyWith(hour: int.parse(time.split(':').first), minute: int.parse(time.split(':')[1]), second: int.parse(time.split(':').last))}'));
  } catch (e) {
    log('noti-error-${e.toString()}');
  }
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
