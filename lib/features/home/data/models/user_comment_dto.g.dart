// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCommentDTO _$UserCommentDTOFromJson(Map<String, dynamic> json) =>
    _UserCommentDTO(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserCommentDTOToJson(_UserCommentDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatar,
    };
