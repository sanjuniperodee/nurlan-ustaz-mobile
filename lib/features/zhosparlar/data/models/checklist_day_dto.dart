// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'checklist_task_dto.dart';

part 'checklist_day_dto.freezed.dart';
part 'checklist_day_dto.g.dart';

@freezed
abstract class CheckListDayDto with _$CheckListDayDto {
  const factory CheckListDayDto({
    required final int id,
    required final String date,
    @JsonKey(name: "total_tasks") int? totalTasks,
    @JsonKey(name: "completed_tasks") int? completedTasks,
    required final double percentage,
    required final List<CheckListTaskDto> tasks,
  }) = _CheckListDayDto;

  factory CheckListDayDto.fromJson(Map<String, dynamic> json) =>
      _$CheckListDayDtoFromJson(json);
}
