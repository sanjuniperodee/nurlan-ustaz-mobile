import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:timer_button_fork/timer_button_fork.dart';

class CustomAppButtonTimer extends StatefulWidget {
  const CustomAppButtonTimer(
      {super.key,
      required this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.inactiveTextColor,
      this.isLoading = false,
      this.isActive = true});

  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? inactiveTextColor;
  final bool isLoading;
  final bool? isActive;

  @override
  State<CustomAppButtonTimer> createState() => _CustomAppButtonTimerState();
}

class _CustomAppButtonTimerState extends State<CustomAppButtonTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.color,
          gradient: widget.isActive == true
              ? widget.color != null
                  ? null
                  : AppColors.gradientPrimaryActiveButton
              : AppColors.gradientPrimaryDisabledButton,
          borderRadius: const BorderRadius.all(Radius.circular(30)).r),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 339.w,
        child: TimerButton(
          secPostFix: ' сек',
          label: widget.text,
          timeOutInSeconds: 15,
          onPressed: () {

              widget.onTap!();
          },
          buttonType: ButtonType.TextButton,
          color: AppColors.white.withOpacity(0.000009),
          disabledColor: AppColors.white.withOpacity(0.000009),
          activeTextStyle: getTextStyle(CustomTextStyles.s16w700).copyWith(
              fontFamily: FontTypes.Philosopher.name, color: AppColors.white),
          disabledTextStyle: getTextStyle(CustomTextStyles.s16w700).copyWith(
              fontFamily: FontTypes.Philosopher.name, color: AppColors.white),
        ),
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //       color: widget.color ?? null,
    //       gradient: widget.isActive == true
    //           ? widget.color != null
    //               ? null
    //               : AppColors.gradientPrimaryActiveButton
    //           : AppColors.gradientPrimaryDisabledButton,
    //       borderRadius: const BorderRadius.all(Radius.circular(30)).r),
    //   child: MaterialButton(
    //     onPressed: widget.onTap,
    //     child: Container(
    //       padding: const EdgeInsets.all(10),
    //       width: 339.w,
    //       child: widget.isLoading
    //           ? Container(
    //               height: 15.h,
    //               width: 15.w,
    //               padding: const EdgeInsets.all(0.0).r,
    //               child: const Center(child: CircularProgressIndicator()),
    //             )
    //           : SizedBox(
    //               child: Text(widget.text,
    //                   textAlign: TextAlign.center,
    //                   style: getTextStyle(CustomTextStyles.s16w200)
    //                       .apply(fontFamily: FontTypes.Philosopher.name)
    //                       .copyWith(
    //                           fontWeight: FontWeight.w700, fontSize: 24.sp)
    //                       .apply(
    //                         color: widget.onTap != null
    //                             ? widget.textColor ?? AppColors.white
    //                             : AppColors.grey1,
    //                       )),
    //             ),
    //     ),
    //   ),
    // );
  }
}
