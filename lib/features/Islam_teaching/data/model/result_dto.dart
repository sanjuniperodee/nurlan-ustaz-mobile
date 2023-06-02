// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';

part 'result_dto.freezed.dart';
part 'result_dto.g.dart';

@freezed
class ResultDTO with _$ResultDTO {
  const factory ResultDTO({
    @JsonKey(name: "is_saved") @Default(false) bool? isSaved,
    int? id,
    String? name,
    String? arabic,
    String? transcription,
    String? translation,
    String? audio,
    int? number,
    String? description,
    String? gender,
    List<AyatDTO>? ayats,
  }) = _ResultDTO;

  factory ResultDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultDTOFromJson(json);
}
