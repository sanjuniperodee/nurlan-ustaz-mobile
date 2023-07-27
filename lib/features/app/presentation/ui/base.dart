import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import '../../../tandaulilar/presentation/bloc/tandaulilar_cubit.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.lightBlue,
      routes: [
        const MainRouterPage(),
        const IslamTeachingRouterPage(),
        TusZhoruRouterPage(),
        const TandaulilarMainRouterPage(),
        const ZhosparymRouterPage(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0).r,
            topRight: const Radius.circular(30.0).r,
          ),
          child: BottomNavigationBar(
              selectedLabelStyle: getTextStyle(CustomTextStyles.s14w400)
                  .apply(fontFamily: FontTypes.Philosopher.name),
              unselectedLabelStyle: getTextStyle(CustomTextStyles.s14w400)
                  .copyWith(
                      fontFamily: FontTypes.Philosopher.name,
                      color: AppColors.primaryColor),
              backgroundColor: AppColors.white,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.grey1,
              // unselectedLabelStyle: TextStyle(fontSize: 10),
              onTap: (index) {
                if (tabsRouter.activeIndex == index) {
                  tabsRouter.popTop();
                } else {
                  tabsRouter.setActiveIndex(index);
                }
                if (tabsRouter.activeIndex != 4) {
                  log('TAPP');
                  BlocProvider.of<TandaulilarCubit>(context)
                      .livesT(page: 1, isFirstCall: true);
                  BlocProvider.of<TandaulilarCubit>(context)
                      .newsT(page: 1, isFirstCall: true);
                  BlocProvider.of<TandaulilarCubit>(context)
                      .seminarT(page: 1, isFirstCall: true);
                }
              },
              currentIndex: tabsRouter.activeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: tabsRouter.activeIndex != 0
                      ? SvgPicture.asset(
                          Assets.homeSvg,
                        )
                      : SvgPicture.asset(Assets.home_1Svg),
                  label: 'main_page'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: tabsRouter.activeIndex != 1
                      ? SvgPicture.asset(Assets.bookSvg)
                      : SvgPicture.asset(Assets.book_1Svg),
                  label: 'Islam_study'.tr(),
                ),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.moonSvg,
                          height: 55.h,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0).r,
                          child: Text(
                            'dream_interpretation'.tr(),
                            style: getTextStyle(CustomTextStyles.s14w400)
                                .copyWith(
                                    fontFamily: FontTypes.Philosopher.name,
                                    color: tabsRouter.activeIndex == 2
                                        ? AppColors.primaryColor
                                        : AppColors.grey1),
                          ),
                        )
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: tabsRouter.activeIndex != 3
                      ? SvgPicture.asset(Assets.book2Svg)
                      : SvgPicture.asset(Assets.book_2Svg),
                  label: 'Favourite'.tr(),
                ),
                BottomNavigationBarItem(
                  icon: tabsRouter.activeIndex != 4
                      ? SvgPicture.asset(Assets.calendarSvg)
                      : SvgPicture.asset(Assets.calendar_1Svg),
                  label: 'plans'.tr(),
                ),
              ]),
        );
      },
    );
  }
}
