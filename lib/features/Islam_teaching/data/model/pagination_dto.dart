// // ignore_for_file: invalid_annotation_target
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'pagination_dto.freezed.dart';
// part 'pagination_dto.g.dart';

// @freezed
// class PaginationDTO<T> with _$PaginationDTO<T> {
//   const PaginationDTO._();

//   const factory PaginationDTO({
//     required List<T> results,
//     required MetaDTO meta,
//     required LinksDTO links,
//   }) = _PaginationDTO<T>;

//   factory PaginationDTO.fromJson(Map<String, dynamic> json) =>
//       _$PaginationDTOFromJson(json);
// }

// @freezed
// class MetaDTO with _$MetaDTO {
//   const factory MetaDTO({
//     required PaginationMeta pagination,
//   }) = _MetaDTO;

//   factory MetaDTO.fromJson(Map<String, dynamic> json) =>
//       _$MetaDTOFromJson(json);
// }

// @freezed
// class LinksDTO with _$LinksDTO {
//   const factory LinksDTO({
//     required String first,
//     required String last,
//     final String? next,
//     final String? prev,
//   }) = _LinksDTO;

//   factory LinksDTO.fromJson(Map<String, dynamic> json) =>
//       _$LinksDTOFromJson(json);
// }

// @freezed
// class PaginationMeta with _$PaginationMeta {
//   const factory PaginationMeta({
//     required int page,
//     required int pages,
//     required int count,
//   }) = _PaginationMeta;

//   factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
//       _$PaginationMetaFromJson(json);
// }
