import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';




class AppButtonNoBorder extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? inactiveTextColor;
  bool isLoading;
  AppButtonNoBorder(
      {super.key,
      required this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.inactiveTextColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: isLoading
            ? Container(
                height: 15,
                width: 15,
                padding: const EdgeInsets.all(0.0),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Text(text,
                textAlign: TextAlign.center,
                style: AppStyles.sp14fw600.apply(
                  color: textColor,
                )),
      ),
    );
  }
}
