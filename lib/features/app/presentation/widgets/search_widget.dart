import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key, required this.onChanged,
  }) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: const Color(0xFFFFFFFF).withOpacity(0.4),
      ),
      child: TextField(
          onChanged: onChanged,
          style: getTextStyle(CustomTextStyles.s18w400)
          .apply(color: AppColors.white),
      decoration: InputDecoration(
        hintText: 'Іздеу',
        hintStyle: getTextStyle(CustomTextStyles.s18w400)
            .apply(color: AppColors.white),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.white,
        ),
        border: InputBorder.none,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0).r,
      ),
    ),);
  }
}
