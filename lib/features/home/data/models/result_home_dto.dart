// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';

part 'result_home_dto.freezed.dart';
part 'result_home_dto.g.dart';

@freezed
class ResultHomeDTO with _$ResultHomeDTO {
  const factory ResultHomeDTO({
    @JsonKey(name: "is_liked") @Default(false) bool? isLiked,
    @JsonKey(name: "is_saved") @Default(false) bool? isSaved,
    @JsonKey(name: "likes_count") int? likesCount,
    @JsonKey(name: "comments_count") int? comentCount,
    int? id,
    String? title,
    String? text,
    String? cover,
    @JsonKey(name: "is_active") bool? isActive,
    List<MediaDTO>? media,
  }) = _ResultHomeDTO;

  factory ResultHomeDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultHomeDTOFromJson(json);
}
