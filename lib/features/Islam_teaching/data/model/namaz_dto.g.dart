// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'namaz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NamazDTO _$NamazDTOFromJson(Map<String, dynamic> json) => _NamazDTO(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String?,
      prayerTime: (json['prayer_time'] as num?)?.toInt(),
      queue: (json['queue'] as num?)?.toInt(),
      title: json['title'] as String?,
      gender: json['gender'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$NamazDTOToJson(_NamazDTO instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'prayer_time': instance.prayerTime,
      'queue': instance.queue,
      'title': instance.title,
      'gender': instance.gender,
      'text': instance.text,
    };
