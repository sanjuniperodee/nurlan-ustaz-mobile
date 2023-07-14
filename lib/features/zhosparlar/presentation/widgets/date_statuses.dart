import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/events_type_enum.dart';

import '../../../../core/common/colors.dart';

class DateStatusesWidget extends StatelessWidget {
  DateStatusesWidget({Key? key, required this.events}) : super(key: key);
  final List<EventsType?> events;

  EdgeInsets getEdgeInsets(
      int length, List<EventsType?> events, EventsType event) {
    switch (length) {
      case (1):
        return const EdgeInsets.only(left: 2, right: 2.0, top: 1.0, bottom: 1);
      case (2):
        return EdgeInsets.only(
            left: events.toList().indexOf(event) == 0 ? 2 : 8,
            right: 2.0,
            top: 1.0,
            bottom: 1);
      case (3):
        return EdgeInsets.only(
            left: events.toList().indexOf(event) == 0
                ? 2
                : events.toList().indexOf(event) == 1
                    ? 8
                    : 14,
            right: 2.0,
            top: 1.0,
            bottom: 1);
      default:
        return EdgeInsets.only();
    }
  }

  LinearGradient getGradientFromEventType(EventsType eventType) {
    switch (eventType) {
      case (EventsType.seminar):
        return const LinearGradient(
            colors: [Color(0xFF1E8428), Color(0xFF61F8EF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight);
      case (EventsType.groupService):
        return const LinearGradient(
            colors: [Color(0xFF1151C2), Color(0xFF8F8CF7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight);
      case (EventsType.live):
        return const LinearGradient(
            colors: [Color(0xFFDD5000), Color(0xFFFEC552)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight);

      default:
        return LinearGradient(
          colors: [Colors.white, Colors.white],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
            children: events == null
                ? []
                : events
                    .map(
                      (event) => Container(
                        margin: getEdgeInsets(events.length, events, event!),
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.white, width: 0.7),
                            color: AppColors.black,
                            shape: BoxShape.circle,
                            gradient: getGradientFromEventType(event)),
                      ),
                    )
                    .toList()
            // events!.map((event) {
            //         eventCount++;
            //         // Show a maximum of 3 dots.
            //         if (eventCount > 3 ||
            //             event.type == EventsType.holiday)
            //           return Container();
            //         return Container(
            //           margin: EdgeInsets.only(
            //               left: 2.0, right: 2.0, top: 1.0),
            //           width: 5.0,
            //           height: 5.0,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               gradient: (() ())),
            //         );
            //       }).toList()
            ),
      ],
    );
  }
}
