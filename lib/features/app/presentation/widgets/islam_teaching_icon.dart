import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/assets.dart';
import '../../../../core/common/colors.dart';

class IslamTeachingIcon extends StatelessWidget {
  const IslamTeachingIcon(
      {Key? key, required this.isCurrent, required this.isKazakh})
      : super(key: key);
  final bool isCurrent;
  final bool isKazakh;

  @override
  Widget build(BuildContext context) {
    return isCurrent == true
        ? isKazakh == true
            ? SvgPicture.asset(Assets.bookSvg)
            : Container(
                height: 20.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 22.5.h,
                      width: 22.5.w,
                      child: SvgPicture.asset(Assets.bookSvg),
                    ),
                    Text(
                      'Islam_study'.tr(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:getTextStyle(CustomTextStyles.s14w400)
                          .apply(fontFamily: FontTypes.Philosopher.name,color: AppColors.grey1),
                    ),
                  ],
                ),
              )
        : isKazakh == true
            ? SvgPicture.asset(Assets.book_1Svg)
            : SizedBox(
                height: 25.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 22.5.h,
                      width: 22.5.w,
                      child: SvgPicture.asset(Assets.book_1Svg),
                    ),
                    Text(
                      'Islam_study'.tr(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:getTextStyle(CustomTextStyles.s14w400)
                          .copyWith(
                          fontFamily: FontTypes.Philosopher.name,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
              );
  }
}
