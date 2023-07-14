// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item_dto.freezed.dart';

part 'notification_item_dto.g.dart';

@freezed
class NotificationItemDTO with _$NotificationItemDTO {
  const factory NotificationItemDTO({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "status") bool? status,

  }) = _NotificationItemDTO;

  factory NotificationItemDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemDTOFromJson(json);
}
