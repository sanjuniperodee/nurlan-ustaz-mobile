// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenDTO _$TokenDTOFromJson(Map<String, dynamic> json) => _TokenDTO(
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );

Map<String, dynamic> _$TokenDTOToJson(_TokenDTO instance) => <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };

_TokenCreateDTO _$TokenCreateDTOFromJson(Map<String, dynamic> json) =>
    _TokenCreateDTO(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$TokenCreateDTOToJson(_TokenCreateDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_ActivateUserDTO _$ActivateUserDTOFromJson(Map<String, dynamic> json) =>
    _ActivateUserDTO(
      userId: (json['user_id'] as num?)?.toInt(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ActivateUserDTOToJson(_ActivateUserDTO instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'code': instance.code,
    };
