// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tus_zhoru_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TusZhoruDTO _$TusZhoruDTOFromJson(Map<String, dynamic> json) => _TusZhoruDTO(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      partialExplanation: json['partial_explanation'] as String?,
      fullExplanation: json['full_explanation'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      isFree: json['is_free'] as bool?,
      isActive: json['is_active'] as bool?,
      isSaved: json['is_saved'] as bool?,
      isPurchased: json['is_purchased'] as bool?,
      isPaid: json['is_paid'] as bool?,
      explanation: json['explanation'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      ticketUrl: json['ticket_url'] as String?,
    );

Map<String, dynamic> _$TusZhoruDTOToJson(_TusZhoruDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'partial_explanation': instance.partialExplanation,
      'full_explanation': instance.fullExplanation,
      'price': instance.price,
      'currency': instance.currency,
      'is_free': instance.isFree,
      'is_active': instance.isActive,
      'is_saved': instance.isSaved,
      'is_purchased': instance.isPurchased,
      'is_paid': instance.isPaid,
      'explanation': instance.explanation,
      'created_at': instance.createdAt?.toIso8601String(),
      'ticket_url': instance.ticketUrl,
    };
