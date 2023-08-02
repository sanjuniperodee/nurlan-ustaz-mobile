import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/app_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/base.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/on_boarding.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/login_page.dart';

import '../../../../core/services/locator_service.dart';
import '../../../../core/utils/alert_utilrs.dart';

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

  Future<bool> _onWillPop() async {
    var dialog = await AlertUtils.showTwoOptionDialog(
        context: context,
        messageKey: 'exit_des'.tr(),
        title: 'exit'.tr(),
        button1Text: 'cancel'.tr(),
        button2Text: 'exit2'.tr());
    return dialog == true ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onWillPop, child: _salam());
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
        notAuthorizedState: () {
          AutoRouter.of(context)
              .pushAndPopUntil(LoginPageRoute(), predicate: (route) => false);

        },
        notAuthorizedDialogState: () async {
          var dialog = await AlertUtils.showTwoOptionDialog(
              context: context,
              messageKey: 'exit_des'.tr(),
              title: 'exit'.tr(),
              button1Text: 'cancel'.tr(),
              button2Text: 'exit2'.tr());
          return dialog == true
              ? BlocProvider.of<AppBloc>(context)
                  .add(const AppEvent.nonAuthorizedDialog())
              : BlocProvider.of<AppBloc>(context)
                  .add(const AppEvent.logining());
        },
        inAppState: () {
          context.router.pop();
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
