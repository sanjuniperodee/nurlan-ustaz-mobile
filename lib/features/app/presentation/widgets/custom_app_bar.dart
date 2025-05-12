import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/assets.dart';
import '../../../../core/common/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? hideIcon;
  final Function()? onTap;
  final Color? color;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onTap,
    this.hideIcon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 200.w, // Adjust as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: getTextStyle(CustomTextStyles.s20w700)
                        .apply(color: color ?? AppColors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!(hideIcon != null && hideIcon == false))
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: onTap != null
                  ? () {
                onTap!();
              }
                  : () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                Assets.backButtonSvg,
                color: color ?? AppColors.white,
              ),
            ),
          ),
      ],
    );
  }
}


