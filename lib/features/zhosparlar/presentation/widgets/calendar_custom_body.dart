import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

import '../../../../core/common/colors.dart';

class CalendarCustomBody extends StatelessWidget {
  final double? right;
  final double? left;
  final Widget? child;
  const CalendarCustomBody({
    Key? key,
    this.child,
    this.right,
    this.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Image.asset(
              'assets/images/calendar_fon.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 130.h,
            left: 300.w,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  AppColors.white.withOpacity(0.001),
                  AppColors.white,
                ],
              ).createShader(bounds),
              child: SvgPicture.asset(
                'assets/icons/calendar_custom_icon_2.svg',
                color: AppColors.white.withOpacity(0.5),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 120.w,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: [
                  AppColors.white.withOpacity(0.001),
                  AppColors.white,
                ],
              ).createShader(bounds),
              child: SvgPicture.asset(
                'assets/icons/calendar_timer.svg',
                color: AppColors.white.withOpacity(0.5),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(top: 40, left: left ?? 16, right: right ?? 16)
                .r,
            child: child ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}