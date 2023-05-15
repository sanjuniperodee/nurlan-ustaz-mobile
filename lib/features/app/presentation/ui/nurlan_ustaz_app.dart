import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/base.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/launcher.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';

class NurlanUstazApp extends StatelessWidget {
  NurlanUstazApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiblocWrapper(
      child: MaterialApp.router(
        // title: 'Flutter Demo',
        // debugShowCheckedModeBanner: false,
        // locale: EasyLocalization.of(context)?.locale,
        // localizationsDelegates: [
        //   ...context.localizationDelegates,
        //   // CountryLocalizat
        //   // ions.delegate,
        // ],
        // supportedLocales: context.supportedLocales,
        theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        // home:  const LauncherApp(),
        // home: HomePage(),
        // home: const AuthRegisterPage(),
      ),
    );
  }
}
