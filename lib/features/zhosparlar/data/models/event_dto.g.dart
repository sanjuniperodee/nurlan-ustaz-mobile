// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventDto _$EventDtoFromJson(Map<String, dynamic> json) => _EventDto(
      id: (json['id'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$EventsTypeEnumMap, json['type']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      address: json['address'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$EventDtoToJson(_EventDto instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$EventsTypeEnumMap[instance.type],
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'time': instance.time,
      'address': instance.address,
      'link': instance.link,
    };

const _$EventsTypeEnumMap = {
  EventsType.seminar: 'seminar',
  EventsType.groupService: 'group_service',
  EventsType.holiday: 'holiday',
  EventsType.live: 'live',
};
