// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckListDto _$CheckListDtoFromJson(Map<String, dynamic> json) =>
    _CheckListDto(
      id: (json['id'] as num).toInt(),
      isActive: json['is_active'] as bool?,
      title: json['title'] as String,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      defaultTasks: json['default_tasks'] as String?,
    );

Map<String, dynamic> _$CheckListDtoToJson(_CheckListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_active': instance.isActive,
      'title': instance.title,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'default_tasks': instance.defaultTasks,
    };
