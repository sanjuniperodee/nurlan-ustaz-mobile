// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/city_dto.dart';

part 'notification_device_dto.freezed.dart';

part 'notification_device_dto.g.dart';

@freezed
abstract class NotificationDeviceDTO with _$NotificationDeviceDTO {
  const factory NotificationDeviceDTO({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "registration_id") String? registrationId,
    @JsonKey(name: "device_id") String? deviceId,
    @JsonKey(name: "active") @Default(true) bool? active,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "dreams") @Default(true) bool? dreams,
    @JsonKey(name: "city") CityDTO? city,
    @JsonKey(name: "prayer_times") @Default(true) bool? prayerTime,
    @JsonKey(name: "ayat_of_the_day") @Default(true) bool? ayatOfTheDay,
    @JsonKey(name: "live_broadcasts") @Default(true) bool? liveBroadcasts,
    @JsonKey(name: "tell_me_ustaz") @Default(true) bool? tellMeUstaz,
    @JsonKey(name: "checklist_results") @Default(true) bool? checkListResult,
    @JsonKey(name: "seminar_tickets") @Default(true) bool? seminarTickets,
    @JsonKey(name: "new_content") @Default(true) bool? newContent,
  }) = _NotificationDeviceDTO;

  factory NotificationDeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationDeviceDTOFromJson(json);
}
