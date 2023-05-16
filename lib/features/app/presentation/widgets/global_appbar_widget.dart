import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
      ],
    );
  }
}
