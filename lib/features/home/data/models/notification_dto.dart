// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';

part 'notification_dto.g.dart';

@freezed
class NotificationDTO with _$NotificationDTO {
  const factory NotificationDTO({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "registration_id") String? registrationId,
    @JsonKey(name: "device_id") String? deviceId,
    bool? active,
    String? type,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "dreams") bool? customDreams,
    @JsonKey(name: "prayer_times") bool? prayerTimes,
    @JsonKey(name: "ayat_of_the_day") bool? ayatOfTheDay,
    @JsonKey(name: "live_broadcasts") bool? liveBroadcasts,
    @JsonKey(name: "tell_me_ustaz") bool? tellMeUstaz,
    @JsonKey(name: "checklist_results") bool? checklistResults,
    @JsonKey(name: "seminar_tickets") bool? seminarTickets,
    @JsonKey(name: "new_content") bool? newContent,
  }) = _NotificationDTO;

  factory NotificationDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationDTOFromJson(json);
}
