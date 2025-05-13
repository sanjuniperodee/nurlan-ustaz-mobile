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
  final bool isLoading;
  final bool? isActive;
  final double? textSize;

  const AppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.inactiveTextColor,
      this.isLoading = false,
      this.isActive = true,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          gradient: isActive == true
              ? color != null
                  ? null
                  : AppColors.gradientPrimaryActiveButton
              : AppColors.gradientPrimaryDisabledButton,
          borderRadius: const BorderRadius.all(Radius.circular(30)).r),
      child: MaterialButton(
        onPressed: isLoading == true ? null : onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 339.w,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: getTextStyle(CustomTextStyles.s16w200)
                          .apply(fontFamily: FontTypes.Philosopher.name)
                          .copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: textSize ?? 24.sp)
                          .apply(
                            color: onTap != null
                                ? textColor ?? AppColors.white
                                : AppColors.grey1,
                          )),
                ),
        ),
      ),
    );
  }
}
