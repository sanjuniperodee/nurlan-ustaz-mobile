import 'package:freezed_annotation/freezed_annotation.dart';

enum EventsType {
  @JsonValue('seminar')
  seminar,
  @JsonValue('group_service')
  groupService,
  @JsonValue('holiday')
  holiday,
  @JsonValue('live')
  live,
}
