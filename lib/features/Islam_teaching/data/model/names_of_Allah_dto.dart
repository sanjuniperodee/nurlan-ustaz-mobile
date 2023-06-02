// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'names_of_Allah_dto.freezed.dart';
part 'names_of_Allah_dto.g.dart';

@freezed
class NamesOfAllahDTO with _$NamesOfAllahDTO {
  const factory NamesOfAllahDTO({
    required int id,
    @JsonKey(name: "is_saved") bool? isSaved,
    String? name,
    String? arabic,
    String? translation,
    String? audio,
    String? description,
    int? number,
  }) = _NamesOfAllahDTO;

  factory NamesOfAllahDTO.fromJson(Map<String, dynamic> json) =>
      _$NamesOfAllahDTOFromJson(json);
}
