// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

enum CustomTextStyles {
  s8w700,
  s12w200,
  s12w400,
  s12w500,
  s12w600,
  s12w700,
  s14w200,
  s14w400,
  s14w500,
  s14w600,
  s14w700,
  s14w800,
  s16w200, //s16
  s16w400,
  s16w500,
  s16w600,
  s16w700,
  s18w400,
  s36w500,
  s36w700,
  s20w700,
  s24w700,
}

enum FontTypes { Philosopher, SFPro }

mixin FontFamily {
  static const philosopher = 'Philosopher';
  static const sfPro = 'SFPro';
}

TextStyle getTextStyle(
  CustomTextStyles textStyle, {
  Color color = AppColors.black,
  FontTypes fontFamily = FontTypes.Philosopher,
}) {
  switch (textStyle) {
    case CustomTextStyles.s8w700:
      return TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 8.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s36w700:
      return TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 36.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s12w400:
      return TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s18w400:
      return TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s16w500:
      return TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s16w400:
      return TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s16w700:
      return TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s20w700:
      return TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s14w400:
      return TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s14w200:
      return TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 14.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s16w200:
      return TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 16.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s24w700:
      return TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
          fontFamily: fontFamily.name,
          color: color);
    case CustomTextStyles.s36w500:
      return TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 36.sp,
          fontFamily: fontFamily.name,
          color: color);
    default:
      return const TextStyle();
  }
}
