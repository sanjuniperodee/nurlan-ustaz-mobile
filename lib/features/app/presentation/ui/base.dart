import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/islam_teaching_icon.dart';

import '../../../../core/utils/alert_utilrs.dart';
import '../../../home/presentation/widgets/qiblah_widget.dart';
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

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        transitionBuilder: (context,child, animation){
          return TweenAnimationBuilder<Offset>(
            tween: Tween(begin: Offset(0.0, 1.0), end: Offset.zero),
            duration: Duration(milliseconds: 500), // Adjust the duration as needed.
            curve: Curves.easeInOutCubic, // Adjust the curve as needed.
            builder: (context, offset, child) {
              return Transform.translate(
                offset: offset,
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              );
            },
            child: child,
          );
        },

      backgroundColor: Color(0xFFF1F1F1),
      extendBody: true,
      routes: [
        const MainRouterPage(),
        const IslamTeachingRouterPage(),
        TusZhoruRouterPage(),
        const TandaulilarMainRouterPage(),
        const ZhosparymMainRouterPage(),
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
                  setState(() {
                    isShow = true;
                  });
                  //tabsRouter.popTop();
                } else {
                  tabsRouter.setActiveIndex(index);
                }

              },
              currentIndex: tabsRouter.activeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: tabsRouter.activeIndex != 0
                      ? SvgPicture.asset(
                          height: 22.5,
                          width: 22.5,
                          Assets.homeSvg,
                        )
                      : SvgPicture.asset(
                          Assets.home_1Svg,
                        ),
                  label: 'main_page'.tr(),
                ),
                BottomNavigationBarItem(
                    icon: IslamTeachingIcon(isCurrent: tabsRouter.activeIndex != 1, isKazakh: EasyLocalization.of(context)!.locale.toString() == 'kk',),

                    label:EasyLocalization.of(context)!.locale.toString() == 'kk'?  'Islam_study'.tr() : ''),
                BottomNavigationBarItem(
                  icon: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 55.h,
                          width: 55.w,
                          child: Lottie.asset(
                            'assets/animations/Moon_v08.json',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                  ),
                  label: 'dream_interpretation'.tr(),
                ),
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
