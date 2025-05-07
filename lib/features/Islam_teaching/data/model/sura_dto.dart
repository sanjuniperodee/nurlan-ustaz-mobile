// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';

part 'sura_dto.freezed.dart';
part 'sura_dto.g.dart';

@freezed
abstract class SuraDTO with _$SuraDTO {
  const factory SuraDTO({
    int? count,
    String? next,
    String? previous,
    List<ResultTeachingDTO>? results,
  }) = _SuraDTO;

  factory SuraDTO.fromJson(Map<String, dynamic> json) =>
      _$SuraDTOFromJson(json);
}
