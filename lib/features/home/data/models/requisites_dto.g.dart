// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requisites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequisitesDTOImpl _$$RequisitesDTOImplFromJson(Map<String, dynamic> json) =>
    _$RequisitesDTOImpl(
      id: json['id'] as int,
      bankAccountNumber: json['bank_account_number'] as String?,
      cardNumber: json['card_number'] as String?,
      phoneNumber: json['phone_number'] as String?,
      legalEntity: json['legal_entity'] as String?,
      bin: json['bin'] as String?,
      iic: json['iic'] as String?,
      bic: json['bic'] as String?,
      ppc: json['ppc'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$RequisitesDTOImplToJson(_$RequisitesDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank_account_number': instance.bankAccountNumber,
      'card_number': instance.cardNumber,
      'phone_number': instance.phoneNumber,
      'legal_entity': instance.legalEntity,
      'bin': instance.bin,
      'iic': instance.iic,
      'bic': instance.bic,
      'ppc': instance.ppc,
      'url': instance.url,
    };
