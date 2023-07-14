import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/common/app_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final bool? isExit;
  final void Function()? onTap;
  final TextStyle? titleStyle;

  const ProfileMenuItem(
      {Key? key, required this.title, required this.onTap, this.isExit, this.titleStyle,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44,
        child: isExit != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/door_arrow.svg'),
                  const SizedBox(width: 10,),
                  Text(
                    title,
                    style: titleStyle ?? getTextStyle(CustomTextStyles.s16w400).copyWith(fontFamily: FontTypes.SF_Pro.name)
                        ,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: titleStyle ?? getTextStyle(CustomTextStyles.s16w400).copyWith(fontFamily: FontTypes.SF_Pro.name),
                  ),
                  SvgPicture.asset('assets/icons/chevron_right.svg'),
                ],
              ),
      ),
    );
  }
}
