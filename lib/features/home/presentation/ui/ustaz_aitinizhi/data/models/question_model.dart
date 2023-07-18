// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionDTO with _$QuestionDTO {
  const factory QuestionDTO({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "username") String? userName,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "body") String? body,
    @JsonKey(name: "is_allowed") bool? is_allowed,
    @JsonKey(name: "user") UserDto? user,
    @JsonKey(name: "avatar") String? avatar,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "full_name") String? fullName,




  }) = _QuestionDTO;

  factory QuestionDTO.fromJson(Map<String, dynamic> json) =>
      _$QuestionDTOFromJson(json);
}
