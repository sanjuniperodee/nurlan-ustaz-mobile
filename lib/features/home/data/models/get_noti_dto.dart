// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';

part 'get_noti_dto.freezed.dart';
part 'get_noti_dto.g.dart';

@freezed
class GetNotiDTO with _$GetNotiDTO {
  const factory GetNotiDTO({
    List<MediaDTO>? news,
    List<MediaDTO>? live,
    @JsonKey(name: "dream_interpretation") List<MediaDTO>? dream,
    @JsonKey(name: "muslim_name") List<MediaDTO>? muslimName,
    @JsonKey(name: "tell_me_ustaz") List<MediaDTO>? tellMe,
  }) = _MediaDTO;

  factory GetNotiDTO.fromJson(Map<String, dynamic> json) =>
      _$GetNotiDTOFromJson(json);
}
