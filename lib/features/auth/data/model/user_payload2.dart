// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payload2.freezed.dart';
part 'user_payload2.g.dart';

@freezed
class UserPayload2 with _$UserPayload2 {
  const factory UserPayload2({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    String? avatar,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "gender") String? gender,
    @JsonKey(name: "birthday") String? birthday,
    @JsonKey(name: "re_password") String? rePassword,
  }) = _UserPayload2;

  factory UserPayload2.fromJson(Map<String, dynamic> json) =>
      _$UserPayload2FromJson(json);
}
