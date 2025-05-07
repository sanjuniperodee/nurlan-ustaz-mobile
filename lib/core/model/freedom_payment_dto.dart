// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freedom_payment_dto.freezed.dart';

part 'freedom_payment_dto.g.dart';

@freezed
abstract class FreedomPaymentDTO with _$FreedomPaymentDTO {
  const factory FreedomPaymentDTO({
    @JsonKey(name: "pg_status") String? pgStatus,
    @JsonKey(name: "pg_payment_id") String? pgPaymentId,
    @JsonKey(name: "pg_redirect_url") String? pgRedirectUrl,
    @JsonKey(name: "pg_redirect_url_type") String? pgRedirectedUrlType,
    @JsonKey(name: "pg_salt") String? pgSalt,
    @JsonKey(name: "pg_sig") String? pg_sig,
  }) = _FreedomPaymentDTO;

  factory FreedomPaymentDTO.fromJson(Map<String, dynamic> json) =>
      _$FreedomPaymentDTOFromJson(json);
}
