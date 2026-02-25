// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geonames_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeonamesDTO {
  String? get lng;
  String? get lat;
  String? get countryName;
  String? get name;
  String? get adminName1;

  /// Create a copy of GeonamesDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeonamesDTOCopyWith<GeonamesDTO> get copyWith =>
      _$GeonamesDTOCopyWithImpl<GeonamesDTO>(this as GeonamesDTO, _$identity);

  /// Serializes this GeonamesDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeonamesDTO &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adminName1, adminName1) ||
                other.adminName1 == adminName1));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lng, lat, countryName, name, adminName1);

  @override
  String toString() {
    return 'GeonamesDTO(lng: $lng, lat: $lat, countryName: $countryName, name: $name, adminName1: $adminName1)';
  }
}

/// @nodoc
abstract mixin class $GeonamesDTOCopyWith<$Res> {
  factory $GeonamesDTOCopyWith(
          GeonamesDTO value, $Res Function(GeonamesDTO) _then) =
      _$GeonamesDTOCopyWithImpl;
  @useResult
  $Res call(
      {String? lng,
      String? lat,
      String? countryName,
      String? name,
      String? adminName1});
}

/// @nodoc
class _$GeonamesDTOCopyWithImpl<$Res> implements $GeonamesDTOCopyWith<$Res> {
  _$GeonamesDTOCopyWithImpl(this._self, this._then);

  final GeonamesDTO _self;
  final $Res Function(GeonamesDTO) _then;

  /// Create a copy of GeonamesDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lng = freezed,
    Object? lat = freezed,
    Object? countryName = freezed,
    Object? name = freezed,
    Object? adminName1 = freezed,
  }) {
    return _then(_self.copyWith(
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      adminName1: freezed == adminName1
          ? _self.adminName1
          : adminName1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GeonamesDTO implements GeonamesDTO {
  const _GeonamesDTO(
      {this.lng, this.lat, this.countryName, this.name, this.adminName1});
  factory _GeonamesDTO.fromJson(Map<String, dynamic> json) =>
      _$GeonamesDTOFromJson(json);

  @override
  final String? lng;
  @override
  final String? lat;
  @override
  final String? countryName;
  @override
  final String? name;
  @override
  final String? adminName1;

  /// Create a copy of GeonamesDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeonamesDTOCopyWith<_GeonamesDTO> get copyWith =>
      __$GeonamesDTOCopyWithImpl<_GeonamesDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeonamesDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GeonamesDTO &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adminName1, adminName1) ||
                other.adminName1 == adminName1));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lng, lat, countryName, name, adminName1);

  @override
  String toString() {
    return 'GeonamesDTO(lng: $lng, lat: $lat, countryName: $countryName, name: $name, adminName1: $adminName1)';
  }
}

/// @nodoc
abstract mixin class _$GeonamesDTOCopyWith<$Res>
    implements $GeonamesDTOCopyWith<$Res> {
  factory _$GeonamesDTOCopyWith(
          _GeonamesDTO value, $Res Function(_GeonamesDTO) _then) =
      __$GeonamesDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? lng,
      String? lat,
      String? countryName,
      String? name,
      String? adminName1});
}

/// @nodoc
class __$GeonamesDTOCopyWithImpl<$Res> implements _$GeonamesDTOCopyWith<$Res> {
  __$GeonamesDTOCopyWithImpl(this._self, this._then);

  final _GeonamesDTO _self;
  final $Res Function(_GeonamesDTO) _then;

  /// Create a copy of GeonamesDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lng = freezed,
    Object? lat = freezed,
    Object? countryName = freezed,
    Object? name = freezed,
    Object? adminName1 = freezed,
  }) {
    return _then(_GeonamesDTO(
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      adminName1: freezed == adminName1
          ? _self.adminName1
          : adminName1 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
