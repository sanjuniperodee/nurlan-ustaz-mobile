// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geonames_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeonamesDTO _$GeonamesDTOFromJson(Map<String, dynamic> json) => _GeonamesDTO(
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      countryName: json['countryName'] as String?,
      name: json['name'] as String?,
      adminName1: json['adminName1'] as String?,
    );

Map<String, dynamic> _$GeonamesDTOToJson(_GeonamesDTO instance) =>
    <String, dynamic>{
      'lng': instance.lng,
      'lat': instance.lat,
      'countryName': instance.countryName,
      'name': instance.name,
      'adminName1': instance.adminName1,
    };
