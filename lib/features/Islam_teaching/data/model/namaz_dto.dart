// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'namaz_dto.freezed.dart';
part 'namaz_dto.g.dart';

@freezed
abstract class NamazDTO with _$NamazDTO {
  const factory NamazDTO({
    required int id,
    String? type,
    @JsonKey(name: "prayer_time") int? prayerTime,
    int? queue,
    String? title,
    String? gender,
    String? text,
  }) = _NamazDTO;

  factory NamazDTO.fromJson(Map<String, dynamic> json) =>
      _$NamazDTOFromJson(json);
}
