import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button_no_border.dart';

class AlertUtils {
  static void showSnackBar({
    required BuildContext context,
    required String messageKey,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: duration ?? const Duration(milliseconds: 1000),
        backgroundColor: AppColors.background1,
        content: Text(messageKey,
            style: getTextStyle(CustomTextStyles.s36w500)
                .apply(color: AppColors.black))));
  }

  static Future<bool> showTwoOptionDialog({
    required BuildContext context,
    required String messageKey,
    required String title,
    required String button1Text,
    required String button2Text,
    Duration? duration,
  }) async {
    return await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => AlertDialog(
          alignment: Alignment.center,
          title: Text(
            title,
            style: getTextStyle(CustomTextStyles.s16w200),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.white,
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    messageKey,
                    style: getTextStyle(CustomTextStyles.s14w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AppButtonNoBorder(
                          onTap: () {
                            Navigator.pop(context, false);
                          },
                          text: button1Text,
                          textColor: AppColors.grey1,
                        ),
                      ),
                      Flexible(
                        child: AppButtonNoBorder(
                          onTap: () {
                            Navigator.pop(context, true);
                          },
                          text: button2Text,
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  // static Future<void> showGeneralDialog(
  //   BuildContext context, {
  //   VoidCallback? onTap,
  //   VoidCallback? secondButtonTap,
  //   String? buttonText,
  //   String? secondButtonText,
  //   bool isError = false,
  //   required String message,
  // }) =>
  //     showDialog(
  //       context: context,
  //       useRootNavigator: true,
  //       builder: (_) => AlertDialog(
  //         alignment: Alignment.center,
  //         title:
  //             isError ? SvgPicture.asset('assets/icons/error_icon.svg') : null,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         backgroundColor: AppColors.primaryBackGr,
  //         content: PopUpDialog(
  //           message: message,
  //           onSecondButtonTap: secondButtonTap,
  //           onButtonTap: onTap,
  //           buttonText: buttonText,
  //           secondButtonText: secondButtonText,
  //           hasSecondButton: secondButtonText != null,
  //         ),
  //       ),
  //     );

  // static Future<void> showSuccessDialog(
  //   BuildContext context, {
  //   String? title,
  // }) =>
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       useRootNavigator: false,
  //       builder: (_) => AlertDialog(
  //           title: Text(
  //             title ?? 'успешно',
  //             textAlign: TextAlign.center,
  //           ),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           backgroundColor: AppColors.background,
  //           content: const SuccessDialog()),
  //     );
}

class Alert {
  static Future<void> dialogBuilder({
    required BuildContext context,
    required String message,
    required List<Color> gradientColors,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          content: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.alert,
                  height: 138.h,
                  width: 102.w,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(message,
                      style: getTextStyle(CustomTextStyles.s16w700)
                          .apply(color: AppColors.red)),
                ),
              ],
            ),
          ),
          icon: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    Assets.cancelSvg,
                    color: AppColors.black,
                  ))),
        );
      },
    );
  }
}
