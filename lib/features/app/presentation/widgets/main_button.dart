import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

class MainButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MainButton({
    super.key,
    required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        padding: const EdgeInsets.only(
            // left: 16.r,
            // right: 16.r,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: getTextStyle(CustomTextStyles.s16w200)
                  .apply(fontFamily: FontTypes.Philosopher.name)
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 20.sp),
            ),

            // SizedBox(
            //   width: 150.w,
            // ),
            SvgPicture.asset(
              Assets.chevronDownSvg,
              width: 24.r,
              height: 24.r,
            )
          ],
        ),
      ),
    );
  }
}
