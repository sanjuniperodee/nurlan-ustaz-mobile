// ignore_for_file: cancel_subscriptions

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';

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
    await Hive.initFlutter();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // await NotificationService().init();
    
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final app = await _initApp(shouldSend, asyncDependencies, appBuilder);
    runApp(
      app,
    );
  }
}
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }
