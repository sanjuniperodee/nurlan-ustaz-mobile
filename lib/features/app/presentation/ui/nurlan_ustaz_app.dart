import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/services/connection_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/multibloc_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:rxdart/rxdart.dart';
import 'package:secure_application/secure_application.dart';

class NurlanUstazApp extends StatefulWidget {
  const NurlanUstazApp({super.key});

  @override
  State<NurlanUstazApp> createState() => _NurlanUstazAppState();
}

class _NurlanUstazAppState extends State<NurlanUstazApp> {
  late final AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter(
      authGuard: AuthGuard(authLocalDs: GetIt.I()),
      connectionGuard: ConnectionGuard(connectionService: GetIt.I()),
      onboardingGuard: OnboardingGuard(onboardingLocalDs: GetIt.I()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      useFallbackTranslations: true,
      supportedLocales: const [
        Locale('kk'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            themeAnimationDuration: const Duration(milliseconds: 100),
            routerConfig: appRouter.config(
              navigatorObservers: () => [
                FirebaseAnalyticsObserver(
                    analytics: FirebaseAnalytics.instance),
              ],
              reevaluateListenable: ReevaluateListenable.stream(
                Rx.merge([
                  GetIt.I<AuthLocalDs>(),
                  GetIt.I<ConnectionService>(),
                ]),
              ),
            ),
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme: ThemeData(
              // useMaterial3: false,
              fontFamily: FontFamily.sfPro,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: AppColors.primaryColor,
              scaffoldBackgroundColor: AppColors.lightBlue,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
                error: AppColors.red,
                primary: AppColors.white,
                onPrimary: AppColors.black,
              ),
              actionIconTheme: ActionIconThemeData(
                backButtonIconBuilder: (context) {
                  return SvgPicture.asset(Assets.backButtonSvg);
                },
              ),
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
        },
      ),
    );
  }
}
