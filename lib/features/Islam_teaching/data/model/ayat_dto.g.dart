// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AyatDTO _$AyatDTOFromJson(Map<String, dynamic> json) => _AyatDTO(
      id: (json['id'] as num?)?.toInt(),
      ayatNumber: (json['ayat_number'] as num?)?.toInt(),
      name: json['name'] as String?,
      arabic: json['arabic'] as String?,
      transcription: json['transcription'] as String?,
      translation: json['translation'] as String?,
    );

Map<String, dynamic> _$AyatDTOToJson(_AyatDTO instance) => <String, dynamic>{
      'id': instance.id,
      'ayat_number': instance.ayatNumber,
      'name': instance.name,
      'arabic': instance.arabic,
      'transcription': instance.transcription,
      'translation': instance.translation,
    };
