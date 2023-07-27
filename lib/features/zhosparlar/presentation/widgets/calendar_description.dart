import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/app_styles.dart';

class CalendarDescription extends StatelessWidget {
  const CalendarDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 24,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFFDD5000),
                          Color(0xFFFEC552)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'live'.tr(),
                style:
                getTextStyle(CustomTextStyles.s12w500)
                    .copyWith(
                    fontFamily:
                    FontTypes.SF_Pro.name),
              )
            ],
          ),
        ),
        Container(
          height: 24,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF1151C2),
                          Color(0xFF8F8CF7)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Services'.tr(),
                style:
                getTextStyle(CustomTextStyles.s12w500)
                    .copyWith(
                    fontFamily:
                    FontTypes.SF_Pro.name),
              )
            ],
          ),
        ),
        SizedBox(
          height: 24,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF1E8428),
                          Color(0xFF61F8EF)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Seminar'.tr(),
                style:
                getTextStyle(CustomTextStyles.s12w500)
                    .copyWith(
                    fontFamily:
                    FontTypes.SF_Pro.name),
              )
            ],
          ),
        ),
      ],
    );
  }
}
