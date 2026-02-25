// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionDTO _$QuestionDTOFromJson(Map<String, dynamic> json) => _QuestionDTO(
      id: (json['id'] as num?)?.toInt(),
      message: json['message'] as String?,
      userName: json['username'] as String?,
      createdAt: json['created_at'] as String?,
      body: json['body'] as String?,
      is_allowed: json['is_allowed'] as bool?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$QuestionDTOToJson(_QuestionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'username': instance.userName,
      'created_at': instance.createdAt,
      'body': instance.body,
      'is_allowed': instance.is_allowed,
      'user': instance.user,
      'avatar': instance.avatar,
      'email': instance.email,
      'full_name': instance.fullName,
    };
