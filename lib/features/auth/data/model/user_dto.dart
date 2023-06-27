import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';


@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "gender") Gender? gender,
    @JsonKey(name: "birthday") String? birthday,
    @JsonKey(name: "re_password") String? rePassword,
    @JsonKey(name: "avatar") String? avatar,


  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}