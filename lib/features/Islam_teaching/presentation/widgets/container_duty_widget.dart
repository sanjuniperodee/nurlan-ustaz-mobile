import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class ContainerDutyWidget extends StatelessWidget {
  final String title;
  final String body;
  const ContainerDutyWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 0.8.sh,w
      width: 1.sw,
      decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getTextStyle(CustomTextStyles.s20w700)
                .apply(color: AppColors.black),
          ),
          SizedBox(height: 16.h),
          Text(
            body,
            style: getTextStyle(CustomTextStyles.s16w400)
                .apply(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
