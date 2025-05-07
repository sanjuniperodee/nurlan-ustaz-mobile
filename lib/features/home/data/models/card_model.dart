// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';

part 'card_model.g.dart';

@freezed
abstract class CardDTO with _$CardDTO {
  const factory CardDTO({
    required final int id,
    @JsonKey(name: "card_number") String? cardNumber,
    @JsonKey(name: "is_default") bool? isDefault,
  }) = _CardDTO;

  factory CardDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDTOFromJson(json);
}
