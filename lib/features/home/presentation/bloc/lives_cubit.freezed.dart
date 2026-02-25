// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lives_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LivesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LivesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivesState()';
  }
}

/// @nodoc
class $LivesStateCopyWith<$Res> {
  $LivesStateCopyWith(LivesState _, $Res Function(LivesState) __);
}

/// @nodoc

class LivesInitialPage implements LivesState {
  const LivesInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LivesInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivesState.initial()';
  }
}

/// @nodoc

class LivesLoadingState implements LivesState {
  const LivesLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LivesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivesState.loading()';
  }
}

/// @nodoc

class LivesLoadingMoreState implements LivesState {
  const LivesLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LivesLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LivesState.loadingMore()';
  }
}

/// @nodoc

class LivesLoadedState implements LivesState {
  const LivesLoadedState({required final List<ResultHomeDTO> lives})
      : _lives = lives;

  final List<ResultHomeDTO> _lives;
  List<ResultHomeDTO> get lives {
    if (_lives is EqualUnmodifiableListView) return _lives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lives);
  }

  /// Create a copy of LivesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivesLoadedStateCopyWith<LivesLoadedState> get copyWith =>
      _$LivesLoadedStateCopyWithImpl<LivesLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivesLoadedState &&
            const DeepCollectionEquality().equals(other._lives, _lives));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lives));

  @override
  String toString() {
    return 'LivesState.loaded(lives: $lives)';
  }
}

/// @nodoc
abstract mixin class $LivesLoadedStateCopyWith<$Res>
    implements $LivesStateCopyWith<$Res> {
  factory $LivesLoadedStateCopyWith(
          LivesLoadedState value, $Res Function(LivesLoadedState) _then) =
      _$LivesLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> lives});
}

/// @nodoc
class _$LivesLoadedStateCopyWithImpl<$Res>
    implements $LivesLoadedStateCopyWith<$Res> {
  _$LivesLoadedStateCopyWithImpl(this._self, this._then);

  final LivesLoadedState _self;
  final $Res Function(LivesLoadedState) _then;

  /// Create a copy of LivesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lives = null,
  }) {
    return _then(LivesLoadedState(
      lives: null == lives
          ? _self._lives
          : lives // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class LivesErrorState implements LivesState {
  const LivesErrorState({required this.message});

  final String message;

  /// Create a copy of LivesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LivesErrorStateCopyWith<LivesErrorState> get copyWith =>
      _$LivesErrorStateCopyWithImpl<LivesErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LivesErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LivesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LivesErrorStateCopyWith<$Res>
    implements $LivesStateCopyWith<$Res> {
  factory $LivesErrorStateCopyWith(
          LivesErrorState value, $Res Function(LivesErrorState) _then) =
      _$LivesErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LivesErrorStateCopyWithImpl<$Res>
    implements $LivesErrorStateCopyWith<$Res> {
  _$LivesErrorStateCopyWithImpl(this._self, this._then);

  final LivesErrorState _self;
  final $Res Function(LivesErrorState) _then;

  /// Create a copy of LivesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LivesErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
