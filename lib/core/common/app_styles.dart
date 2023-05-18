import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';




enum CustomTextStyles {
  s16w200,
  s14w200,
  s14w400,
  s36w500,
  s36w700,



}


enum FontTypes { Philosopher, SF_Pro }


TextStyle getTextStyle(
    CustomTextStyles textStyle, {
      Color color = AppColors.black,
      FontTypes fontFamily = FontTypes.Philosopher,
    }) {
  switch (textStyle) {
    case CustomTextStyles.s36w700:
      return TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36.sp,
          fontFamily: fontFamily.name,
          color: color
      );
    case CustomTextStyles.s14w400:
      return TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: fontFamily.name,
          color: color

      );
    case CustomTextStyles.s14w200:
      return TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 14.sp,
          fontFamily: FontTypes.SF_Pro.name,
          color: color

      );
    case CustomTextStyles.s16w200:
      return TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 16.sp,
          fontFamily: FontTypes.SF_Pro.name,
          color: color

      );
    case CustomTextStyles.s36w500:
      return TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 36.sp,
          fontFamily: FontTypes.SF_Pro.name,
          color: color

      );
    default:
      return const TextStyle();
  }
}


