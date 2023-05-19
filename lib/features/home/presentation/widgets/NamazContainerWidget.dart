import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class NamazContainerWidget extends StatelessWidget {
  const NamazContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(30).r),
      child: Stack(
        children: [
          Positioned(
            top: -30.r,
            child: SvgPicture.asset(
              Assets.oyuSvg,
              color: Colors.blue,
            ),
          ),
          Positioned.fill(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Таң намазы',
                style: getTextStyle(CustomTextStyles.s20w700)
                    .apply(color: AppColors.black),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                '05 : 11',
                style: getTextStyle(CustomTextStyles.s36w700)
                    .apply(color: AppColors.black),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                '-00: 53 : 29',
                style: getTextStyle(CustomTextStyles.s16w400)
                    .apply(color: AppColors.black),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.locationSvg),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Алматы',
                          style: getTextStyle(CustomTextStyles.s16w400)
                              .apply(color: AppColors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.compassSvg),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Құбыла',
                          style: getTextStyle(CustomTextStyles.s16w400)
                              .apply(color: AppColors.black),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
