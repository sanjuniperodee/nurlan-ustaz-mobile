
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();






class NurlanUstazApp extends StatefulWidget {
  NurlanUstazApp({super.key});

  @override
  State<NurlanUstazApp> createState() => _NurlanUstazAppState();
}

class _NurlanUstazAppState extends State<NurlanUstazApp> {

  late AppRouter _rootRouter;

  @override
  void initState() {
    _rootRouter = getIt<AppRouter>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiblocWrapper(

      child: ScreenUtilInit(
          designSize:  Size(375, 812),
          builder: (context,child) {
          return MaterialApp.router(
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
            routerDelegate: _rootRouter.delegate(),
            routeInformationParser: _rootRouter.defaultRouteParser(),
          );
        }
      ),
    );
  }
}
