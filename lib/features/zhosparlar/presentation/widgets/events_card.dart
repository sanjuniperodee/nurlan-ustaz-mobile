import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/events_type_enum.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/cards/seminar_card.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/cards/service_card.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class EventContainer extends StatelessWidget {
  const EventContainer(this.event, {super.key, required this.nextPage, required this.previousPage, required this.maincontext});

  final EventDto event;
  final Function nextPage;
  final Function previousPage;
  final BuildContext maincontext;

  @override
  Widget build(BuildContext context) {
    switch (event.type!) {
      case (EventsType.groupService):
        return  ServiceCard(event: event, nextPage: nextPage, previousPage: previousPage, isDialog: false,);
      case (EventsType.seminar):
        return SeminarCard(event: event, nextPage: nextPage, previousPage:
          previousPage, isDialog: false, mainContext: maincontext,);
      case (EventsType.live):
        return SeminarCard(event: event, nextPage: nextPage, previousPage:
        previousPage, isDialog: false, mainContext: maincontext,);
      case (EventsType.holiday):
        return Container(
          color: Colors.purple,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r),
                  ),
                  // gradient:
                  // gradients.toList()[0],
                  image: const DecorationImage(
                    opacity: 0.3,
                    image: AssetImage("assets/images/ooo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar_outline.svg',
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '23.03.2023ж Рамазан айы',
                    style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                        fontFamily: FontTypes.SF_Pro.name,
                        color: AppColors.black),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
