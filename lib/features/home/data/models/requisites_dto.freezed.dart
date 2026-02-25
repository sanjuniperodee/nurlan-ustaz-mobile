// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requisites_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequisitesDTO {
  int get id;
  @JsonKey(name: "bank_account_number")
  String? get bankAccountNumber;
  @JsonKey(name: "card_number")
  String? get cardNumber;
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @JsonKey(name: "legal_entity")
  String? get legalEntity;
  String? get bin;
  String? get iic;
  String? get bic;
  String? get ppc;
  String? get url;

  /// Create a copy of RequisitesDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequisitesDTOCopyWith<RequisitesDTO> get copyWith =>
      _$RequisitesDTOCopyWithImpl<RequisitesDTO>(
          this as RequisitesDTO, _$identity);

  /// Serializes this RequisitesDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequisitesDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.legalEntity, legalEntity) ||
                other.legalEntity == legalEntity) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.iic, iic) || other.iic == iic) &&
            (identical(other.bic, bic) || other.bic == bic) &&
            (identical(other.ppc, ppc) || other.ppc == ppc) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, bankAccountNumber,
      cardNumber, phoneNumber, legalEntity, bin, iic, bic, ppc, url);

  @override
  String toString() {
    return 'RequisitesDTO(id: $id, bankAccountNumber: $bankAccountNumber, cardNumber: $cardNumber, phoneNumber: $phoneNumber, legalEntity: $legalEntity, bin: $bin, iic: $iic, bic: $bic, ppc: $ppc, url: $url)';
  }
}

/// @nodoc
abstract mixin class $RequisitesDTOCopyWith<$Res> {
  factory $RequisitesDTOCopyWith(
          RequisitesDTO value, $Res Function(RequisitesDTO) _then) =
      _$RequisitesDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "bank_account_number") String? bankAccountNumber,
      @JsonKey(name: "card_number") String? cardNumber,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "legal_entity") String? legalEntity,
      String? bin,
      String? iic,
      String? bic,
      String? ppc,
      String? url});
}

/// @nodoc
class _$RequisitesDTOCopyWithImpl<$Res>
    implements $RequisitesDTOCopyWith<$Res> {
  _$RequisitesDTOCopyWithImpl(this._self, this._then);

  final RequisitesDTO _self;
  final $Res Function(RequisitesDTO) _then;

  /// Create a copy of RequisitesDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bankAccountNumber = freezed,
    Object? cardNumber = freezed,
    Object? phoneNumber = freezed,
    Object? legalEntity = freezed,
    Object? bin = freezed,
    Object? iic = freezed,
    Object? bic = freezed,
    Object? ppc = freezed,
    Object? url = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccountNumber: freezed == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      legalEntity: freezed == legalEntity
          ? _self.legalEntity
          : legalEntity // ignore: cast_nullable_to_non_nullable
              as String?,
      bin: freezed == bin
          ? _self.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String?,
      iic: freezed == iic
          ? _self.iic
          : iic // ignore: cast_nullable_to_non_nullable
              as String?,
      bic: freezed == bic
          ? _self.bic
          : bic // ignore: cast_nullable_to_non_nullable
              as String?,
      ppc: freezed == ppc
          ? _self.ppc
          : ppc // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RequisitesDTO implements RequisitesDTO {
  const _RequisitesDTO(
      {required this.id,
      @JsonKey(name: "bank_account_number") this.bankAccountNumber,
      @JsonKey(name: "card_number") this.cardNumber,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "legal_entity") this.legalEntity,
      this.bin,
      this.iic,
      this.bic,
      this.ppc,
      this.url});
  factory _RequisitesDTO.fromJson(Map<String, dynamic> json) =>
      _$RequisitesDTOFromJson(json);

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
  @JsonKey(name: "legal_entity")
  final String? legalEntity;
  @override
  final String? bin;
  @override
  final String? iic;
  @override
  final String? bic;
  @override
  final String? ppc;
  @override
  final String? url;

  /// Create a copy of RequisitesDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequisitesDTOCopyWith<_RequisitesDTO> get copyWith =>
      __$RequisitesDTOCopyWithImpl<_RequisitesDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RequisitesDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequisitesDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.legalEntity, legalEntity) ||
                other.legalEntity == legalEntity) &&
            (identical(other.bin, bin) || other.bin == bin) &&
            (identical(other.iic, iic) || other.iic == iic) &&
            (identical(other.bic, bic) || other.bic == bic) &&
            (identical(other.ppc, ppc) || other.ppc == ppc) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, bankAccountNumber,
      cardNumber, phoneNumber, legalEntity, bin, iic, bic, ppc, url);

  @override
  String toString() {
    return 'RequisitesDTO(id: $id, bankAccountNumber: $bankAccountNumber, cardNumber: $cardNumber, phoneNumber: $phoneNumber, legalEntity: $legalEntity, bin: $bin, iic: $iic, bic: $bic, ppc: $ppc, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$RequisitesDTOCopyWith<$Res>
    implements $RequisitesDTOCopyWith<$Res> {
  factory _$RequisitesDTOCopyWith(
          _RequisitesDTO value, $Res Function(_RequisitesDTO) _then) =
      __$RequisitesDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "bank_account_number") String? bankAccountNumber,
      @JsonKey(name: "card_number") String? cardNumber,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "legal_entity") String? legalEntity,
      String? bin,
      String? iic,
      String? bic,
      String? ppc,
      String? url});
}

/// @nodoc
class __$RequisitesDTOCopyWithImpl<$Res>
    implements _$RequisitesDTOCopyWith<$Res> {
  __$RequisitesDTOCopyWithImpl(this._self, this._then);

  final _RequisitesDTO _self;
  final $Res Function(_RequisitesDTO) _then;

  /// Create a copy of RequisitesDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bankAccountNumber = freezed,
    Object? cardNumber = freezed,
    Object? phoneNumber = freezed,
    Object? legalEntity = freezed,
    Object? bin = freezed,
    Object? iic = freezed,
    Object? bic = freezed,
    Object? ppc = freezed,
    Object? url = freezed,
  }) {
    return _then(_RequisitesDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccountNumber: freezed == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _self.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      legalEntity: freezed == legalEntity
          ? _self.legalEntity
          : legalEntity // ignore: cast_nullable_to_non_nullable
              as String?,
      bin: freezed == bin
          ? _self.bin
          : bin // ignore: cast_nullable_to_non_nullable
              as String?,
      iic: freezed == iic
          ? _self.iic
          : iic // ignore: cast_nullable_to_non_nullable
              as String?,
      bic: freezed == bic
          ? _self.bic
          : bic // ignore: cast_nullable_to_non_nullable
              as String?,
      ppc: freezed == ppc
          ? _self.ppc
          : ppc // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
