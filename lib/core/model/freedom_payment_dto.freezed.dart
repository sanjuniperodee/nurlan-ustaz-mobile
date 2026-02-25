// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freedom_payment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreedomPaymentDTO {
  @JsonKey(name: "pg_status")
  String? get pgStatus;
  @JsonKey(name: "pg_payment_id")
  String? get pgPaymentId;
  @JsonKey(name: "pg_redirect_url")
  String? get pgRedirectUrl;
  @JsonKey(name: "pg_redirect_url_type")
  String? get pgRedirectedUrlType;
  @JsonKey(name: "pg_salt")
  String? get pgSalt;
  @JsonKey(name: "pg_sig")
  String? get pg_sig;

  /// Create a copy of FreedomPaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FreedomPaymentDTOCopyWith<FreedomPaymentDTO> get copyWith =>
      _$FreedomPaymentDTOCopyWithImpl<FreedomPaymentDTO>(
          this as FreedomPaymentDTO, _$identity);

  /// Serializes this FreedomPaymentDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreedomPaymentDTO &&
            (identical(other.pgStatus, pgStatus) ||
                other.pgStatus == pgStatus) &&
            (identical(other.pgPaymentId, pgPaymentId) ||
                other.pgPaymentId == pgPaymentId) &&
            (identical(other.pgRedirectUrl, pgRedirectUrl) ||
                other.pgRedirectUrl == pgRedirectUrl) &&
            (identical(other.pgRedirectedUrlType, pgRedirectedUrlType) ||
                other.pgRedirectedUrlType == pgRedirectedUrlType) &&
            (identical(other.pgSalt, pgSalt) || other.pgSalt == pgSalt) &&
            (identical(other.pg_sig, pg_sig) || other.pg_sig == pg_sig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pgStatus, pgPaymentId,
      pgRedirectUrl, pgRedirectedUrlType, pgSalt, pg_sig);

  @override
  String toString() {
    return 'FreedomPaymentDTO(pgStatus: $pgStatus, pgPaymentId: $pgPaymentId, pgRedirectUrl: $pgRedirectUrl, pgRedirectedUrlType: $pgRedirectedUrlType, pgSalt: $pgSalt, pg_sig: $pg_sig)';
  }
}

/// @nodoc
abstract mixin class $FreedomPaymentDTOCopyWith<$Res> {
  factory $FreedomPaymentDTOCopyWith(
          FreedomPaymentDTO value, $Res Function(FreedomPaymentDTO) _then) =
      _$FreedomPaymentDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "pg_status") String? pgStatus,
      @JsonKey(name: "pg_payment_id") String? pgPaymentId,
      @JsonKey(name: "pg_redirect_url") String? pgRedirectUrl,
      @JsonKey(name: "pg_redirect_url_type") String? pgRedirectedUrlType,
      @JsonKey(name: "pg_salt") String? pgSalt,
      @JsonKey(name: "pg_sig") String? pg_sig});
}

/// @nodoc
class _$FreedomPaymentDTOCopyWithImpl<$Res>
    implements $FreedomPaymentDTOCopyWith<$Res> {
  _$FreedomPaymentDTOCopyWithImpl(this._self, this._then);

  final FreedomPaymentDTO _self;
  final $Res Function(FreedomPaymentDTO) _then;

  /// Create a copy of FreedomPaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pgStatus = freezed,
    Object? pgPaymentId = freezed,
    Object? pgRedirectUrl = freezed,
    Object? pgRedirectedUrlType = freezed,
    Object? pgSalt = freezed,
    Object? pg_sig = freezed,
  }) {
    return _then(_self.copyWith(
      pgStatus: freezed == pgStatus
          ? _self.pgStatus
          : pgStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      pgPaymentId: freezed == pgPaymentId
          ? _self.pgPaymentId
          : pgPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      pgRedirectUrl: freezed == pgRedirectUrl
          ? _self.pgRedirectUrl
          : pgRedirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pgRedirectedUrlType: freezed == pgRedirectedUrlType
          ? _self.pgRedirectedUrlType
          : pgRedirectedUrlType // ignore: cast_nullable_to_non_nullable
              as String?,
      pgSalt: freezed == pgSalt
          ? _self.pgSalt
          : pgSalt // ignore: cast_nullable_to_non_nullable
              as String?,
      pg_sig: freezed == pg_sig
          ? _self.pg_sig
          : pg_sig // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FreedomPaymentDTO implements FreedomPaymentDTO {
  const _FreedomPaymentDTO(
      {@JsonKey(name: "pg_status") this.pgStatus,
      @JsonKey(name: "pg_payment_id") this.pgPaymentId,
      @JsonKey(name: "pg_redirect_url") this.pgRedirectUrl,
      @JsonKey(name: "pg_redirect_url_type") this.pgRedirectedUrlType,
      @JsonKey(name: "pg_salt") this.pgSalt,
      @JsonKey(name: "pg_sig") this.pg_sig});
  factory _FreedomPaymentDTO.fromJson(Map<String, dynamic> json) =>
      _$FreedomPaymentDTOFromJson(json);

  @override
  @JsonKey(name: "pg_status")
  final String? pgStatus;
  @override
  @JsonKey(name: "pg_payment_id")
  final String? pgPaymentId;
  @override
  @JsonKey(name: "pg_redirect_url")
  final String? pgRedirectUrl;
  @override
  @JsonKey(name: "pg_redirect_url_type")
  final String? pgRedirectedUrlType;
  @override
  @JsonKey(name: "pg_salt")
  final String? pgSalt;
  @override
  @JsonKey(name: "pg_sig")
  final String? pg_sig;

  /// Create a copy of FreedomPaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FreedomPaymentDTOCopyWith<_FreedomPaymentDTO> get copyWith =>
      __$FreedomPaymentDTOCopyWithImpl<_FreedomPaymentDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FreedomPaymentDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FreedomPaymentDTO &&
            (identical(other.pgStatus, pgStatus) ||
                other.pgStatus == pgStatus) &&
            (identical(other.pgPaymentId, pgPaymentId) ||
                other.pgPaymentId == pgPaymentId) &&
            (identical(other.pgRedirectUrl, pgRedirectUrl) ||
                other.pgRedirectUrl == pgRedirectUrl) &&
            (identical(other.pgRedirectedUrlType, pgRedirectedUrlType) ||
                other.pgRedirectedUrlType == pgRedirectedUrlType) &&
            (identical(other.pgSalt, pgSalt) || other.pgSalt == pgSalt) &&
            (identical(other.pg_sig, pg_sig) || other.pg_sig == pg_sig));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pgStatus, pgPaymentId,
      pgRedirectUrl, pgRedirectedUrlType, pgSalt, pg_sig);

  @override
  String toString() {
    return 'FreedomPaymentDTO(pgStatus: $pgStatus, pgPaymentId: $pgPaymentId, pgRedirectUrl: $pgRedirectUrl, pgRedirectedUrlType: $pgRedirectedUrlType, pgSalt: $pgSalt, pg_sig: $pg_sig)';
  }
}

/// @nodoc
abstract mixin class _$FreedomPaymentDTOCopyWith<$Res>
    implements $FreedomPaymentDTOCopyWith<$Res> {
  factory _$FreedomPaymentDTOCopyWith(
          _FreedomPaymentDTO value, $Res Function(_FreedomPaymentDTO) _then) =
      __$FreedomPaymentDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "pg_status") String? pgStatus,
      @JsonKey(name: "pg_payment_id") String? pgPaymentId,
      @JsonKey(name: "pg_redirect_url") String? pgRedirectUrl,
      @JsonKey(name: "pg_redirect_url_type") String? pgRedirectedUrlType,
      @JsonKey(name: "pg_salt") String? pgSalt,
      @JsonKey(name: "pg_sig") String? pg_sig});
}

/// @nodoc
class __$FreedomPaymentDTOCopyWithImpl<$Res>
    implements _$FreedomPaymentDTOCopyWith<$Res> {
  __$FreedomPaymentDTOCopyWithImpl(this._self, this._then);

  final _FreedomPaymentDTO _self;
  final $Res Function(_FreedomPaymentDTO) _then;

  /// Create a copy of FreedomPaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pgStatus = freezed,
    Object? pgPaymentId = freezed,
    Object? pgRedirectUrl = freezed,
    Object? pgRedirectedUrlType = freezed,
    Object? pgSalt = freezed,
    Object? pg_sig = freezed,
  }) {
    return _then(_FreedomPaymentDTO(
      pgStatus: freezed == pgStatus
          ? _self.pgStatus
          : pgStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      pgPaymentId: freezed == pgPaymentId
          ? _self.pgPaymentId
          : pgPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      pgRedirectUrl: freezed == pgRedirectUrl
          ? _self.pgRedirectUrl
          : pgRedirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pgRedirectedUrlType: freezed == pgRedirectedUrlType
          ? _self.pgRedirectedUrlType
          : pgRedirectedUrlType // ignore: cast_nullable_to_non_nullable
              as String?,
      pgSalt: freezed == pgSalt
          ? _self.pgSalt
          : pgSalt // ignore: cast_nullable_to_non_nullable
              as String?,
      pg_sig: freezed == pg_sig
          ? _self.pg_sig
          : pg_sig // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
