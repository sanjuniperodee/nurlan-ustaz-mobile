// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
FaqModelDTO _$FaqModelDTOFromJson(Map<String, dynamic> json) {
  return _MediaDTO.fromJson(json);
}

/// @nodoc
mixin _$FaqModelDTO {
  int get id;
  String? get question;
  String? get answer;

  /// Create a copy of FaqModelDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqModelDTOCopyWith<FaqModelDTO> get copyWith =>
      _$FaqModelDTOCopyWithImpl<FaqModelDTO>(this as FaqModelDTO, _$identity);

  /// Serializes this FaqModelDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaqModelDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  @override
  String toString() {
    return 'FaqModelDTO(id: $id, question: $question, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $FaqModelDTOCopyWith<$Res> {
  factory $FaqModelDTOCopyWith(
          FaqModelDTO value, $Res Function(FaqModelDTO) _then) =
      _$FaqModelDTOCopyWithImpl;
  @useResult
  $Res call({int id, String? question, String? answer});
}

/// @nodoc
class _$FaqModelDTOCopyWithImpl<$Res> implements $FaqModelDTOCopyWith<$Res> {
  _$FaqModelDTOCopyWithImpl(this._self, this._then);

  final FaqModelDTO _self;
  final $Res Function(FaqModelDTO) _then;

  /// Create a copy of FaqModelDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: freezed == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MediaDTO implements FaqModelDTO {
  const _MediaDTO({required this.id, this.question, this.answer});
  factory _MediaDTO.fromJson(Map<String, dynamic> json) =>
      _$MediaDTOFromJson(json);

  @override
  final int id;
  @override
  final String? question;
  @override
  final String? answer;

  /// Create a copy of FaqModelDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MediaDTOCopyWith<_MediaDTO> get copyWith =>
      __$MediaDTOCopyWithImpl<_MediaDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MediaDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  @override
  String toString() {
    return 'FaqModelDTO(id: $id, question: $question, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$MediaDTOCopyWith<$Res>
    implements $FaqModelDTOCopyWith<$Res> {
  factory _$MediaDTOCopyWith(_MediaDTO value, $Res Function(_MediaDTO) _then) =
      __$MediaDTOCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String? question, String? answer});
}

/// @nodoc
class __$MediaDTOCopyWithImpl<$Res> implements _$MediaDTOCopyWith<$Res> {
  __$MediaDTOCopyWithImpl(this._self, this._then);

  final _MediaDTO _self;
  final $Res Function(_MediaDTO) _then;

  /// Create a copy of FaqModelDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_MediaDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: freezed == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
