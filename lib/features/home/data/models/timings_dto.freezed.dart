// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimingsDTO {
  @JsonKey(name: "Fajr")
  String? get fajr;
  @JsonKey(name: "Sunrise")
  String? get sunrise;
  @JsonKey(name: "Dhuhr")
  String? get dhuhr;
  @JsonKey(name: "Asr")
  String? get asr;
  @JsonKey(name: "Maghrib")
  String? get maghrib;
  @JsonKey(name: "Isha")
  String? get isha;

  /// Create a copy of TimingsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimingsDTOCopyWith<TimingsDTO> get copyWith =>
      _$TimingsDTOCopyWithImpl<TimingsDTO>(this as TimingsDTO, _$identity);

  /// Serializes this TimingsDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimingsDTO &&
            (identical(other.fajr, fajr) || other.fajr == fajr) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.dhuhr, dhuhr) || other.dhuhr == dhuhr) &&
            (identical(other.asr, asr) || other.asr == asr) &&
            (identical(other.maghrib, maghrib) || other.maghrib == maghrib) &&
            (identical(other.isha, isha) || other.isha == isha));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fajr, sunrise, dhuhr, asr, maghrib, isha);

  @override
  String toString() {
    return 'TimingsDTO(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, maghrib: $maghrib, isha: $isha)';
  }
}

/// @nodoc
abstract mixin class $TimingsDTOCopyWith<$Res> {
  factory $TimingsDTOCopyWith(
          TimingsDTO value, $Res Function(TimingsDTO) _then) =
      _$TimingsDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Fajr") String? fajr,
      @JsonKey(name: "Sunrise") String? sunrise,
      @JsonKey(name: "Dhuhr") String? dhuhr,
      @JsonKey(name: "Asr") String? asr,
      @JsonKey(name: "Maghrib") String? maghrib,
      @JsonKey(name: "Isha") String? isha});
}

/// @nodoc
class _$TimingsDTOCopyWithImpl<$Res> implements $TimingsDTOCopyWith<$Res> {
  _$TimingsDTOCopyWithImpl(this._self, this._then);

  final TimingsDTO _self;
  final $Res Function(TimingsDTO) _then;

  /// Create a copy of TimingsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fajr = freezed,
    Object? sunrise = freezed,
    Object? dhuhr = freezed,
    Object? asr = freezed,
    Object? maghrib = freezed,
    Object? isha = freezed,
  }) {
    return _then(_self.copyWith(
      fajr: freezed == fajr
          ? _self.fajr
          : fajr // ignore: cast_nullable_to_non_nullable
              as String?,
      sunrise: freezed == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String?,
      dhuhr: freezed == dhuhr
          ? _self.dhuhr
          : dhuhr // ignore: cast_nullable_to_non_nullable
              as String?,
      asr: freezed == asr
          ? _self.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as String?,
      maghrib: freezed == maghrib
          ? _self.maghrib
          : maghrib // ignore: cast_nullable_to_non_nullable
              as String?,
      isha: freezed == isha
          ? _self.isha
          : isha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TimingsDTO implements TimingsDTO {
  const _TimingsDTO(
      {@JsonKey(name: "Fajr") this.fajr,
      @JsonKey(name: "Sunrise") this.sunrise,
      @JsonKey(name: "Dhuhr") this.dhuhr,
      @JsonKey(name: "Asr") this.asr,
      @JsonKey(name: "Maghrib") this.maghrib,
      @JsonKey(name: "Isha") this.isha});
  factory _TimingsDTO.fromJson(Map<String, dynamic> json) =>
      _$TimingsDTOFromJson(json);

  @override
  @JsonKey(name: "Fajr")
  final String? fajr;
  @override
  @JsonKey(name: "Sunrise")
  final String? sunrise;
  @override
  @JsonKey(name: "Dhuhr")
  final String? dhuhr;
  @override
  @JsonKey(name: "Asr")
  final String? asr;
  @override
  @JsonKey(name: "Maghrib")
  final String? maghrib;
  @override
  @JsonKey(name: "Isha")
  final String? isha;

  /// Create a copy of TimingsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimingsDTOCopyWith<_TimingsDTO> get copyWith =>
      __$TimingsDTOCopyWithImpl<_TimingsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimingsDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimingsDTO &&
            (identical(other.fajr, fajr) || other.fajr == fajr) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.dhuhr, dhuhr) || other.dhuhr == dhuhr) &&
            (identical(other.asr, asr) || other.asr == asr) &&
            (identical(other.maghrib, maghrib) || other.maghrib == maghrib) &&
            (identical(other.isha, isha) || other.isha == isha));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fajr, sunrise, dhuhr, asr, maghrib, isha);

  @override
  String toString() {
    return 'TimingsDTO(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, maghrib: $maghrib, isha: $isha)';
  }
}

/// @nodoc
abstract mixin class _$TimingsDTOCopyWith<$Res>
    implements $TimingsDTOCopyWith<$Res> {
  factory _$TimingsDTOCopyWith(
          _TimingsDTO value, $Res Function(_TimingsDTO) _then) =
      __$TimingsDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Fajr") String? fajr,
      @JsonKey(name: "Sunrise") String? sunrise,
      @JsonKey(name: "Dhuhr") String? dhuhr,
      @JsonKey(name: "Asr") String? asr,
      @JsonKey(name: "Maghrib") String? maghrib,
      @JsonKey(name: "Isha") String? isha});
}

/// @nodoc
class __$TimingsDTOCopyWithImpl<$Res> implements _$TimingsDTOCopyWith<$Res> {
  __$TimingsDTOCopyWithImpl(this._self, this._then);

  final _TimingsDTO _self;
  final $Res Function(_TimingsDTO) _then;

  /// Create a copy of TimingsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fajr = freezed,
    Object? sunrise = freezed,
    Object? dhuhr = freezed,
    Object? asr = freezed,
    Object? maghrib = freezed,
    Object? isha = freezed,
  }) {
    return _then(_TimingsDTO(
      fajr: freezed == fajr
          ? _self.fajr
          : fajr // ignore: cast_nullable_to_non_nullable
              as String?,
      sunrise: freezed == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String?,
      dhuhr: freezed == dhuhr
          ? _self.dhuhr
          : dhuhr // ignore: cast_nullable_to_non_nullable
              as String?,
      asr: freezed == asr
          ? _self.asr
          : asr // ignore: cast_nullable_to_non_nullable
              as String?,
      maghrib: freezed == maghrib
          ? _self.maghrib
          : maghrib // ignore: cast_nullable_to_non_nullable
              as String?,
      isha: freezed == isha
          ? _self.isha
          : isha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
