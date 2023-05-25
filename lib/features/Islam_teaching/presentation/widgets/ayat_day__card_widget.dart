import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class AyatDayCardWidget extends StatelessWidget {
  const AyatDayCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(30).r),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Күн аяты ',
                style: getTextStyle(CustomTextStyles.s20w700)
                    .apply(color: AppColors.black),
              ),
              Text(
                ' 7:205',
                style: getTextStyle(CustomTextStyles.s20w700)
                    .apply(color: AppColors.black),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'وَاذْكُرْ رَبَّكَ فِي نَفْسِكَ تَضَرُّعًا وَخِيفَةً وَدُونَ الْجَهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْآصَالِ وَلَا تَكُنْ مِنَ الْغَافِلِ',
            style: getTextStyle(CustomTextStyles.s14w400)
                .apply(color: AppColors.black),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Және Раббыңды жалбарына әрі қорыққан түрде ішіңнен және жария емес кейіпте таңертең және кешке (күн батардан бұрын) есіңе ал да, ғапыл қалушыларда...',
            style: getTextStyle(CustomTextStyles.s14w400)
                .apply(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
