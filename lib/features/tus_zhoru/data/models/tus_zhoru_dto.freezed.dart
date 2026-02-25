// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tus_zhoru_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TusZhoruDTO {
  @JsonKey(name: "id")
  int? get id;
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "description")
  String? get description;
  @JsonKey(name: "partial_explanation")
  String? get partialExplanation;
  @JsonKey(name: "full_explanation")
  String? get fullExplanation;
  @JsonKey(name: "price")
  double? get price;
  @JsonKey(name: "currency")
  String? get currency;
  @JsonKey(name: "is_free")
  bool? get isFree;
  @JsonKey(name: "is_active")
  bool? get isActive;
  @JsonKey(name: "is_saved")
  bool? get isSaved;
  @JsonKey(name: "is_purchased")
  bool? get isPurchased;
  @JsonKey(name: "is_paid")
  bool? get isPaid;
  @JsonKey(name: "explanation")
  String? get explanation;
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @JsonKey(name: "ticket_url")
  String? get ticketUrl;

  /// Create a copy of TusZhoruDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TusZhoruDTOCopyWith<TusZhoruDTO> get copyWith =>
      _$TusZhoruDTOCopyWithImpl<TusZhoruDTO>(this as TusZhoruDTO, _$identity);

  /// Serializes this TusZhoruDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.partialExplanation, partialExplanation) ||
                other.partialExplanation == partialExplanation) &&
            (identical(other.fullExplanation, fullExplanation) ||
                other.fullExplanation == fullExplanation) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ticketUrl, ticketUrl) ||
                other.ticketUrl == ticketUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      partialExplanation,
      fullExplanation,
      price,
      currency,
      isFree,
      isActive,
      isSaved,
      isPurchased,
      isPaid,
      explanation,
      createdAt,
      ticketUrl);

  @override
  String toString() {
    return 'TusZhoruDTO(id: $id, title: $title, description: $description, partialExplanation: $partialExplanation, fullExplanation: $fullExplanation, price: $price, currency: $currency, isFree: $isFree, isActive: $isActive, isSaved: $isSaved, isPurchased: $isPurchased, isPaid: $isPaid, explanation: $explanation, createdAt: $createdAt, ticketUrl: $ticketUrl)';
  }
}

/// @nodoc
abstract mixin class $TusZhoruDTOCopyWith<$Res> {
  factory $TusZhoruDTOCopyWith(
          TusZhoruDTO value, $Res Function(TusZhoruDTO) _then) =
      _$TusZhoruDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "partial_explanation") String? partialExplanation,
      @JsonKey(name: "full_explanation") String? fullExplanation,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "is_free") bool? isFree,
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "is_saved") bool? isSaved,
      @JsonKey(name: "is_purchased") bool? isPurchased,
      @JsonKey(name: "is_paid") bool? isPaid,
      @JsonKey(name: "explanation") String? explanation,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "ticket_url") String? ticketUrl});
}

/// @nodoc
class _$TusZhoruDTOCopyWithImpl<$Res> implements $TusZhoruDTOCopyWith<$Res> {
  _$TusZhoruDTOCopyWithImpl(this._self, this._then);

  final TusZhoruDTO _self;
  final $Res Function(TusZhoruDTO) _then;

  /// Create a copy of TusZhoruDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? partialExplanation = freezed,
    Object? fullExplanation = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? isFree = freezed,
    Object? isActive = freezed,
    Object? isSaved = freezed,
    Object? isPurchased = freezed,
    Object? isPaid = freezed,
    Object? explanation = freezed,
    Object? createdAt = freezed,
    Object? ticketUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      partialExplanation: freezed == partialExplanation
          ? _self.partialExplanation
          : partialExplanation // ignore: cast_nullable_to_non_nullable
              as String?,
      fullExplanation: freezed == fullExplanation
          ? _self.fullExplanation
          : fullExplanation // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      isFree: freezed == isFree
          ? _self.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPurchased: freezed == isPurchased
          ? _self.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPaid: freezed == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      explanation: freezed == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ticketUrl: freezed == ticketUrl
          ? _self.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TusZhoruDTO implements TusZhoruDTO {
  const _TusZhoruDTO(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "partial_explanation") this.partialExplanation,
      @JsonKey(name: "full_explanation") this.fullExplanation,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "currency") this.currency,
      @JsonKey(name: "is_free") this.isFree,
      @JsonKey(name: "is_active") this.isActive,
      @JsonKey(name: "is_saved") this.isSaved,
      @JsonKey(name: "is_purchased") this.isPurchased,
      @JsonKey(name: "is_paid") this.isPaid,
      @JsonKey(name: "explanation") this.explanation,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "ticket_url") this.ticketUrl});
  factory _TusZhoruDTO.fromJson(Map<String, dynamic> json) =>
      _$TusZhoruDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "partial_explanation")
  final String? partialExplanation;
  @override
  @JsonKey(name: "full_explanation")
  final String? fullExplanation;
  @override
  @JsonKey(name: "price")
  final double? price;
  @override
  @JsonKey(name: "currency")
  final String? currency;
  @override
  @JsonKey(name: "is_free")
  final bool? isFree;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  @JsonKey(name: "is_saved")
  final bool? isSaved;
  @override
  @JsonKey(name: "is_purchased")
  final bool? isPurchased;
  @override
  @JsonKey(name: "is_paid")
  final bool? isPaid;
  @override
  @JsonKey(name: "explanation")
  final String? explanation;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "ticket_url")
  final String? ticketUrl;

  /// Create a copy of TusZhoruDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TusZhoruDTOCopyWith<_TusZhoruDTO> get copyWith =>
      __$TusZhoruDTOCopyWithImpl<_TusZhoruDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TusZhoruDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TusZhoruDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.partialExplanation, partialExplanation) ||
                other.partialExplanation == partialExplanation) &&
            (identical(other.fullExplanation, fullExplanation) ||
                other.fullExplanation == fullExplanation) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ticketUrl, ticketUrl) ||
                other.ticketUrl == ticketUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      partialExplanation,
      fullExplanation,
      price,
      currency,
      isFree,
      isActive,
      isSaved,
      isPurchased,
      isPaid,
      explanation,
      createdAt,
      ticketUrl);

  @override
  String toString() {
    return 'TusZhoruDTO(id: $id, title: $title, description: $description, partialExplanation: $partialExplanation, fullExplanation: $fullExplanation, price: $price, currency: $currency, isFree: $isFree, isActive: $isActive, isSaved: $isSaved, isPurchased: $isPurchased, isPaid: $isPaid, explanation: $explanation, createdAt: $createdAt, ticketUrl: $ticketUrl)';
  }
}

/// @nodoc
abstract mixin class _$TusZhoruDTOCopyWith<$Res>
    implements $TusZhoruDTOCopyWith<$Res> {
  factory _$TusZhoruDTOCopyWith(
          _TusZhoruDTO value, $Res Function(_TusZhoruDTO) _then) =
      __$TusZhoruDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "partial_explanation") String? partialExplanation,
      @JsonKey(name: "full_explanation") String? fullExplanation,
      @JsonKey(name: "price") double? price,
      @JsonKey(name: "currency") String? currency,
      @JsonKey(name: "is_free") bool? isFree,
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "is_saved") bool? isSaved,
      @JsonKey(name: "is_purchased") bool? isPurchased,
      @JsonKey(name: "is_paid") bool? isPaid,
      @JsonKey(name: "explanation") String? explanation,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "ticket_url") String? ticketUrl});
}

/// @nodoc
class __$TusZhoruDTOCopyWithImpl<$Res> implements _$TusZhoruDTOCopyWith<$Res> {
  __$TusZhoruDTOCopyWithImpl(this._self, this._then);

  final _TusZhoruDTO _self;
  final $Res Function(_TusZhoruDTO) _then;

  /// Create a copy of TusZhoruDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? partialExplanation = freezed,
    Object? fullExplanation = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? isFree = freezed,
    Object? isActive = freezed,
    Object? isSaved = freezed,
    Object? isPurchased = freezed,
    Object? isPaid = freezed,
    Object? explanation = freezed,
    Object? createdAt = freezed,
    Object? ticketUrl = freezed,
  }) {
    return _then(_TusZhoruDTO(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      partialExplanation: freezed == partialExplanation
          ? _self.partialExplanation
          : partialExplanation // ignore: cast_nullable_to_non_nullable
              as String?,
      fullExplanation: freezed == fullExplanation
          ? _self.fullExplanation
          : fullExplanation // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      isFree: freezed == isFree
          ? _self.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPurchased: freezed == isPurchased
          ? _self.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPaid: freezed == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      explanation: freezed == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      ticketUrl: freezed == ticketUrl
          ? _self.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
