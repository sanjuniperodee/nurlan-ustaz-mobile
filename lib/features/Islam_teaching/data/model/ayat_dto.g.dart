// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AyatDTOImpl _$$AyatDTOImplFromJson(Map<String, dynamic> json) =>
    _$AyatDTOImpl(
      id: json['id'] as int?,
      ayatNumber: json['ayat_number'] as int?,
      name: json['name'] as String?,
      arabic: json['arabic'] as String?,
      transcription: json['transcription'] as String?,
      translation: json['translation'] as String?,
    );

Map<String, dynamic> _$$AyatDTOImplToJson(_$AyatDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ayat_number': instance.ayatNumber,
      'name': instance.name,
      'arabic': instance.arabic,
      'transcription': instance.transcription,
      'translation': instance.translation,
    };
