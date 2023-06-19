// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model_dto.freezed.dart';
part 'faq_model_dto.g.dart';

@freezed
class FaqModelDTO with _$FaqModelDTO {
  const factory FaqModelDTO({
    required int id,
    String? question,
    String? answer,
  }) = _MediaDTO;

  factory FaqModelDTO.fromJson(Map<String, dynamic> json) =>
      _$FaqModelDTOFromJson(json);
}
