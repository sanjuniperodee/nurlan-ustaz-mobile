// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_dto.freezed.dart';
part 'media_dto.g.dart';

@freezed
class MediaDTO with _$MediaDTO {
  const factory MediaDTO({
    required int id,
    String? file,
    String? title,
  }) = _MediaDTO;

  factory MediaDTO.fromJson(Map<String, dynamic> json) =>
      _$MediaDTOFromJson(json);
}
