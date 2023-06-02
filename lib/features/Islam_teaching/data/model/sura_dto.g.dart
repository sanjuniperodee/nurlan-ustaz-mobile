// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sura_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SuraDTO _$$_SuraDTOFromJson(Map<String, dynamic> json) => _$_SuraDTO(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SuraDTOToJson(_$_SuraDTO instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
