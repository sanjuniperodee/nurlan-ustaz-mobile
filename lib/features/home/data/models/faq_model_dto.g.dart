// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaDTO _$MediaDTOFromJson(Map<String, dynamic> json) => _MediaDTO(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$MediaDTOToJson(_MediaDTO instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
