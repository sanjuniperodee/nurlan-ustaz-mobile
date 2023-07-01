// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "phone_number") String? phoneNumber,
    // @JsonKey(name: "gender") Gender? gender,
    @JsonKey(name: "birthday") DateTime? birthday,
    @JsonKey(name: "re_password") String? rePassword,
    String? avatar,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
