// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sura_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuraDTO {
  int? get count;
  String? get next;
  String? get previous;
  List<ResultTeachingDTO>? get results;

  /// Create a copy of SuraDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuraDTOCopyWith<SuraDTO> get copyWith =>
      _$SuraDTOCopyWithImpl<SuraDTO>(this as SuraDTO, _$identity);

  /// Serializes this SuraDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuraDTO &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(results));

  @override
  String toString() {
    return 'SuraDTO(count: $count, next: $next, previous: $previous, results: $results)';
  }
}

/// @nodoc
abstract mixin class $SuraDTOCopyWith<$Res> {
  factory $SuraDTOCopyWith(SuraDTO value, $Res Function(SuraDTO) _then) =
      _$SuraDTOCopyWithImpl;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<ResultTeachingDTO>? results});
}

/// @nodoc
class _$SuraDTOCopyWithImpl<$Res> implements $SuraDTOCopyWith<$Res> {
  _$SuraDTOCopyWithImpl(this._self, this._then);

  final SuraDTO _self;
  final $Res Function(SuraDTO) _then;

  /// Create a copy of SuraDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_self.copyWith(
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _self.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuraDTO implements SuraDTO {
  const _SuraDTO(
      {this.count,
      this.next,
      this.previous,
      final List<ResultTeachingDTO>? results})
      : _results = results;
  factory _SuraDTO.fromJson(Map<String, dynamic> json) =>
      _$SuraDTOFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<ResultTeachingDTO>? _results;
  @override
  List<ResultTeachingDTO>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of SuraDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuraDTOCopyWith<_SuraDTO> get copyWith =>
      __$SuraDTOCopyWithImpl<_SuraDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuraDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuraDTO &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @override
  String toString() {
    return 'SuraDTO(count: $count, next: $next, previous: $previous, results: $results)';
  }
}

/// @nodoc
abstract mixin class _$SuraDTOCopyWith<$Res> implements $SuraDTOCopyWith<$Res> {
  factory _$SuraDTOCopyWith(_SuraDTO value, $Res Function(_SuraDTO) _then) =
      __$SuraDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<ResultTeachingDTO>? results});
}

/// @nodoc
class __$SuraDTOCopyWithImpl<$Res> implements _$SuraDTOCopyWith<$Res> {
  __$SuraDTOCopyWithImpl(this._self, this._then);

  final _SuraDTO _self;
  final $Res Function(_SuraDTO) _then;

  /// Create a copy of SuraDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_SuraDTO(
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _self.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>?,
    ));
  }
}

// dart format on
