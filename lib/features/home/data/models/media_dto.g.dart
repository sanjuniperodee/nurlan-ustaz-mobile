// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaDTO _$MediaDTOFromJson(Map<String, dynamic> json) => _MediaDTO(
      id: (json['id'] as num).toInt(),
      file: json['file'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      body: json['body'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$MediaDTOToJson(_MediaDTO instance) => <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'title': instance.title,
      'type': instance.type,
      'body': instance.body,
      'icon': instance.icon,
    };
