// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDTO _$NotificationDTOFromJson(Map<String, dynamic> json) =>
    _NotificationDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      registrationId: json['registration_id'] as String?,
      deviceId: json['device_id'] as String?,
      active: json['active'] as bool?,
      type: json['type'] as String?,
      dateCreated: json['date_created'] as String?,
      customDreams: json['dreams'] as bool?,
      prayerTimes: json['prayer_times'] as bool?,
      ayatOfTheDay: json['ayat_of_the_day'] as bool?,
      liveBroadcasts: json['live_broadcasts'] as bool?,
      tellMeUstaz: json['tell_me_ustaz'] as bool?,
      checklistResults: json['checklist_results'] as bool?,
      seminarTickets: json['seminar_tickets'] as bool?,
      newContent: json['new_content'] as bool?,
    );

Map<String, dynamic> _$NotificationDTOToJson(_NotificationDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'registration_id': instance.registrationId,
      'device_id': instance.deviceId,
      'active': instance.active,
      'type': instance.type,
      'date_created': instance.dateCreated,
      'dreams': instance.customDreams,
      'prayer_times': instance.prayerTimes,
      'ayat_of_the_day': instance.ayatOfTheDay,
      'live_broadcasts': instance.liveBroadcasts,
      'tell_me_ustaz': instance.tellMeUstaz,
      'checklist_results': instance.checklistResults,
      'seminar_tickets': instance.seminarTickets,
      'new_content': instance.newContent,
    };
