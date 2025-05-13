import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/widgets/pdf_screen.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class PrivatePolicyText extends StatelessWidget {
  const PrivatePolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  MyPdfViewer(assetPdf: 'PDF.pdf', title: 'agree3'.tr(),),
          ),
        );
      },
      child: SizedBox(
        width: 275.w,
        child: RichText(
            // textDirection: TextDirection.RTL,
            text: TextSpan(
          style: getTextStyle(CustomTextStyles.s14w400)
              .copyWith(fontFamily: FontTypes.SF_Pro.name),
          children: [
            TextSpan(
                text: 'agree1'.tr(),
                style: getTextStyle(CustomTextStyles.s14w400).copyWith(
                    fontFamily: FontTypes.SF_Pro.name, color: AppColors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  MyPdfViewer(assetPdf: 'PDF.pdf', title: 'agree3'.tr(),),
                      ),
                    );
                  }),
            TextSpan(
                text: "agree2".tr(),
                style: getTextStyle(CustomTextStyles.s14w400)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name)),
            TextSpan(
                text: 'agree3'.tr(),
                style: getTextStyle(CustomTextStyles.s14w400).copyWith(
                    fontFamily: FontTypes.SF_Pro.name, color: AppColors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  MyPdfViewer(assetPdf: 'PDF.pdf', title: 'agree3'.tr(),),
                      ),
                    );
                  })
          ],
        )),
      ),
    );
  }
}
