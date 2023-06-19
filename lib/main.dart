import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:nurlan_ustaz_flutter/core/model/async_app_dependecies.dart';
import 'package:nurlan_ustaz_flutter/features/app/logic/main_runner.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/nurlan_ustaz_app.dart';

Future<void> firebaseInit() async {
  FirebaseDynamicLinks.instance.onLink.listen((event) {
    print(event.link);
    print(event.link.path);
    print(event.link.pathSegments.toList());
    print(event.link.queryParametersAll.values.first.toString());
    print(event.link.query);
    print(event.link.queryParameters['username']);
    print(event.link.queryParameters['password']);
  }).onError((e) {
    print(e);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await firebaseInit();
  MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) {
        return NurlanUstazApp();
      });
}
