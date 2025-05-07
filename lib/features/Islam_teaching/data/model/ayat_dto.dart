// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ayat_dto.freezed.dart';
part 'ayat_dto.g.dart';

@freezed
abstract class AyatDTO with _$AyatDTO {
  const factory AyatDTO({
    int? id,
    @JsonKey(name: "ayat_number") int? ayatNumber,
    String? name,
    String? arabic,
    String? transcription,
    String? translation,
  }) = _AyatDTO;

  factory AyatDTO.fromJson(Map<String, dynamic> json) =>
      _$AyatDTOFromJson(json);
}
