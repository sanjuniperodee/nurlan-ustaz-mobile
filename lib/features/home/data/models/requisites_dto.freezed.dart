// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requisites_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequisitesDTO _$RequisitesDTOFromJson(Map<String, dynamic> json) {
  return _RequisitesDTO.fromJson(json);
}

/// @nodoc
mixin _$RequisitesDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_account_number")
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "card_number")
  String? get cardNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequisitesDTOCopyWith<RequisitesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequisitesDTOCopyWith<$Res> {
  factory $RequisitesDTOCopyWith(
          RequisitesDTO value, $Res Function(RequisitesDTO) then) =
      _$RequisitesDTOCopyWithImpl<$Res, RequisitesDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "bank_account_number") String? bankAccountNumber,
      @JsonKey(name: "card_number") String? cardNumber,
      @JsonKey(name: "phone_number") String? phoneNumber});
}

/// @nodoc
class _$RequisitesDTOCopyWithImpl<$Res, $Val extends RequisitesDTO>
    implements $RequisitesDTOCopyWith<$Res> {
  _$RequisitesDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankAccountNumber = freezed,
    Object? cardNumber = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequisitesDTOCopyWith<$Res>
    implements $RequisitesDTOCopyWith<$Res> {
  factory _$$_RequisitesDTOCopyWith(
          _$_RequisitesDTO value, $Res Function(_$_RequisitesDTO) then) =
      __$$_RequisitesDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "bank_account_number") String? bankAccountNumber,
      @JsonKey(name: "card_number") String? cardNumber,
      @JsonKey(name: "phone_number") String? phoneNumber});
}

/// @nodoc
class __$$_RequisitesDTOCopyWithImpl<$Res>
    extends _$RequisitesDTOCopyWithImpl<$Res, _$_RequisitesDTO>
    implements _$$_RequisitesDTOCopyWith<$Res> {
  __$$_RequisitesDTOCopyWithImpl(
      _$_RequisitesDTO _value, $Res Function(_$_RequisitesDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankAccountNumber = freezed,
    Object? cardNumber = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_RequisitesDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequisitesDTO implements _RequisitesDTO {
  const _$_RequisitesDTO(
      {required this.id,
      @JsonKey(name: "bank_account_number") this.bankAccountNumber,
      @JsonKey(name: "card_number") this.cardNumber,
      @JsonKey(name: "phone_number") this.phoneNumber});

  factory _$_RequisitesDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RequisitesDTOFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "bank_account_number")
  final String? bankAccountNumber;
  @override
  @JsonKey(name: "card_number")
  final String? cardNumber;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;

  @override
  String toString() {
    return 'RequisitesDTO(id: $id, bankAccountNumber: $bankAccountNumber, cardNumber: $cardNumber, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequisitesDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bankAccountNumber, cardNumber, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequisitesDTOCopyWith<_$_RequisitesDTO> get copyWith =>
      __$$_RequisitesDTOCopyWithImpl<_$_RequisitesDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequisitesDTOToJson(
      this,
    );
  }
}

abstract class _RequisitesDTO implements RequisitesDTO {
  const factory _RequisitesDTO(
          {required final int id,
          @JsonKey(name: "bank_account_number") final String? bankAccountNumber,
          @JsonKey(name: "card_number") final String? cardNumber,
          @JsonKey(name: "phone_number") final String? phoneNumber}) =
      _$_RequisitesDTO;

  factory _RequisitesDTO.fromJson(Map<String, dynamic> json) =
      _$_RequisitesDTO.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "bank_account_number")
  String? get bankAccountNumber;
  @override
  @JsonKey(name: "card_number")
  String? get cardNumber;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_RequisitesDTOCopyWith<_$_RequisitesDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
