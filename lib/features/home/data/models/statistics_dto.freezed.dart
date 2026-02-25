// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatisticsDTO {
  int get id;
  String? get title;
  String? get value;

  /// Create a copy of StatisticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatisticsDTOCopyWith<StatisticsDTO> get copyWith =>
      _$StatisticsDTOCopyWithImpl<StatisticsDTO>(
          this as StatisticsDTO, _$identity);

  /// Serializes this StatisticsDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatisticsDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, value);

  @override
  String toString() {
    return 'StatisticsDTO(id: $id, title: $title, value: $value)';
  }
}

/// @nodoc
abstract mixin class $StatisticsDTOCopyWith<$Res> {
  factory $StatisticsDTOCopyWith(
          StatisticsDTO value, $Res Function(StatisticsDTO) _then) =
      _$StatisticsDTOCopyWithImpl;
  @useResult
  $Res call({int id, String? title, String? value});
}

/// @nodoc
class _$StatisticsDTOCopyWithImpl<$Res>
    implements $StatisticsDTOCopyWith<$Res> {
  _$StatisticsDTOCopyWithImpl(this._self, this._then);

  final StatisticsDTO _self;
  final $Res Function(StatisticsDTO) _then;

  /// Create a copy of StatisticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StatisticsDTO implements StatisticsDTO {
  const _StatisticsDTO({required this.id, this.title, this.value});
  factory _StatisticsDTO.fromJson(Map<String, dynamic> json) =>
      _$StatisticsDTOFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? value;

  /// Create a copy of StatisticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatisticsDTOCopyWith<_StatisticsDTO> get copyWith =>
      __$StatisticsDTOCopyWithImpl<_StatisticsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatisticsDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatisticsDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, value);

  @override
  String toString() {
    return 'StatisticsDTO(id: $id, title: $title, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$StatisticsDTOCopyWith<$Res>
    implements $StatisticsDTOCopyWith<$Res> {
  factory _$StatisticsDTOCopyWith(
          _StatisticsDTO value, $Res Function(_StatisticsDTO) _then) =
      __$StatisticsDTOCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String? title, String? value});
}

/// @nodoc
class __$StatisticsDTOCopyWithImpl<$Res>
    implements _$StatisticsDTOCopyWith<$Res> {
  __$StatisticsDTOCopyWithImpl(this._self, this._then);

  final _StatisticsDTO _self;
  final $Res Function(_StatisticsDTO) _then;

  /// Create a copy of StatisticsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(_StatisticsDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
