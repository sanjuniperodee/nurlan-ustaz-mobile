import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/bottom_nav_bar.dart';

@RoutePage()
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      backgroundColor: Color(0xFFF1F1F1),
      extendBody: true,
      routes: const [
        MainRouterPage(),
        IslamTeachingRouterPage(),
        TusZhoruRouterPage(),
        TandaulilarMainRouterPage(),
        ZhosparymMainRouterPage(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavBarItem.asset(
              active: Assets.home_1Svg,
              inactive: Assets.homeSvg,
              label: 'main_page',
            ),
            BottomNavBarItem.asset(
              active: Assets.book_1Svg,
              inactive: Assets.bookSvg,
              label: 'Islam_study',
            ),
            BottomNavBarItem.widget(
              widget: SizedBox(
                height: 55.h,
                width: 55.w,
                child: Lottie.asset('assets/animations/Moon_v08.json'),
              ),
              label: 'dream_interpretation',
            ),
            BottomNavBarItem.asset(
              inactive: Assets.book2Svg,
              active: Assets.book_2Svg,
              label: 'Favourite',
            ),
            BottomNavBarItem.asset(
              active: Assets.calendar_1Svg,
              inactive: Assets.calendarSvg,
              label: 'plans',
            ),
          ],
        );
      },
    );
  }
}
