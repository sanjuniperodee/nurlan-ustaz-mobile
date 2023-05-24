import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

class GlobalCustomBody extends StatelessWidget {
  final double? horizontalPadding;
  final Widget? child;
  const GlobalCustomBody({
    Key? key,
    this.child, this.horizontalPadding,
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
              Assets.oyuSvg,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 40, left: horizontalPadding ?? 16, right: horizontalPadding ?? 16).r,
            child: child ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
