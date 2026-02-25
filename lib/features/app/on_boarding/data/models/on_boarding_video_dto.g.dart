// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_boarding_video_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnBoardingVideoDTO _$OnBoardingVideoDTOFromJson(Map<String, dynamic> json) =>
    _OnBoardingVideoDTO(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      isActive: json['is_active'] as bool?,
      file: json['file'] as String,
    );

Map<String, dynamic> _$OnBoardingVideoDTOToJson(_OnBoardingVideoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'is_active': instance.isActive,
      'file': instance.file,
    };
