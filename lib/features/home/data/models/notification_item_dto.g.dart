// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationItemDTO _$NotificationItemDTOFromJson(Map<String, dynamic> json) =>
    _NotificationItemDTO(
      title: json['title'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$NotificationItemDTOToJson(
        _NotificationItemDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
    };
