import 'package:flutter/material.dart';

const noInternetText = 'no_internet_text'; //'Нет интернета!';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class
  static const Color background1 = Color(0xFF1151C2);
  static const Color background2 = Color(0xFFE5E5E5);

  static const Color primaryColor = Color(0xFFF9A502);
  static const Color black = Color(0xFF252525);
  static Color grey1 = const Color(0xFF252525).withOpacity(0.55);
  static const Color grey2 = Color(0xFFB1AFAF);
  static const Color danger = Colors.orange;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color orange = Color(0xFFF9A502);

  static const Color blue = Color(0xFF1B51CC);

  static const Color green = Color(0xFF2C896A);
  static const Color lightGreen = Color(0xFFDEEEE9);
  static const Color lightBlue = Color(0xFFF2F8FF);

  static const Color pink = Color(0xFFFF335F);
  static const Color pinkFD = Color(0xFFFDE2E8);
  static const Color primaryButtonActiveColor1 = Color(0xFF1151C2);
  static const Color gradientButtonActiveColor2 = Color(0xFF8F8CF7);
  static const Gradient gradientPrimaryActiveButton = LinearGradient(
      colors: [Color(0xFF1151C2), Color(0xFF8F8CF7)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static Gradient gradientPrimaryDisabledButton = LinearGradient(colors: [
    const Color(0xFF1151C2).withOpacity(0.3),
    const Color(0xFF8F8CF7).withOpacity(0.3)
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static Gradient gradientSecondaryDisabledButton = LinearGradient(colors: [
    const Color(0xFF1151C2).withOpacity(0.40),
    const Color(0xFF8F8CF7).withOpacity(0.40)
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static Gradient gradientSecondaryActiveButton = LinearGradient(colors: [
    const Color(0xFF1151C2).withOpacity(0.18),
    const Color(0xFF8F8CF7).withOpacity(0.18)
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
