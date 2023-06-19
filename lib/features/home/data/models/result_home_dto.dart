// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/requisites_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/user_comment_dto.dart';

part 'result_home_dto.freezed.dart';
part 'result_home_dto.g.dart';

@freezed
class ResultHomeDTO with _$ResultHomeDTO {
  const factory ResultHomeDTO(
      {@JsonKey(name: "is_liked") @Default(false) bool? isLiked,
      @JsonKey(name: "is_saved") @Default(false) bool? isSaved,
      @JsonKey(name: "is_live") bool? isLive,
      @JsonKey(name: "is_top") bool? isTop,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      int? id,
      int? parent,
      String? body,
      String? name,
      String? logo,
      String? title,
      String? description,
      String? text,
      String? cover,
      String? link,
      UserCommentDTO? user,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media,
      List<RequisitesDTO>? requisites,
      List<ResultHomeDTO>? children,
      String? address}) = _ResultHomeDTO;

  factory ResultHomeDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultHomeDTOFromJson(json);
}
