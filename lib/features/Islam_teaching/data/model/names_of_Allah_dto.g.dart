// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'names_of_Allah_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NamesOfAllahDTO _$$_NamesOfAllahDTOFromJson(Map<String, dynamic> json) =>
    _$_NamesOfAllahDTO(
      id: json['id'] as int,
      isSaved: json['is_saved'] as bool?,
      name: json['name'] as String?,
      arabic: json['arabic'] as String?,
      translation: json['translation'] as String?,
      audio: json['audio'] as String?,
      description: json['description'] as String?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$$_NamesOfAllahDTOToJson(_$_NamesOfAllahDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_saved': instance.isSaved,
      'name': instance.name,
      'arabic': instance.arabic,
      'translation': instance.translation,
      'audio': instance.audio,
      'description': instance.description,
      'number': instance.number,
    };
