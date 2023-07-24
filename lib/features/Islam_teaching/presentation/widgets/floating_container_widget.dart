import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class FloatinContainerWidget extends StatelessWidget {
  final String text;
  final String url;
  final void Function()? onTap;
  final String? color;
  const FloatinContainerWidget({
    Key? key,
    required this.text,
    required this.url,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
            color: const Color(0xFF8F8CF7).withOpacity(0.13),
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: getTextStyle(CustomTextStyles.s16w600),
            ),
            SvgPicture.asset(
              url,
              color: color != null ? AppColors.primaryColor : AppColors.black,
            )
          ],
        ),
      ),
    );
  }
}
