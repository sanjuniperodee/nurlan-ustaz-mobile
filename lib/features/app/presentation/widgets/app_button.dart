import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? inactiveTextColor;
  bool isLoading;
  AppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.inactiveTextColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(onTap == null
            ? AppColors.lightGrey
            : color ?? AppColors.primaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(75).r)),
      ),
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 339.w,
        child: isLoading
            ? Container(
                height: 15.h,
                width: 15.w,
                padding: const EdgeInsets.all(0.0).r,
                child: const Center(child: CircularProgressIndicator()),
              )
            : Text(text,
                textAlign: TextAlign.center,
                style: AppStyles.sp14fw600.apply(
                  color: onTap != null
                      ? textColor ?? AppColors.white
                      : AppColors.grey,
                )),
      ),
    );
  }
}
