import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/common/app_styles.dart';
import '../../../core/common/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? obscureIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onFieldSubmitted;


  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.textInputAction = TextInputAction.done,
    this.autoFocus = false,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
    this.enabled = true,
    this.obscureText = false,
    this.obscureIcon, this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      onSaved: widget.onSaved,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.blue,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        hintText: widget.hintText.toString(),
        hintStyle: getTextStyle(
          CustomTextStyles.s14w400,
          color: AppColors.black,
        ),
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: obscureText
                ? [widget.suffixIcon!]
                : widget.obscureIcon == null
                ? [widget.suffixIcon!]
                : [widget.obscureIcon!],
          ),
        ),
        filled: true,
        fillColor: AppColors.primaryColor,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.pink),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.danger),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
      ),
    );
  }
}
