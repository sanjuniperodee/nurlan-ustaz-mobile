import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:secure_application/secure_application.dart';

class NurlanUstazApp extends StatefulWidget {
  const NurlanUstazApp({super.key});

  @override
  State<NurlanUstazApp> createState() => _NurlanUstazAppState();
}

class _NurlanUstazAppState extends State<NurlanUstazApp> {
  late AppRouter appRouter;

  // checkAppVersion() async {
  //   log('app_version');
  //   await Future.delayed(const Duration(seconds: 4));
  //         AppVersionService.(context);
  // }

  static final FirebaseAnalytics _firebaseAnalytics =
      FirebaseAnalytics.instance;

  @override
  void initState() {
    // checkAppVersion();
    appRouter = AppRouter(
      authGuard: AuthGuard(authLocalDs: GetIt.I()),
      onboardingGuard: OnboardingGuard(onboardingLocalDs: GetIt.I()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeAnimationDuration: const Duration(milliseconds: 100),

      routerConfig: appRouter.config(
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(analytics: _firebaseAnalytics),
        ],
        reevaluateListenable: ReevaluateListenable.stream(
          GetIt.I<AuthLocalDs>(),
        ),
      ),

      debugShowCheckedModeBanner: false,
      locale: EasyLocalization.of(context)?.locale,
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      localizationsDelegates: EasyLocalization.of(context)?.delegates,
      // ...context.localizationDelegates,
      // CountryLocalizat
      // ions.delegate,

      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return SecureApplication(
          child: MultiblocWrapper(
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
