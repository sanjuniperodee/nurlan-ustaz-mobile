// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaDTOImpl _$$MediaDTOImplFromJson(Map<String, dynamic> json) =>
    _$MediaDTOImpl(
      id: json['id'] as int,
      file: json['file'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      body: json['body'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$MediaDTOImplToJson(_$MediaDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'title': instance.title,
      'type': instance.type,
      'body': instance.body,
      'icon': instance.icon,
    };
