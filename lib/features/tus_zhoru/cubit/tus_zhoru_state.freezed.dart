// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tus_zhoru_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TusZhoruState {
  List<TusZhoruModel> get tusZhoruModels => throw _privateConstructorUsedError;
  int get initialIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TusZhoruModel> tusZhoruModels, int initialIndex)
        main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TusZhoruModel> tusZhoruModels, int initialIndex)?
        main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TusZhoruModel> tusZhoruModels, int initialIndex)?
        main,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TusZhoruMain value) main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TusZhoruMain value)? main,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TusZhoruMain value)? main,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TusZhoruStateCopyWith<TusZhoruState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TusZhoruStateCopyWith<$Res> {
  factory $TusZhoruStateCopyWith(
          TusZhoruState value, $Res Function(TusZhoruState) then) =
      _$TusZhoruStateCopyWithImpl<$Res, TusZhoruState>;
  @useResult
  $Res call({List<TusZhoruModel> tusZhoruModels, int initialIndex});
}

/// @nodoc
class _$TusZhoruStateCopyWithImpl<$Res, $Val extends TusZhoruState>
    implements $TusZhoruStateCopyWith<$Res> {
  _$TusZhoruStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tusZhoruModels = null,
    Object? initialIndex = null,
  }) {
    return _then(_value.copyWith(
      tusZhoruModels: null == tusZhoruModels
          ? _value.tusZhoruModels
          : tusZhoruModels // ignore: cast_nullable_to_non_nullable
              as List<TusZhoruModel>,
      initialIndex: null == initialIndex
          ? _value.initialIndex
          : initialIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TusZhoruMainCopyWith<$Res>
    implements $TusZhoruStateCopyWith<$Res> {
  factory _$$TusZhoruMainCopyWith(
          _$TusZhoruMain value, $Res Function(_$TusZhoruMain) then) =
      __$$TusZhoruMainCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TusZhoruModel> tusZhoruModels, int initialIndex});
}

/// @nodoc
class __$$TusZhoruMainCopyWithImpl<$Res>
    extends _$TusZhoruStateCopyWithImpl<$Res, _$TusZhoruMain>
    implements _$$TusZhoruMainCopyWith<$Res> {
  __$$TusZhoruMainCopyWithImpl(
      _$TusZhoruMain _value, $Res Function(_$TusZhoruMain) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tusZhoruModels = null,
    Object? initialIndex = null,
  }) {
    return _then(_$TusZhoruMain(
      tusZhoruModels: null == tusZhoruModels
          ? _value._tusZhoruModels
          : tusZhoruModels // ignore: cast_nullable_to_non_nullable
              as List<TusZhoruModel>,
      initialIndex: null == initialIndex
          ? _value.initialIndex
          : initialIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TusZhoruMain implements TusZhoruMain {
  const _$TusZhoruMain(
      {final List<TusZhoruModel> tusZhoruModels = const [],
      this.initialIndex = 0})
      : _tusZhoruModels = tusZhoruModels;

  final List<TusZhoruModel> _tusZhoruModels;
  @override
  @JsonKey()
  List<TusZhoruModel> get tusZhoruModels {
    if (_tusZhoruModels is EqualUnmodifiableListView) return _tusZhoruModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tusZhoruModels);
  }

  @override
  @JsonKey()
  final int initialIndex;

  @override
  String toString() {
    return 'TusZhoruState.main(tusZhoruModels: $tusZhoruModels, initialIndex: $initialIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TusZhoruMain &&
            const DeepCollectionEquality()
                .equals(other._tusZhoruModels, _tusZhoruModels) &&
            (identical(other.initialIndex, initialIndex) ||
                other.initialIndex == initialIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tusZhoruModels), initialIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TusZhoruMainCopyWith<_$TusZhoruMain> get copyWith =>
      __$$TusZhoruMainCopyWithImpl<_$TusZhoruMain>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<TusZhoruModel> tusZhoruModels, int initialIndex)
        main,
  }) {
    return main(tusZhoruModels, initialIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<TusZhoruModel> tusZhoruModels, int initialIndex)?
        main,
  }) {
    return main?.call(tusZhoruModels, initialIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TusZhoruModel> tusZhoruModels, int initialIndex)?
        main,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(tusZhoruModels, initialIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TusZhoruMain value) main,
  }) {
    return main(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TusZhoruMain value)? main,
  }) {
    return main?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TusZhoruMain value)? main,
    required TResult orElse(),
  }) {
    if (main != null) {
      return main(this);
    }
    return orElse();
  }
}

abstract class TusZhoruMain implements TusZhoruState {
  const factory TusZhoruMain(
      {final List<TusZhoruModel> tusZhoruModels,
      final int initialIndex}) = _$TusZhoruMain;

  @override
  List<TusZhoruModel> get tusZhoruModels;
  @override
  int get initialIndex;
  @override
  @JsonKey(ignore: true)
  _$$TusZhoruMainCopyWith<_$TusZhoruMain> get copyWith =>
      throw _privateConstructorUsedError;
}
