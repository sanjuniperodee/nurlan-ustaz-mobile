// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AyatDTO _$$_AyatDTOFromJson(Map<String, dynamic> json) => _$_AyatDTO(
      id: json['id'] as int,
      ayatNumber: json['ayat_number'] as int?,
      name: json['name'] as String?,
      arabic: json['arabic'] as String?,
      transcription: json['transcription'] as String?,
      translation: json['translation'] as String?,
    );

Map<String, dynamic> _$$_AyatDTOToJson(_$_AyatDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ayat_number': instance.ayatNumber,
      'name': instance.name,
      'arabic': instance.arabic,
      'transcription': instance.transcription,
      'translation': instance.translation,
    };
