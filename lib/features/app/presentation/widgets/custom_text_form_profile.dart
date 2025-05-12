import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class CustomTextFormProfile extends StatelessWidget {
  final String hintText;
  final String labelText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String? errorText;
  final String? helperText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? obscure;
  final TextInputAction? inputAction;
  final Color? helperColor;

  const CustomTextFormProfile(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.onChanged,
      this.controller,
      this.initialValue,
      this.readOnly,
      this.onTap,
      this.inputFormatters,
      this.validator,
      this.errorText,
      this.helperText,
      this.keyboardType,
      this.obscureText,
      this.obscure, this.inputAction,  this.helperColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: inputAction,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly ?? false,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: obscureText != null
            ? IconButton(
                onPressed: () {
                  obscure!();
                },
                icon: obscureText! ? SvgPicture.asset('assets/icons/obscure-off.svg') :SvgPicture.asset('assets/icons/obscure.svg') )
            : null,

        helperText: helperText,
        helperStyle: getTextStyle(CustomTextStyles.s12w400).copyWith(fontFamily: FontTypes.SF_Pro.name,color: helperColor),
        errorText: errorText,
        label: Text(
          labelText,
          style: getTextStyle(CustomTextStyles.s16w400)
              .copyWith(fontFamily: FontTypes.SF_Pro.name),
        ),
        labelStyle: getTextStyle(CustomTextStyles.s12w400)
            .copyWith(fontFamily: FontTypes.SF_Pro.name),
        floatingLabelStyle: getTextStyle(CustomTextStyles.s12w400)
            .copyWith(fontFamily: FontTypes.SF_Pro.name),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: hintText,
        hintStyle: getTextStyle(CustomTextStyles.s12w400).copyWith(
            fontFamily: FontTypes.SF_Pro.name, color: AppColors.grey1),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.grey1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
