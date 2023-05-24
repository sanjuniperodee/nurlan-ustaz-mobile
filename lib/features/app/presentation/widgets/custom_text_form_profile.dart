import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class CustomTextFormProfile extends StatelessWidget {
  final String hintText;
  final String labelText;
  const CustomTextFormProfile({Key? key, required this.hintText, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(labelText,style: getTextStyle(CustomTextStyles.s12w400)
            .copyWith(fontFamily: FontTypes.SF_Pro.name),),
        labelStyle: getTextStyle(CustomTextStyles.s12w400)
            .copyWith(fontFamily: FontTypes.SF_Pro.name),
        floatingLabelStyle: getTextStyle(CustomTextStyles.s12w400)
            .copyWith(fontFamily: FontTypes.SF_Pro.name),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: hintText,
        hintStyle: getTextStyle(CustomTextStyles.s12w400)
            .copyWith(fontFamily: FontTypes.SF_Pro.name,color: AppColors.grey1),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.grey1),        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.red),        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColors.red),        ),


      ),
    );
  }
}
