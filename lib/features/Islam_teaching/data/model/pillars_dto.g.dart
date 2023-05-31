// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pillars_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PillarsDTO _$$_PillarsDTOFromJson(Map<String, dynamic> json) =>
    _$_PillarsDTO(
      id: json['id'] as int,
      type: json['type'] as int?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_PillarsDTOToJson(_$_PillarsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'text': instance.text,
      'url': instance.url,
    };
