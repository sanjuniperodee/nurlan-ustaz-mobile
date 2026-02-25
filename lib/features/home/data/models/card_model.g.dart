// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardDTO _$CardDTOFromJson(Map<String, dynamic> json) => _CardDTO(
      id: (json['id'] as num).toInt(),
      cardNumber: json['card_number'] as String?,
      isDefault: json['is_default'] as bool?,
    );

Map<String, dynamic> _$CardDTOToJson(_CardDTO instance) => <String, dynamic>{
      'id': instance.id,
      'card_number': instance.cardNumber,
      'is_default': instance.isDefault,
    };
