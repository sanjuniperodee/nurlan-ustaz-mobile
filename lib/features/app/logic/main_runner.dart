// ignore_for_file: cancel_subscriptions

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/core/services/notification_service.dart';
import 'package:nurlan_ustaz_flutter/firebase_options.dart';

typedef AsyncDependencies<D> = Future<D> Function();
typedef AppBuilder<D> = Widget Function(
  D dependencies,
);

mixin MainRunner {
  static Future<Widget> _initApp<D>(
    bool shouldSend,
    AsyncDependencies<D> asyncDependencies,
    AppBuilder<D> app,
  ) async {
    final dependencies = await asyncDependencies();

    return app(dependencies);
  }

  static Future<void> run<D>({
    bool shouldSend = !kDebugMode,
    required AsyncDependencies<D> asyncDependencies,
    required AppBuilder<D> appBuilder,
  }) async {
    // ignore: avoid-ignoring-return-values
    WidgetsFlutterBinding.ensureInitialized();
    await initLocator();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [];
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await NotificationService().init();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final app = await _initApp(shouldSend, asyncDependencies, appBuilder);
    runApp(
      EasyLocalization(
        useFallbackTranslations: true,
        supportedLocales: const [
          Locale('ru'),
          Locale('kk'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('kk'),
        child: app,
      ),
    );
  }
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
