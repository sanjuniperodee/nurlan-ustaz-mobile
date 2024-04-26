// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sura_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuraDTOImpl _$$SuraDTOImplFromJson(Map<String, dynamic> json) =>
    _$SuraDTOImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultTeachingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SuraDTOImplToJson(_$SuraDTOImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
