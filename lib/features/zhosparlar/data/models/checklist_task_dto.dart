// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';


part 'checklist_task_dto.freezed.dart';
part 'checklist_task_dto.g.dart';

@freezed
class CheckListTaskDto with _$CheckListTaskDto {
  const factory CheckListTaskDto({
    required final int id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "is_completed") bool? isCompleted,

  }) = _CheckListTaskDto;

  factory CheckListTaskDto.fromJson(Map<String, dynamic> json) =>
      _$CheckListTaskDtoFromJson(json);
}
