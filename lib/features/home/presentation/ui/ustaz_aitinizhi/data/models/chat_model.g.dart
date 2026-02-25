// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatDTO _$ChatDTOFromJson(Map<String, dynamic> json) => _ChatDTO(
      id: (json['id'] as num?)?.toInt(),
      date: json['date'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$ChatDTOToJson(_ChatDTO instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
