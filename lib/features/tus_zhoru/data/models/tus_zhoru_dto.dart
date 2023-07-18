// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tus_zhoru_dto.freezed.dart';
part 'tus_zhoru_dto.g.dart';

@freezed
class TusZhoruDTO with _$TusZhoruDTO {
  const factory TusZhoruDTO({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "partial_explanation") String? partialExplanation,
    @JsonKey(name: "full_explanation") String? fullExplanation,
    @JsonKey(name: "price") double? price,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "is_free") bool? isFree,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "is_saved") bool? isSaved,
    @JsonKey(name: "is_purchased") bool? isPurchased,
    @JsonKey(name: "is_paid") bool? isPaid,
    @JsonKey(name: "explanation") String? explanation,
  }) = _TusZhoruDTO;

  factory TusZhoruDTO.fromJson(Map<String, dynamic> json) =>
      _$TusZhoruDTOFromJson(json);
}
