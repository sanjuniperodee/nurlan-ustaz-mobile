// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDeviceDTO _$NotificationDeviceDTOFromJson(
        Map<String, dynamic> json) =>
    _NotificationDeviceDTO(
      name: json['name'] as String?,
      registrationId: json['registration_id'] as String?,
      deviceId: json['device_id'] as String?,
      active: json['active'] as bool? ?? true,
      type: json['type'] as String?,
      dreams: json['dreams'] as bool? ?? true,
      city: json['city'] == null
          ? null
          : CityDTO.fromJson(json['city'] as Map<String, dynamic>),
      prayerTime: json['prayer_times'] as bool? ?? true,
      ayatOfTheDay: json['ayat_of_the_day'] as bool? ?? true,
      liveBroadcasts: json['live_broadcasts'] as bool? ?? true,
      tellMeUstaz: json['tell_me_ustaz'] as bool? ?? true,
      checkListResult: json['checklist_results'] as bool? ?? true,
      seminarTickets: json['seminar_tickets'] as bool? ?? true,
      newContent: json['new_content'] as bool? ?? true,
    );

Map<String, dynamic> _$NotificationDeviceDTOToJson(
        _NotificationDeviceDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'registration_id': instance.registrationId,
      'device_id': instance.deviceId,
      'active': instance.active,
      'type': instance.type,
      'dreams': instance.dreams,
      'city': instance.city,
      'prayer_times': instance.prayerTime,
      'ayat_of_the_day': instance.ayatOfTheDay,
      'live_broadcasts': instance.liveBroadcasts,
      'tell_me_ustaz': instance.tellMeUstaz,
      'checklist_results': instance.checkListResult,
      'seminar_tickets': instance.seminarTickets,
      'new_content': instance.newContent,
    };
