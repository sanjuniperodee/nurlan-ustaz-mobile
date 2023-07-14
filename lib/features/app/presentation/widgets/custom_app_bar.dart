import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool? hideIcon;
  final Function()? onTap;
  final Color? color;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onTap,
    this.hideIcon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: hideIcon != null
          ? [
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: getTextStyle(CustomTextStyles.s20w700)
                      .copyWith(color: color ?? AppColors.white, fontSize: 36),
                ),
              ),
            ]
          : [
              GestureDetector(
                  onTap: onTap != null
                      ? () {
                          onTap!();
                        }
                      : () {
                          Navigator.pop(context);
                        },
                  child: SvgPicture.asset(
                    Assets.backButtonSvg,
                    color: color ?? AppColors.white,
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: getTextStyle(CustomTextStyles.s20w700)
                        .apply(color: color ?? AppColors.white),
                  ),
                ),
              )
            ],
    );
  }
}
