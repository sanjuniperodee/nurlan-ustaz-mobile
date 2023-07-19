import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class NurlanUstazApp extends StatelessWidget {
  NurlanUstazApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiblocWrapper(
      child: MaterialApp.router(
        key: rootNavigatorKey,
        // title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: EasyLocalization.of(context)?.locale,

        localizationsDelegates: [
          ...context.localizationDelegates,
          // CountryLocalizat
          // ions.delegate,
        ],
        supportedLocales: context.supportedLocales,
        theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
