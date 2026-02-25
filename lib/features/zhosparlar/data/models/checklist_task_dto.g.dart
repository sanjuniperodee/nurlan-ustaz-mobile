// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckListTaskDto _$CheckListTaskDtoFromJson(Map<String, dynamic> json) =>
    _CheckListTaskDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      isCompleted: json['is_completed'] as bool?,
    );

Map<String, dynamic> _$CheckListTaskDtoToJson(_CheckListTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_completed': instance.isCompleted,
    };
