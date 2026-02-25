// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seminar_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeminarDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeminarDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarDetailState()';
  }
}

/// @nodoc
class $SeminarDetailStateCopyWith<$Res> {
  $SeminarDetailStateCopyWith(
      SeminarDetailState _, $Res Function(SeminarDetailState) __);
}

/// @nodoc

class SeminarDetailInitialPage implements SeminarDetailState {
  const SeminarDetailInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeminarDetailInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarDetailState.initial()';
  }
}

/// @nodoc

class SeminarDetailLoadingState implements SeminarDetailState {
  const SeminarDetailLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeminarDetailLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarDetailState.loading()';
  }
}

/// @nodoc

class SeminarDetailLoadedState implements SeminarDetailState {
  const SeminarDetailLoadedState({required this.res});

  final ResultHomeDTO res;

  /// Create a copy of SeminarDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeminarDetailLoadedStateCopyWith<SeminarDetailLoadedState> get copyWith =>
      _$SeminarDetailLoadedStateCopyWithImpl<SeminarDetailLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeminarDetailLoadedState &&
            (identical(other.res, res) || other.res == res));
  }

  @override
  int get hashCode => Object.hash(runtimeType, res);

  @override
  String toString() {
    return 'SeminarDetailState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $SeminarDetailLoadedStateCopyWith<$Res>
    implements $SeminarDetailStateCopyWith<$Res> {
  factory $SeminarDetailLoadedStateCopyWith(SeminarDetailLoadedState value,
          $Res Function(SeminarDetailLoadedState) _then) =
      _$SeminarDetailLoadedStateCopyWithImpl;
  @useResult
  $Res call({ResultHomeDTO res});

  $ResultHomeDTOCopyWith<$Res> get res;
}

/// @nodoc
class _$SeminarDetailLoadedStateCopyWithImpl<$Res>
    implements $SeminarDetailLoadedStateCopyWith<$Res> {
  _$SeminarDetailLoadedStateCopyWithImpl(this._self, this._then);

  final SeminarDetailLoadedState _self;
  final $Res Function(SeminarDetailLoadedState) _then;

  /// Create a copy of SeminarDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(SeminarDetailLoadedState(
      res: null == res
          ? _self.res
          : res // ignore: cast_nullable_to_non_nullable
              as ResultHomeDTO,
    ));
  }

  /// Create a copy of SeminarDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultHomeDTOCopyWith<$Res> get res {
    return $ResultHomeDTOCopyWith<$Res>(_self.res, (value) {
      return _then(_self.copyWith(res: value));
    });
  }
}

/// @nodoc

class SeminarDetailErrorState implements SeminarDetailState {
  const SeminarDetailErrorState({required this.message});

  final String message;

  /// Create a copy of SeminarDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeminarDetailErrorStateCopyWith<SeminarDetailErrorState> get copyWith =>
      _$SeminarDetailErrorStateCopyWithImpl<SeminarDetailErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeminarDetailErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SeminarDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SeminarDetailErrorStateCopyWith<$Res>
    implements $SeminarDetailStateCopyWith<$Res> {
  factory $SeminarDetailErrorStateCopyWith(SeminarDetailErrorState value,
          $Res Function(SeminarDetailErrorState) _then) =
      _$SeminarDetailErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SeminarDetailErrorStateCopyWithImpl<$Res>
    implements $SeminarDetailErrorStateCopyWith<$Res> {
  _$SeminarDetailErrorStateCopyWithImpl(this._self, this._then);

  final SeminarDetailErrorState _self;
  final $Res Function(SeminarDetailErrorState) _then;

  /// Create a copy of SeminarDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SeminarDetailErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
