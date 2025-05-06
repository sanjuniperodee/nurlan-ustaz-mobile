import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/events_type_enum.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/date_statuses.dart';

import '../../../../zhosparlar/data/models/events_type_enum.dart';
import 'custom_date_utils.dart';

/// [CalendarTile] is responsible for displaying one calendar event entry below
/// the week view or the month view. The events are displayed in a list of [CalendarTile].
///
/// Each [CalendarTile] has a set of properties:
///
/// [onDateSelected] is the callback function that gets invoked on tapping a date in the
/// calendar view. It has the type [VoidCallback]
/// [date] containes the current date to be rendered as [DateTime] type
/// [dayOfWeek] Contains the name of the weekday to be shown in the header row
/// [isDayOfWeek] is a [bool], that gets used to deiced, if the tile shoulöd display a weekday or a date
/// [isSelected] is a [bool], that contains the information, if the current tile ist the selected day
/// [inMonth] is a [bool], that contains the information, if the current day belongs to the selected month
/// [events] contains a [List<CleanCalendarEvents>] of the events to display
/// [dayOfWeekStyle] this property alloes to set a text style for the week days in the header row
/// [dateStyles] this property alloes to set a text style for the date tiles
/// [child] can contain a [Widget] that can be displayed. If tihs property is [null], the
///     method [renderDateOrDayOfWeek] gets called, so the [child] property has priority.
/// [selectedColor] is a [Color] used for displaying the selected tile
/// [todayColor] is a [Color] object used to display the tile for today
/// [eventColor] can be used to color the dots in the calendar tile representing an event. The color, that
///     is set in the properties of the [CleanCalendarEvent]  has priority over this parameter
/// [eventDoneColor] a [Color] object für displaying "done" events (events in the past)
class CalendarTile extends StatelessWidget {
  final VoidCallback? onDateSelected;
  final DateTime? date;
  final String? dayOfWeek;
  final bool isDayOfWeek;
  final bool isSelected;
  final bool inMonth;
  final List<EventDto>? events;
  final TextStyle? dayOfWeekStyle;
  final TextStyle? dateStyles;
  final Widget? child;
  final Color? selectedColor;
  final Color? todayColor;
  final Color? eventColor;
  final Color? eventDoneColor;
  final bool? isChat;
  final List<DateTime>? daysWithChat;

  CalendarTile({
    this.onDateSelected,
    this.date,
    this.child,
    this.dateStyles,
    this.dayOfWeek,
    this.dayOfWeekStyle,
    this.isDayOfWeek = false,
    this.isSelected = false,
    this.inMonth = true,
    this.events,
    this.selectedColor,
    this.todayColor,
    this.eventColor,
    this.eventDoneColor,
    this.isChat,
    this.daysWithChat = const [],
  });

  Set<EventsType?> statuses = {};

  /// This function [renderDateOrDayOfWeek] renders the week view or the month view. It is
  /// responsible for displaying a calendar tile. This can be a day (i.e. "Mon", "Tue" ...) in
  /// the header row or a date tile for each day of a week or a month. The property [isDayOfWeek]
  /// of the [CalendarTile] decides, if the rendered item should be a day or a date tile.
  Widget renderDateOrDayOfWeek(BuildContext context) {
    // We decide, if this calendar tile should display a day name in the header row. If this is the
    // case, we return a widget, that contains a text widget with style property [dayOfWeekStyle]
    if (isDayOfWeek) {
      return new InkWell(
        child: new Container(
          alignment: Alignment.center,
          child: Text(
            dayOfWeek ?? '',
            style: dayOfWeekStyle,
          ),
        ),
      );
    } else {
      statuses = events == null
          ? {}
          : events!
              .where((element) => element.type != EventsType.holiday)
              .map((e) => e.type)
              .toSet();
      // Here the date tiles get rendered. Initially eventCount is set to 0.
      // Every date tile can show up to three dots representing an event.
      return InkWell(
        onTap: onDateSelected, // react on tapping
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            // If this tile is the selected date, draw a colored circle on it. The circle is filled with
            // the color passed with the selectedColor parameter or red color.
            decoration: isChat == true
                ? isSelected && date != null
                    ? BoxDecoration(
                        color: AppColors.orange, shape: BoxShape.circle)
                    : BoxDecoration()
                : isSelected && date != null //если выбран или сегодня
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors:
                                AppColors.gradientPrimaryActiveButton.colors))
                    : BoxDecoration(), // no decoration when not selected
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Date display
                Text(
                  date != null ? DateFormat("d").format(date!) : '',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: isSelected && this.date != null
                          ? Colors.white
                          : Utils.isSameDay(this.date!, DateTime.now())
                              ? todayColor
                              : inMonth
                                  ? Colors.black
                                  : Colors
                                      .grey), // Grey color for previous or next months dates
                ),
                // Dots for the events
                events != null && events!.length > 0
                    ? DateStatusesWidget(events: statuses.toList())

                    // ? Stack(
                    //     children:
                    //     statuses == null ? [] :
                    //
                    //     statuses.toSet()
                    //         .map(
                    //           (event) => Positioned(
                    //             left: statuses.toList().indexOf(event) == 0 ? 0 : 10,
                    //             child: Container(
                    //               margin: EdgeInsets.only(
                    //                   left: 2.0, right: 2.0, top: 1.0),
                    //               width: 7.0,
                    //               height: 7.0,
                    //               decoration: BoxDecoration(
                    //                   shape: BoxShape.circle,
                    //                   gradient:
                    //                       getGradientFromEventType(event!)),
                    //             ),
                    //           ),
                    //         )
                    //         .toList()
                    //     // events!.map((event) {
                    //     //         eventCount++;
                    //     //         // Show a maximum of 3 dots.
                    //     //         if (eventCount > 3 ||
                    //     //             event.type == EventsType.holiday)
                    //     //           return Container();
                    //     //         return Container(
                    //     //           margin: EdgeInsets.only(
                    //     //               left: 2.0, right: 2.0, top: 1.0),
                    //     //           width: 5.0,
                    //     //           height: 5.0,
                    //     //           decoration: BoxDecoration(
                    //     //               shape: BoxShape.circle,
                    //     //               gradient: (() ())),
                    //     //         );
                    //     //       }).toList()
                    //     )
                    : Container(),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // If a child widget was passed as parameter, this widget gets used to
    // be rendered to display weekday or date
    if (child != null) {
      return InkWell(
        child: child,
        onTap: onDateSelected,
      );
    }
    return Container(
      child: renderDateOrDayOfWeek(context),
    );
  }
}
