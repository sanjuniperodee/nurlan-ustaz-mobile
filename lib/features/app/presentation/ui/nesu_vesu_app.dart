import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/base.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/launcher.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';

class NurlanUstazApp extends StatelessWidget {
  const NurlanUstazApp({super.key});

  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // return const MultiblocWrapper(
    //   child:   LauncherApp(),
    // );compileSdkVersion

    return MaterialApp(home: Base());
  }
}
