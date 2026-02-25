// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatisticsDTO _$StatisticsDTOFromJson(Map<String, dynamic> json) =>
    _StatisticsDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$StatisticsDTOToJson(_StatisticsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
    };
