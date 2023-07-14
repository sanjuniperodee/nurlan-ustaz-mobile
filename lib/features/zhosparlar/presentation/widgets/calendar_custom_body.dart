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
          Image.asset(
            Assets.gradient,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 280.r,
            top: 10.r,
            child: SvgPicture.asset(
              'assets/icons/calendar_timer.svg',
              color: AppColors.white,
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