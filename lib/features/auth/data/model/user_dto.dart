// ignore_for_file: invalid_annotation_target

import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey() String? email,
    @JsonKey() String? password,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey() Gender? gender,
    @FormatDateTimeConverter() DateTime? birthday,
    @JsonKey(name: "re_password") String? rePassword,
    @JsonKey(name: "is_staff") bool? isStaff,
    @JsonKey() String? avatar,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

class FormatDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const FormatDateTimeConverter();
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  DateTime? fromJson(String? json) =>
      json == null ? null : _dateFormat.parse(json);

  @override
  String? toJson(DateTime? object) =>
      object == null ? null : _dateFormat.format(object);
}
