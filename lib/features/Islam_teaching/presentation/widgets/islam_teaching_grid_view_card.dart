import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class IslamTeachingGridViewCard extends StatelessWidget {
  const IslamTeachingGridViewCard({
    super.key,
    required this.onTap,
    required this.svgPicturePath,
    required this.title,
    this.backgroundColor,
    this.withShadow = false,
  });

  @protected
  final VoidCallback onTap;

  @protected
  final String svgPicturePath;

  @protected
  final String title;

  @protected
  final Color? backgroundColor;

  @protected
  final bool withShadow;

  @protected
  static const kBorderRadius = BorderRadius.all(Radius.circular(30));

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius.r,
        color: backgroundColor,
        boxShadow: !withShadow
            ? null
            : [
                BoxShadow(
                  blurRadius: 2,
                  color: const Color(0x1231440E),
                ),
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 16,
                  color: const Color(0x1231440E),
                ),
              ],
        gradient: backgroundColor != null
            ? null
            : LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xFF1151C2).withOpacity(0.18),
                  const Color(0xFF8F8CF7).withOpacity(0.18),
                ],
              ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: kBorderRadius.r,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ).w,
                  child: SizedBox.square(
                    dimension: 41.w,
                    child: SvgPicture.asset(svgPicturePath),
                  ),
                ),
                // SizedBox(height: 12.h),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: getTextStyle(
                            CustomTextStyles.s16w500,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
