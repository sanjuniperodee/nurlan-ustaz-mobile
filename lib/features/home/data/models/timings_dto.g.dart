// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimingsDTO _$TimingsDTOFromJson(Map<String, dynamic> json) => _TimingsDTO(
      fajr: json['Fajr'] as String?,
      sunrise: json['Sunrise'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
    );

Map<String, dynamic> _$TimingsDTOToJson(_TimingsDTO instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
    };
