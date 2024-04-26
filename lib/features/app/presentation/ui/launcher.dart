import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/app_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/base.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/login_page.dart';

import '../../../../core/utils/alert_utilrs.dart';
import '../../../../update_service/update_service.dart';
import '../../on_boarding/presentation/ui/on_boarding.dart';

int _backClickDateTime = 0;
const int _backClickThreshHold = 3000;

@RoutePage()
class LauncherAppPage extends StatefulWidget {
  const LauncherAppPage({super.key});

  @override
  State<LauncherAppPage> createState() => _LauncherAppPageState();
}

bool isShow = true;

class _LauncherAppPageState extends State<LauncherAppPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  final _appVersionService = AppVersionService();

  checkAppVersion() async {
    _appVersionService.checkAppVersion(context);
  }

  Future<void> init() async {
    BlocProvider.of<AppBloc>(context).add(const AppEvent.checkAuth());
    checkAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return _appBLoc();
  }
}

Widget _appBLoc() {
  return BlocConsumer<AppBloc, AppState>(
    builder: (context, state) {
      return WillPopScope(
        onWillPop: () async {
          return await AlertUtils.showTwoOptionDialog(
            isApp: true,
              context: context,
              messageKey: 'exit_from_app'.tr(),
              title: 'exit'.tr(),
              button1Text: 'cancel'.tr(),
              button2Text: 'exit2'.tr());
        },
        child: state.maybeWhen(
          onBoardingState: () {
            return const OnBoardingPage();
          },
          loadingState: () {
            return const Base();
          },
          notAuthorizedState: () {
            return const LoginPage();
          },
          errorState: (String message) {
            return const _Scaffold(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.linearBlue,
                ),
              ),
            );
          },
          orElse: () {
            return const Base();
          },
        ),
      );
    },
    listener: (context, state) async {
      state.whenOrNull(
        notAuthorizedState: () {
          AutoRouter.of(context)
              .pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
        },
        notAuthorizedDialogState: () async {
          var dialog = await AlertUtils.showTwoOptionDialog(
              context: context,
              messageKey: '401.content'.tr(),
              title: '401.title'.tr(),
              button1Text: 'cancel'.tr(),
              button2Text: '401.login'.tr());
          if (dialog == true) {
            // ignore: use_build_context_synchronously
            AutoRouter.of(context).pushAndPopUntil(const LoginRoute(),
                predicate: (route) => false);
          } else {
            // ignore: use_build_context_synchronously
            AutoRouter.of(context).pushAndPopUntil(const MainRouterPage(),
                predicate: (route) => false);
          }
        },
        inAppState: () {
          //context.router.pop();
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
