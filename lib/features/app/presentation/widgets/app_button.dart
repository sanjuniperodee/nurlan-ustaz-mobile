import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  final Color textColor;
  final Color inactiveTextColor;
  final bool isLoading;
  final bool isActive;
  final double? textSize;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor = AppColors.white,
    this.inactiveTextColor = AppColors.grey1,
    this.isLoading = false,
    this.isActive = true,
    this.textSize,
  });

  @protected
  static const kBorderRadius = BorderRadius.all(Radius.circular(30));

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        gradient: isActive
            ? color != null
                ? null
                : AppColors.gradientPrimaryActiveButton
            : AppColors.gradientPrimaryDisabledButton,
        borderRadius: kBorderRadius.r,
      ),
      child: MaterialButton(
        onPressed: isLoading ? null : onTap,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadius.r),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 339.w,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                      CustomTextStyles.s24w700,
                      fontFamily: FontTypes.Philosopher,
                      color: onTap != null || !isActive
                          ? (textColor)
                          : inactiveTextColor,
                    ).copyWith(fontSize: textSize),
                  ),
                ),
        ),
      ),
    );
  }
}
