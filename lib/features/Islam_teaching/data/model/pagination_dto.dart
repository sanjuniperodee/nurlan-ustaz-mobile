// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';

part 'pagination_dto.freezed.dart';
part 'pagination_dto.g.dart';

@freezed
abstract class PaginationDTO with _$PaginationDTO {
  const factory PaginationDTO({
    required List<ResultTeachingDTO> results,
    required MetaDTO meta,
    required LinksDTO links,
  }) = _PaginationDTO;

  factory PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationDTOFromJson(json);
}

@freezed
abstract class MetaDTO with _$MetaDTO {
  const factory MetaDTO({
    required PaginationMeta pagination,
  }) = _MetaDTO;

  factory MetaDTO.fromJson(Map<String, dynamic> json) =>
      _$MetaDTOFromJson(json);
}

@freezed
abstract class LinksDTO with _$LinksDTO {
  const factory LinksDTO({
    required String first,
    required String last,
    final String? next,
    final String? prev,
  }) = _LinksDTO;

  factory LinksDTO.fromJson(Map<String, dynamic> json) =>
      _$LinksDTOFromJson(json);
}

@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int page,
    required int pages,
    required int count,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
