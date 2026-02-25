// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityDTO {
  @JsonKey(name: "name")
  String? get name;
  @JsonKey(name: "latitude")
  double? get latitude;
  @JsonKey(name: "longitude")
  double? get longitude;

  /// Create a copy of CityDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CityDTOCopyWith<CityDTO> get copyWith =>
      _$CityDTOCopyWithImpl<CityDTO>(this as CityDTO, _$identity);

  /// Serializes this CityDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CityDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude);

  @override
  String toString() {
    return 'CityDTO(name: $name, latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $CityDTOCopyWith<$Res> {
  factory $CityDTOCopyWith(CityDTO value, $Res Function(CityDTO) _then) =
      _$CityDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude});
}

/// @nodoc
class _$CityDTOCopyWithImpl<$Res> implements $CityDTOCopyWith<$Res> {
  _$CityDTOCopyWithImpl(this._self, this._then);

  final CityDTO _self;
  final $Res Function(CityDTO) _then;

  /// Create a copy of CityDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CityDTO implements CityDTO {
  const _CityDTO(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude});
  factory _CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "latitude")
  final double? latitude;
  @override
  @JsonKey(name: "longitude")
  final double? longitude;

  /// Create a copy of CityDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CityDTOCopyWith<_CityDTO> get copyWith =>
      __$CityDTOCopyWithImpl<_CityDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CityDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CityDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude);

  @override
  String toString() {
    return 'CityDTO(name: $name, latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$CityDTOCopyWith<$Res> implements $CityDTOCopyWith<$Res> {
  factory _$CityDTOCopyWith(_CityDTO value, $Res Function(_CityDTO) _then) =
      __$CityDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude});
}

/// @nodoc
class __$CityDTOCopyWithImpl<$Res> implements _$CityDTOCopyWith<$Res> {
  __$CityDTOCopyWithImpl(this._self, this._then);

  final _CityDTO _self;
  final $Res Function(_CityDTO) _then;

  /// Create a copy of CityDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_CityDTO(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
