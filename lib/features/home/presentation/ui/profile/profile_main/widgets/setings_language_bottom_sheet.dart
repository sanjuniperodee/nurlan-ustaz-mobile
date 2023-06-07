import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/common/app_styles.dart';
import '../../../../../../../core/common/assets.dart';
import '../../../../../../../core/common/colors.dart';
import '../about_app_page.dart';

class LanguageSettingsBottomSheet extends StatefulWidget {
  const LanguageSettingsBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageSettingsBottomSheet> createState() =>
      _LanguageSettingsBottomSheetState();
}

class _LanguageSettingsBottomSheetState
    extends State<LanguageSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 213.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Тілді таңдаңыз',
              style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                  fontFamily: FontTypes.SF_Pro.name,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12)
                        .r
                        .r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: selectedIndex != index
                            ? SvgPicture.asset(Assets.radioCircleSvg)
                            : SvgPicture.asset(Assets.radioOnSvg)),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Қазақша',
                      style: getTextStyle(CustomTextStyles.s16w400)
                          .apply(fontFamily: FontTypes.SF_Pro.name),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
