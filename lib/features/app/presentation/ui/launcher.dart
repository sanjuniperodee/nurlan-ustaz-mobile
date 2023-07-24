import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/app_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/base.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/on_boarding.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/login_page.dart';

class LauncherApp extends StatefulWidget {
  const LauncherApp({super.key});

  @override
  State<LauncherApp> createState() => _LauncherAppState();
}

class _LauncherAppState extends State<LauncherApp> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    BlocProvider.of<AppBloc>(context).add(const AppEvent.checkAuth());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: AnimatedSplashScreen(
          splashIconSize: double.infinity,
            duration: 3000,
            splash:
            Scaffold(
              body: Container(
                child: Image.asset(
                  'assets/images/on_boarding.jpg',
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,

            nextScreen: _salam(),
            splashTransition: SplashTransition.fadeTransition,
            ));
  }
}

Widget _salam() {
  return BlocConsumer<AppBloc, AppState>(
    builder: (context, state) {
      return state.maybeWhen(
        onBoardingState: () {
          return const OnBoardingPage();
        },
        loadingState: () {
          return const Base();
          // return const _Scaffold(
          //   child: Center(
          //     child: CircularProgressIndicator(
          //       color: Colors.amber,
          //     ),
          //   ),
          // );
        },
        notAuthorizedState: () {
          // return const SignInPage();
          return LoginPage();
        },
        // notVerifyed: () {
        //   return const SizedBox();
        // },
        errorState: (String message) {
          return const _Scaffold(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          );
        },
        orElse: () {
          return const Base();
        },
      );
    },
    listener: (context, state) {
      state.whenOrNull(
        inAppState: () {
          // BlocProvider.of<ProfileCubit>(context).getProfile();
        },
      );
    },
  );
}

class _Scaffold extends StatelessWidget {
  final Widget child;

  const _Scaffold({
    required this.child,
    // super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: child),
    );
  }
}
