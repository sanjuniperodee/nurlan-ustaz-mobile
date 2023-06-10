// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requisites_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequisitesDTO _$$_RequisitesDTOFromJson(Map<String, dynamic> json) =>
    _$_RequisitesDTO(
      id: json['id'] as int,
      bankAccountNumber: json['bank_account_number'] as String?,
      cardNumber: json['card_number'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$$_RequisitesDTOToJson(_$_RequisitesDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank_account_number': instance.bankAccountNumber,
      'card_number': instance.cardNumber,
      'phone_number': instance.phoneNumber,
    };
