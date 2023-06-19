// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCommentDTO _$$_UserCommentDTOFromJson(Map<String, dynamic> json) =>
    _$_UserCommentDTO(
      id: json['id'] as int,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_UserCommentDTOToJson(_$_UserCommentDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatar,
    };
