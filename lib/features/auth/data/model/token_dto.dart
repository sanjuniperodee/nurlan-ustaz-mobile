// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_dto.freezed.dart';
part 'token_dto.g.dart';

@freezed
abstract class TokenDTO with _$TokenDTO {
  const factory TokenDTO({
    @JsonKey(name: "refresh") String? refresh,
    @JsonKey(name: "access") String? access,
  }) = _TokenDTO;

  factory TokenDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDTOFromJson(json);
}

@freezed
abstract class TokenCreateDTO with _$TokenCreateDTO {
  const factory TokenCreateDTO({
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "password") String? password,
  }) = _TokenCreateDTO;

  factory TokenCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenCreateDTOFromJson(json);
}

@freezed
abstract class ActivateUserDTO with _$ActivateUserDTO {
  const factory ActivateUserDTO({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "code") String? code,
  }) = _ActivateUserDTO;

  factory ActivateUserDTO.fromJson(Map<String, dynamic> json) =>
      _$ActivateUserDTOFromJson(json);
}
