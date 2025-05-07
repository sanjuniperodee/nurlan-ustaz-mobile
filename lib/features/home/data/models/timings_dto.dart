// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timings_dto.freezed.dart';
part 'timings_dto.g.dart';

@freezed
abstract class TimingsDTO with _$TimingsDTO {
  const factory TimingsDTO({
    @JsonKey(name: "Fajr") String? fajr,
    @JsonKey(name: "Sunrise") String? sunrise,
    @JsonKey(name: "Dhuhr") String? dhuhr,
    @JsonKey(name: "Asr") String? asr,
    @JsonKey(name: "Maghrib") String? maghrib,
    @JsonKey(name: "Isha") String? isha,
  }) = _TimingsDTO;

  factory TimingsDTO.fromJson(Map<String, dynamic> json) =>
      _$TimingsDTOFromJson(json);
}
