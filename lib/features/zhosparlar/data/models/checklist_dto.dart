// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';


part 'checklist_dto.freezed.dart';
part 'checklist_dto.g.dart';

@freezed
abstract class CheckListDto with _$CheckListDto {
  const factory CheckListDto({
    required final int id,
    @JsonKey(name: "is_active") bool? isActive,
    required final String title,
    @JsonKey(name: "start_date") String? startDate,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "default_tasks") String? defaultTasks,
  }) = _CheckListDto;

  factory CheckListDto.fromJson(Map<String, dynamic> json) =>
      _$CheckListDtoFromJson(json);
}
