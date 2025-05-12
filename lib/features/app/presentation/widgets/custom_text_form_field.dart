import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

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
  final int? maxLines;
  final int? minLines;



  const CustomTextFormField({
    super.key,
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
    this.obscureIcon, this.onFieldSubmitted, this.maxLines, this.minLines,
  });

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
      minLines: widget.minLines,
      maxLines: widget.maxLines,
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
      cursorColor: AppColors.black,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        hintText: widget.hintText.toString(),
        hintStyle: getTextStyle(
          CustomTextStyles.s16w400,
          color: AppColors.grey1,
        ).copyWith(fontFamily: FontTypes.SF_Pro.name),
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
        fillColor: AppColors.white,

        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.white),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.white),        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.white),        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.white),        ),
      ),
    );
  }
}
