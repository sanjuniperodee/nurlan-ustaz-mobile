import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

import '../../../../core/common/assets.dart';
import '../../../../core/common/colors.dart';

class CategoryTitleCard extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const CategoryTitleCard({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 167.w,
            height: 167.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                    colors: [Color(0xFF1151C2), Color(0xFF8F8CF7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                Center(
                  child: Text(
                    title,
                    style: getTextStyle(CustomTextStyles.s20w700).copyWith(color: AppColors.white),
                  ),
                ),
                Positioned(
                    top: 80,
                    left: 100,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(24.0),
                      child: SvgPicture.asset(
                        Assets.oyuSvg,
                        color: AppColors.orange,
                      ),
                    )),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
