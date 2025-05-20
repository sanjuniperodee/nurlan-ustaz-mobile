import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/app_styles.dart';

class CalendarDescription extends StatefulWidget {
  const CalendarDescription({super.key});

  @override
  State<CalendarDescription> createState() => _CalendarDescriptionState();
}

class _CalendarDescriptionState extends State<CalendarDescription> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
                        colors: [Color(0xFFDD5000), Color(0xFFFEC552)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                context.tr('live'),
                style: getTextStyle(CustomTextStyles.s12w500)
                    .copyWith(fontFamily: FontTypes.SFPro.name),
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
                        colors: [Color(0xFF1151C2), Color(0xFF8F8CF7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                context.tr('Services'),
                style: getTextStyle(CustomTextStyles.s12w500)
                    .copyWith(fontFamily: FontTypes.SFPro.name),
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
                        colors: [Color(0xFF1E8428), Color(0xFF61F8EF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                context.tr('Seminar'),
                style: getTextStyle(CustomTextStyles.s12w500)
                    .copyWith(fontFamily: FontTypes.SFPro.name),
              )
            ],
          ),
        ),
      ],
    );
  }
}
