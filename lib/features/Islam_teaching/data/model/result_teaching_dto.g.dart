// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_teaching_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResultTeachingDTO _$$_ResultTeachingDTOFromJson(Map<String, dynamic> json) =>
    _$_ResultTeachingDTO(
      isSaved: json['is_saved'] as bool? ?? false,
      id: json['id'] as int?,
      name: json['name'] as String?,
      arabic: json['arabic'] as String?,
      transcription: json['transcription'] as String?,
      translation: json['translation'] as String?,
      audio: json['audio'] as String?,
      number: json['number'] as int?,
      description: json['description'] as String?,
      gender: json['gender'] as String?,
      ayats: (json['ayats'] as List<dynamic>?)
          ?.map((e) => AyatDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResultTeachingDTOToJson(
        _$_ResultTeachingDTO instance) =>
    <String, dynamic>{
      'is_saved': instance.isSaved,
      'id': instance.id,
      'name': instance.name,
      'arabic': instance.arabic,
      'transcription': instance.transcription,
      'translation': instance.translation,
      'audio': instance.audio,
      'number': instance.number,
      'description': instance.description,
      'gender': instance.gender,
      'ayats': instance.ayats,
    };
