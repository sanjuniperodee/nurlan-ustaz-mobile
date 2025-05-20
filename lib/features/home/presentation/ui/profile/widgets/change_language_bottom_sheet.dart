import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

@RoutePage(name: 'ChangeLanguageBottomSheetRoute')
class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 40.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)).r,
      ),
      height: 273.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              context.tr('change_language'),
              style: getTextStyle(CustomTextStyles.s20w700)
                  .copyWith(fontFamily: FontTypes.SFPro.name),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          for (final locale in context.supportedLocales)
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  context.setLocale(locale);
                  context.router.pop<Locale>(locale);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    children: [
                      locale == context.locale
                          ? SvgPicture.asset(Assets.radioOnSvg)
                          : SvgPicture.asset(Assets.radioCircleSvg),
                      SizedBox(width: 10.w),
                      Text(
                        context.tr('${locale.languageCode}_locale_name'),
                        style: getTextStyle(CustomTextStyles.s16w400)
                            .copyWith(fontFamily: FontTypes.SFPro.name),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
