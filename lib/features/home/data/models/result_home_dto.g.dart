// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResultHomeDTO _$$_ResultHomeDTOFromJson(Map<String, dynamic> json) =>
    _$_ResultHomeDTO(
      isLiked: json['is_liked'] as bool? ?? false,
      isSaved: json['is_saved'] as bool? ?? false,
      isLive: json['is_live'] as bool?,
      isPurchased: json['is_purchased'] as bool?,
      isTop: json['is_top'] as bool?,
      likesCount: json['likes_count'] as int?,
      comentCount: json['comments_count'] as int?,
      id: json['id'] as int?,
      parent: json['parent'] as int?,
      body: json['body'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      text: json['text'] as String?,
      cover: json['cover'] as String?,
      link: json['link'] as String?,
      user: json['user'] == null
          ? null
          : UserCommentDTO.fromJson(json['user'] as Map<String, dynamic>),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MediaDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      requisites: (json['requisites'] as List<dynamic>?)
          ?.map((e) => RequisitesDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => ResultHomeDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      statistics: (json['statistics'] as List<dynamic>?)
          ?.map((e) => StatisticsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$_ResultHomeDTOToJson(_$_ResultHomeDTO instance) =>
    <String, dynamic>{
      'is_liked': instance.isLiked,
      'is_saved': instance.isSaved,
      'is_live': instance.isLive,
      'is_purchased': instance.isPurchased,
      'is_top': instance.isTop,
      'likes_count': instance.likesCount,
      'comments_count': instance.comentCount,
      'id': instance.id,
      'parent': instance.parent,
      'body': instance.body,
      'name': instance.name,
      'logo': instance.logo,
      'price': instance.price,
      'title': instance.title,
      'description': instance.description,
      'text': instance.text,
      'cover': instance.cover,
      'link': instance.link,
      'user': instance.user,
      'start_time': instance.startTime?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'is_active': instance.isActive,
      'media': instance.media,
      'requisites': instance.requisites,
      'children': instance.children,
      'statistics': instance.statistics,
      'address': instance.address,
    };
