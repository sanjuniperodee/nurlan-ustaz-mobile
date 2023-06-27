
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';

import 'package:nurlan_ustaz_flutter/core/model/async_app_dependecies.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/main_runner.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/nurlan_ustaz_app.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_details_page.dart';

import 'features/tus_zhoru/presentation/ui/custom_tus_zhoru_details_page.dart';

Future<void> firebaseInit() async {
  FirebaseDynamicLinks.instance.onLink.listen((event) {
    if (event.link.queryParameters['type'] == 'tusZhoru') {
      navigateToTusZhoru(event.link);
    }
    if (event.link.queryParameters['type'] == 'customTusZhoru') {
      navigateToCustomTusZhoru(event.link);
    } if (event.link.queryParameters['type'] == 'seminar') {
    navigateToTusZhoru(event.link);
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
  await firebaseInit();
  MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) {
        return NurlanUstazApp();
      });
}

Future<void> navigateToTusZhoru(Uri link) async {
  print("event.link.queryParameters ${link.queryParameters}");

  var deepLink = link;
  final queryParams = deepLink.queryParameters;
  if (queryParams.length > 0) {
    var id = queryParams['id'];
    if (id != null) {

      Navigator.push(
        rootNavigatorKey.currentContext!,

        MaterialPageRoute(builder: (context)  {
          return TusZhoruDetailPage(
            id: int.parse(id),
          );
        }),
      );
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

      Navigator.push(
        rootNavigatorKey.currentContext!,

        MaterialPageRoute(builder: (context)  {
          return CustomTusZhoruDetailPage(
            id: int.parse(id),
          );
        }),
      );
    }
  }
}

