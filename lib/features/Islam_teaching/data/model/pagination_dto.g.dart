// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationDTO _$PaginationDTOFromJson(Map<String, dynamic> json) =>
    _PaginationDTO(
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaDTO.fromJson(json['meta'] as Map<String, dynamic>),
      links: LinksDTO.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationDTOToJson(_PaginationDTO instance) =>
    <String, dynamic>{
      'results': instance.results,
      'meta': instance.meta,
      'links': instance.links,
    };

_MetaDTO _$MetaDTOFromJson(Map<String, dynamic> json) => _MetaDTO(
      pagination:
          PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaDTOToJson(_MetaDTO instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };

_LinksDTO _$LinksDTOFromJson(Map<String, dynamic> json) => _LinksDTO(
      first: json['first'] as String,
      last: json['last'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$LinksDTOToJson(_LinksDTO instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'next': instance.next,
      'prev': instance.prev,
    };

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'count': instance.count,
    };
