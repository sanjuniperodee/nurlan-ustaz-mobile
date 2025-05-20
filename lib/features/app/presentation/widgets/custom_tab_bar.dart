import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final Function(int) onTap;
  final double? height;
  final int length;
  const CustomTabBar(
      {super.key,
      required this.tabs,
      this.height,
      required this.onTap,
      required this.length});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        height: height ?? 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.white.withOpacity(0.5)),
        child: TabBar(
          labelStyle: getTextStyle(CustomTextStyles.s16w500)
              .copyWith(fontFamily: FontTypes.SFPro.name),
          labelColor: AppColors.black,
          padding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24.sp),
          ),
          labelPadding: EdgeInsets.zero,
          // indicatorPadding: EdgeInsets.zero,
          // controller: _tabController,
          unselectedLabelColor: Color(0xFF444343),
          onTap: onTap,
          tabs: tabs,
        ),
      ),
    );
  }
}
