// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sura_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuraDTO _$SuraDTOFromJson(Map<String, dynamic> json) {
  return _SuraDTO.fromJson(json);
}

/// @nodoc
mixin _$SuraDTO {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ResultDTO>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuraDTOCopyWith<SuraDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuraDTOCopyWith<$Res> {
  factory $SuraDTOCopyWith(SuraDTO value, $Res Function(SuraDTO) then) =
      _$SuraDTOCopyWithImpl<$Res, SuraDTO>;
  @useResult
  $Res call(
      {int? count, String? next, String? previous, List<ResultDTO>? results});
}

/// @nodoc
class _$SuraDTOCopyWithImpl<$Res, $Val extends SuraDTO>
    implements $SuraDTOCopyWith<$Res> {
  _$SuraDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuraDTOCopyWith<$Res> implements $SuraDTOCopyWith<$Res> {
  factory _$$_SuraDTOCopyWith(
          _$_SuraDTO value, $Res Function(_$_SuraDTO) then) =
      __$$_SuraDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count, String? next, String? previous, List<ResultDTO>? results});
}

/// @nodoc
class __$$_SuraDTOCopyWithImpl<$Res>
    extends _$SuraDTOCopyWithImpl<$Res, _$_SuraDTO>
    implements _$$_SuraDTOCopyWith<$Res> {
  __$$_SuraDTOCopyWithImpl(_$_SuraDTO _value, $Res Function(_$_SuraDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_SuraDTO(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuraDTO implements _SuraDTO {
  const _$_SuraDTO(
      {this.count, this.next, this.previous, final List<ResultDTO>? results})
      : _results = results;

  factory _$_SuraDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SuraDTOFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<ResultDTO>? _results;
  @override
  List<ResultDTO>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SuraDTO(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuraDTO &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuraDTOCopyWith<_$_SuraDTO> get copyWith =>
      __$$_SuraDTOCopyWithImpl<_$_SuraDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SuraDTOToJson(
      this,
    );
  }
}

abstract class _SuraDTO implements SuraDTO {
  const factory _SuraDTO(
      {final int? count,
      final String? next,
      final String? previous,
      final List<ResultDTO>? results}) = _$_SuraDTO;

  factory _SuraDTO.fromJson(Map<String, dynamic> json) = _$_SuraDTO.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ResultDTO>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_SuraDTOCopyWith<_$_SuraDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
