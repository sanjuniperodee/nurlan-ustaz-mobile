// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';

part 'user_payload.freezed.dart';
part 'user_payload.g.dart';

@freezed
abstract class UserPayload with _$UserPayload {
  const factory UserPayload({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
    String? avatar,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "gender") Gender? gender,
    @JsonKey(name: "birthday") String? birthday,
    @JsonKey(name: "re_password") String? rePassword,
  }) = _UserPayload;

  factory UserPayload.fromJson(Map<String, dynamic> json) =>
      _$UserPayloadFromJson(json);
}
