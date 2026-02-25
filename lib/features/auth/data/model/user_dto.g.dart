// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phone_number'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      birthday:
          const FormatDateTimeConverter().fromJson(json['birthday'] as String?),
      rePassword: json['re_password'] as String?,
      isStaff: json['is_staff'] as bool?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'gender': _$GenderEnumMap[instance.gender],
      'birthday': const FormatDateTimeConverter().toJson(instance.birthday),
      're_password': instance.rePassword,
      'is_staff': instance.isStaff,
      'avatar': instance.avatar,
    };

const _$GenderEnumMap = {
  Gender.male: 'M',
  Gender.female: 'F',
};
