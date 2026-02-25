// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pillars_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PillarsDTO _$PillarsDTOFromJson(Map<String, dynamic> json) => _PillarsDTO(
      id: (json['id'] as num).toInt(),
      type: (json['type'] as num?)?.toInt(),
      title: json['title'] as String?,
      gender: json['gender'] as String?,
      text: json['text'] as String?,
      url: json['url'] as String?,
      time: (json['time'] as num?)?.toInt(),
      rakats: json['rakats'] as String?,
      cover: json['cover'] as String?,
    );

Map<String, dynamic> _$PillarsDTOToJson(_PillarsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'gender': instance.gender,
      'text': instance.text,
      'url': instance.url,
      'time': instance.time,
      'rakats': instance.rakats,
      'cover': instance.cover,
    };
