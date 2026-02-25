// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppVersionsModel {
  @JsonKey(name: "device_type")
  String? get deviceType;
  @JsonKey(name: "version")
  String? get version;

  /// Create a copy of AppVersionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppVersionsModelCopyWith<AppVersionsModel> get copyWith =>
      _$AppVersionsModelCopyWithImpl<AppVersionsModel>(
          this as AppVersionsModel, _$identity);

  /// Serializes this AppVersionsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppVersionsModel &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceType, version);

  @override
  String toString() {
    return 'AppVersionsModel(deviceType: $deviceType, version: $version)';
  }
}

/// @nodoc
abstract mixin class $AppVersionsModelCopyWith<$Res> {
  factory $AppVersionsModelCopyWith(
          AppVersionsModel value, $Res Function(AppVersionsModel) _then) =
      _$AppVersionsModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "device_type") String? deviceType,
      @JsonKey(name: "version") String? version});
}

/// @nodoc
class _$AppVersionsModelCopyWithImpl<$Res>
    implements $AppVersionsModelCopyWith<$Res> {
  _$AppVersionsModelCopyWithImpl(this._self, this._then);

  final AppVersionsModel _self;
  final $Res Function(AppVersionsModel) _then;

  /// Create a copy of AppVersionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceType = freezed,
    Object? version = freezed,
  }) {
    return _then(_self.copyWith(
      deviceType: freezed == deviceType
          ? _self.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppVersionsModel implements AppVersionsModel {
  const _AppVersionsModel(
      {@JsonKey(name: "device_type") this.deviceType,
      @JsonKey(name: "version") this.version});
  factory _AppVersionsModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionsModelFromJson(json);

  @override
  @JsonKey(name: "device_type")
  final String? deviceType;
  @override
  @JsonKey(name: "version")
  final String? version;

  /// Create a copy of AppVersionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppVersionsModelCopyWith<_AppVersionsModel> get copyWith =>
      __$AppVersionsModelCopyWithImpl<_AppVersionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppVersionsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppVersionsModel &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceType, version);

  @override
  String toString() {
    return 'AppVersionsModel(deviceType: $deviceType, version: $version)';
  }
}

/// @nodoc
abstract mixin class _$AppVersionsModelCopyWith<$Res>
    implements $AppVersionsModelCopyWith<$Res> {
  factory _$AppVersionsModelCopyWith(
          _AppVersionsModel value, $Res Function(_AppVersionsModel) _then) =
      __$AppVersionsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "device_type") String? deviceType,
      @JsonKey(name: "version") String? version});
}

/// @nodoc
class __$AppVersionsModelCopyWithImpl<$Res>
    implements _$AppVersionsModelCopyWith<$Res> {
  __$AppVersionsModelCopyWithImpl(this._self, this._then);

  final _AppVersionsModel _self;
  final $Res Function(_AppVersionsModel) _then;

  /// Create a copy of AppVersionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? deviceType = freezed,
    Object? version = freezed,
  }) {
    return _then(_AppVersionsModel(
      deviceType: freezed == deviceType
          ? _self.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
