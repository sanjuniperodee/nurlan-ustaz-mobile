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
            left: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/checklist_background.png',
              fit: BoxFit.fill,
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