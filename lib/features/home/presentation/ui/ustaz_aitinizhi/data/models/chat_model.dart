// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
abstract class ChatDTO with _$ChatDTO {
  const factory ChatDTO({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "date") String? date,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
  }) = _ChatDTO;

  factory ChatDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDTOFromJson(json);
}
