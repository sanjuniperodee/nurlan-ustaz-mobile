import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/custom_tab_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';

@RoutePage()
class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        LoginTabRoute(),
        RegistrationFlow(),
      ],
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        final prevIndex = tabsRouter.previousIndex;
        final currIndex = tabsRouter.activeIndex;
        return SlideTransition(
          position: animation.drive(Animatable.fromCallback(
            (value) {
              if (prevIndex == null || prevIndex == currIndex) {
                return Offset.zero;
              }
              if (prevIndex < currIndex) {
                return Offset(1 - value, 0);
              }
              return Offset(-1 + value, 0);
            },
          )),
          child: child,
        );
      },
      builder: (context, child) {
        final padding = MediaQuery.paddingOf(context);
        return Scaffold(
          body: GlobalCustomBody(
            topGradientOffset: -150,
            topOrnamentOffset: -20,
            padding: EdgeInsets.zero,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  forceMaterialTransparency: true,
                  bottom: CustomTabBar(
                    labels: [
                      'Entry'.tr(),
                      'register'.tr(),
                    ],
                    tabsRouter: AutoTabsRouter.of(context),
                  ),
                ),
                //
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16).copyWith(
                      top: 24,
                      bottom: 32,
                    ),
                    child: Text(
                      'welcome'.tr(),
                      style: getTextStyle(CustomTextStyles.s36w700).copyWith(
                          fontFamily: FontTypes.Philosopher.name, fontSize: 32),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                //
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: child,
                  ),
                ),
                //
                SliverToBoxAdapter(
                  child: SizedBox(height: 24 + padding.bottom),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
