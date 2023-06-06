// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResultHomeDTO _$$_ResultHomeDTOFromJson(Map<String, dynamic> json) =>
    _$_ResultHomeDTO(
      isLiked: json['is_liked'] as bool? ?? false,
      isSaved: json['is_saved'] as bool? ?? false,
      likesCount: json['likes_count'] as int?,
      comentCount: json['comments_count'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      cover: json['cover'] as String?,
      isActive: json['is_active'] as bool?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResultHomeDTOToJson(_$_ResultHomeDTO instance) =>
    <String, dynamic>{
      'is_liked': instance.isLiked,
      'is_saved': instance.isSaved,
      'likes_count': instance.likesCount,
      'comments_count': instance.comentCount,
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'cover': instance.cover,
      'is_active': instance.isActive,
      'media': instance.media,
    };
