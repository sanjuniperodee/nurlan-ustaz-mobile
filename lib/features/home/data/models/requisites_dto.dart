// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'requisites_dto.freezed.dart';
part 'requisites_dto.g.dart';

@freezed
abstract class RequisitesDTO with _$RequisitesDTO {
  const factory RequisitesDTO({
    required int id,
    @JsonKey(name: "bank_account_number") String? bankAccountNumber,
    @JsonKey(name: "card_number") String? cardNumber,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "legal_entity") String? legalEntity,
    String? bin,
    String? iic,
    String? bic,
    String? ppc,
    String? url,
  }) = _RequisitesDTO;

  factory RequisitesDTO.fromJson(Map<String, dynamic> json) =>
      _$RequisitesDTOFromJson(json);
}
