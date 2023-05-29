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
    return Container(
      decoration: BoxDecoration(
        color: color != null ? color : null,
          gradient: color !=null ? null :AppColors.gradientPrimaryActiveButton,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: MaterialButton(
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
              : Container(
                  child: Text(text,
                      textAlign: TextAlign.center,
                      style: getTextStyle(CustomTextStyles.s16w200)
                          .apply(fontFamily: FontTypes.Philosopher.name)
                          .copyWith(
                              fontWeight: FontWeight.w700, fontSize: 24.sp)
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
