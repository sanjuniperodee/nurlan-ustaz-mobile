// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_dto.freezed.dart';

part 'city_dto.g.dart';

@freezed
class CityDTO with _$CityDTO {
  const factory CityDTO({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "latitude") int? latitude,
    @JsonKey(name: "longitude") int? longitude,


  }) = _CityDTO;

  factory CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);
}
