// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_comment_dto.freezed.dart';
part 'user_comment_dto.g.dart';

@freezed
class UserCommentDTO with _$UserCommentDTO {
  const factory UserCommentDTO({
    required int id,
    @JsonKey(name: "full_name") String? fullName,
    String? email,
    String? avatar,
  }) = _UserCommentDTO;

  factory UserCommentDTO.fromJson(Map<String, dynamic> json) =>
      _$UserCommentDTOFromJson(json);
}
