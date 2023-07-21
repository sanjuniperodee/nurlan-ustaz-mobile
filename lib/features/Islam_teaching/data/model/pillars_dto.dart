// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pillars_dto.freezed.dart';
part 'pillars_dto.g.dart';

@freezed
class PillarsDTO with _$PillarsDTO {
  const factory PillarsDTO({
    required int id,
    int? type,
    String? title,
    String? gender,
    String? text,
    String? url,
    int? time,
    String? rakats,
    String? cover,
  }) = _PillarsDTO;

  factory PillarsDTO.fromJson(Map<String, dynamic> json) =>
      _$PillarsDTOFromJson(json);
}
