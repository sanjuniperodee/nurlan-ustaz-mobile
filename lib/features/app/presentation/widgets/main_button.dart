import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  const MainButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(
          // left: 16.r,
          // right: 16.r,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyles.sp20fw700.apply(color: AppColors.black),
          ),

          // SizedBox(
          //   width: 150.w,
          // ),
          SvgPicture.asset(
            Assets.chevronDownSvg,
            width: 24.r,
            height: 24.r,
          )
        ],
      ),
    );
  }
}
