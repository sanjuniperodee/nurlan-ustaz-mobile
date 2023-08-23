import 'package:flutter/material.dart';

class CustomCalendarEvent {
  String summary;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;
  Color color;
  bool isAllDay;
  bool isDone;

  CustomCalendarEvent(this.summary,
      {this.description = '',
        this.location = '',
        required this.startTime,
        required this.endTime,
        this.color = Colors.blue,
        this.isAllDay = false,
        this.isDone = false});
}
