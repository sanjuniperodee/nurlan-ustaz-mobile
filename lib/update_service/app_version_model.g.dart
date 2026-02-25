// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppVersionsModel _$AppVersionsModelFromJson(Map<String, dynamic> json) =>
    _AppVersionsModel(
      deviceType: json['device_type'] as String?,
      version: json['version'] as String?,
    );

Map<String, dynamic> _$AppVersionsModelToJson(_AppVersionsModel instance) =>
    <String, dynamic>{
      'device_type': instance.deviceType,
      'version': instance.version,
    };
