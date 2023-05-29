import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class FloatinContainerWidget extends StatelessWidget {
  final String text;
  final String url;
  const FloatinContainerWidget({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGreen, borderRadius: BorderRadius.circular(6)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Text(
            text,
            style: getTextStyle(CustomTextStyles.s16w600),
          ),
          SizedBox(
            width: 50.w,
          ),
          SvgPicture.asset(url)
        ],
      ),
    );
  }
}
