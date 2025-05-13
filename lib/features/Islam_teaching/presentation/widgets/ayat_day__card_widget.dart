import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';

class AyatDayCardWidget extends StatelessWidget {
  final AyatDTO ayatDTO;
  const AyatDayCardWidget({
    super.key,
    required this.ayatDTO,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(30).r),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'Ayat_of_the_day'.tr()} ',
                style: getTextStyle(CustomTextStyles.s20w700)
                    .apply(color: AppColors.black),
              ),
              Text(
                ayatDTO.name ?? 'ERROR AYAT NAME',
                style: getTextStyle(CustomTextStyles.s20w700)
                    .apply(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            ayatDTO.arabic ?? 'ERROR',
            style: getTextStyle(CustomTextStyles.s14w400)
                .apply(color: AppColors.black),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            ayatDTO.translation ?? 'ERROR',
            style: getTextStyle(CustomTextStyles.s14w400)
                .apply(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
