import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/common/app_styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final bool isExit;
  final void Function()? onTap;
  final TextStyle? titleStyle;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isExit = false,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                if (isExit) ...[
                  SvgPicture.asset('assets/icons/door_arrow.svg'),
                  const SizedBox(width: 10),
                ],
                Text(
                  title,
                  style: titleStyle ??
                      getTextStyle(
                        CustomTextStyles.s16w400,
                        fontFamily: FontTypes.SFPro,
                      ),
                ),
                const Spacer(),
                if (!isExit) SvgPicture.asset('assets/icons/chevron_right.svg'),
                const SizedBox(width: 16),
              ],
            )),
      ),
    );
  }
}
