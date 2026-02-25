// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freedom_payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FreedomPaymentDTO _$FreedomPaymentDTOFromJson(Map<String, dynamic> json) =>
    _FreedomPaymentDTO(
      pgStatus: json['pg_status'] as String?,
      pgPaymentId: json['pg_payment_id'] as String?,
      pgRedirectUrl: json['pg_redirect_url'] as String?,
      pgRedirectedUrlType: json['pg_redirect_url_type'] as String?,
      pgSalt: json['pg_salt'] as String?,
      pg_sig: json['pg_sig'] as String?,
    );

Map<String, dynamic> _$FreedomPaymentDTOToJson(_FreedomPaymentDTO instance) =>
    <String, dynamic>{
      'pg_status': instance.pgStatus,
      'pg_payment_id': instance.pgPaymentId,
      'pg_redirect_url': instance.pgRedirectUrl,
      'pg_redirect_url_type': instance.pgRedirectedUrlType,
      'pg_salt': instance.pgSalt,
      'pg_sig': instance.pg_sig,
    };
