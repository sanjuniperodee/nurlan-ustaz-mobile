// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckListDayDto _$CheckListDayDtoFromJson(Map<String, dynamic> json) =>
    _CheckListDayDto(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      totalTasks: (json['total_tasks'] as num?)?.toInt(),
      completedTasks: (json['completed_tasks'] as num?)?.toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => CheckListTaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckListDayDtoToJson(_CheckListDayDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'total_tasks': instance.totalTasks,
      'completed_tasks': instance.completedTasks,
      'percentage': instance.percentage,
      'tasks': instance.tasks,
    };
