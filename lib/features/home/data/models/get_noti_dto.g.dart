// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_noti_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaDTO _$MediaDTOFromJson(Map<String, dynamic> json) => _MediaDTO(
      news: (json['news'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      live: (json['live'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      dream: (json['dream_interpretation'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      muslimName: (json['muslim_name'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      tellMe: (json['tell_me_ustaz'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaDTOToJson(_MediaDTO instance) => <String, dynamic>{
      'news': instance.news,
      'live': instance.live,
      'dream_interpretation': instance.dream,
      'muslim_name': instance.muslimName,
      'tell_me_ustaz': instance.tellMe,
    };
