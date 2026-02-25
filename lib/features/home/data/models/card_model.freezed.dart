// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardDTO {
  int get id;
  @JsonKey(name: "card_number")
  String? get cardNumber;
  @JsonKey(name: "is_default")
  bool? get isDefault;

  /// Create a copy of CardDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardDTOCopyWith<CardDTO> get copyWith =>
      _$CardDTOCopyWithImpl<CardDTO>(this as CardDTO, _$identity);

  /// Serializes this CardDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cardNumber, isDefault);

  @override
  String toString() {
    return 'CardDTO(id: $id, cardNumber: $cardNumber, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class $CardDTOCopyWith<$Res> {
  factory $CardDTOCopyWith(CardDTO value, $Res Function(CardDTO) _then) =
      _$CardDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "card_number") String? cardNumber,
      @JsonKey(name: "is_default") bool? isDefault});
}

/// @nodoc
class _$CardDTOCopyWithImpl<$Res> implements $CardDTOCopyWith<$Res> {
  _$CardDTOCopyWithImpl(this._self, this._then);

  final CardDTO _self;
  final $Res Function(CardDTO) _then;

  /// Create a copy of CardDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardNumber = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: freezed == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CardDTO implements CardDTO {
  const _CardDTO(
      {required this.id,
      @JsonKey(name: "card_number") this.cardNumber,
      @JsonKey(name: "is_default") this.isDefault});
  factory _CardDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDTOFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "card_number")
  final String? cardNumber;
  @override
  @JsonKey(name: "is_default")
  final bool? isDefault;

  /// Create a copy of CardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CardDTOCopyWith<_CardDTO> get copyWith =>
      __$CardDTOCopyWithImpl<_CardDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CardDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, cardNumber, isDefault);

  @override
  String toString() {
    return 'CardDTO(id: $id, cardNumber: $cardNumber, isDefault: $isDefault)';
  }
}

/// @nodoc
abstract mixin class _$CardDTOCopyWith<$Res> implements $CardDTOCopyWith<$Res> {
  factory _$CardDTOCopyWith(_CardDTO value, $Res Function(_CardDTO) _then) =
      __$CardDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "card_number") String? cardNumber,
      @JsonKey(name: "is_default") bool? isDefault});
}

/// @nodoc
class __$CardDTOCopyWithImpl<$Res> implements _$CardDTOCopyWith<$Res> {
  __$CardDTOCopyWithImpl(this._self, this._then);

  final _CardDTO _self;
  final $Res Function(_CardDTO) _then;

  /// Create a copy of CardDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? cardNumber = freezed,
    Object? isDefault = freezed,
  }) {
    return _then(_CardDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardNumber: freezed == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
