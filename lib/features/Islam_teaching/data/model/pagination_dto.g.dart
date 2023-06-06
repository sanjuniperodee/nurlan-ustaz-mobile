// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationDTO _$$_PaginationDTOFromJson(Map<String, dynamic> json) =>
    _$_PaginationDTO(
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaDTO.fromJson(json['meta'] as Map<String, dynamic>),
      links: LinksDTO.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaginationDTOToJson(_$_PaginationDTO instance) =>
    <String, dynamic>{
      'results': instance.results,
      'meta': instance.meta,
      'links': instance.links,
    };

_$_MetaDTO _$$_MetaDTOFromJson(Map<String, dynamic> json) => _$_MetaDTO(
      pagination:
          PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MetaDTOToJson(_$_MetaDTO instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

_$_LinksDTO _$$_LinksDTOFromJson(Map<String, dynamic> json) => _$_LinksDTO(
      first: json['first'] as String,
      last: json['last'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$$_LinksDTOToJson(_$_LinksDTO instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'next': instance.next,
      'prev': instance.prev,
    };

_$_PaginationMeta _$$_PaginationMetaFromJson(Map<String, dynamic> json) =>
    _$_PaginationMeta(
      page: json['page'] as int,
      pages: json['pages'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_PaginationMetaToJson(_$_PaginationMeta instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'count': instance.count,
    };
