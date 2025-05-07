// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geonames_dto.freezed.dart';
part 'geonames_dto.g.dart';

@freezed
abstract class GeonamesDTO with _$GeonamesDTO {
  const factory GeonamesDTO({
    String? lng,
    String? lat,
    String? countryName,
    String? name,
    String? adminName1,
  }) = _GeonamesDTO;

  factory GeonamesDTO.fromJson(Map<String, dynamic> json) =>
      _$GeonamesDTOFromJson(json);
}
