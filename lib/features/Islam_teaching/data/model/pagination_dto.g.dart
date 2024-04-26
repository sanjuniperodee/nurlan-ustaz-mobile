// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationDTOImpl _$$PaginationDTOImplFromJson(Map<String, dynamic> json) =>
    _$PaginationDTOImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaDTO.fromJson(json['meta'] as Map<String, dynamic>),
      links: LinksDTO.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginationDTOImplToJson(_$PaginationDTOImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'meta': instance.meta,
      'links': instance.links,
    };

_$MetaDTOImpl _$$MetaDTOImplFromJson(Map<String, dynamic> json) =>
    _$MetaDTOImpl(
      pagination:
          PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetaDTOImplToJson(_$MetaDTOImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };

_$LinksDTOImpl _$$LinksDTOImplFromJson(Map<String, dynamic> json) =>
    _$LinksDTOImpl(
      first: json['first'] as String,
      last: json['last'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$$LinksDTOImplToJson(_$LinksDTOImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'next': instance.next,
      'prev': instance.prev,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      page: json['page'] as int,
      pages: json['pages'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pages': instance.pages,
      'count': instance.count,
    };
