// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'namaz_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NamazDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NamazDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NamazDetailState()';
  }
}

/// @nodoc
class $NamazDetailStateCopyWith<$Res> {
  $NamazDetailStateCopyWith(
      NamazDetailState _, $Res Function(NamazDetailState) __);
}

/// @nodoc

class NamazDetailInitialPage implements NamazDetailState {
  const NamazDetailInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NamazDetailInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NamazDetailState.initial()';
  }
}

/// @nodoc

class NamazDetailLoadingState implements NamazDetailState {
  const NamazDetailLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NamazDetailLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NamazDetailState.loading()';
  }
}

/// @nodoc

class NamazDetailLoadedState implements NamazDetailState {
  const NamazDetailLoadedState({required final List<NamazDTO> namaz})
      : _namaz = namaz;

  final List<NamazDTO> _namaz;
  List<NamazDTO> get namaz {
    if (_namaz is EqualUnmodifiableListView) return _namaz;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_namaz);
  }

  /// Create a copy of NamazDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NamazDetailLoadedStateCopyWith<NamazDetailLoadedState> get copyWith =>
      _$NamazDetailLoadedStateCopyWithImpl<NamazDetailLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NamazDetailLoadedState &&
            const DeepCollectionEquality().equals(other._namaz, _namaz));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_namaz));

  @override
  String toString() {
    return 'NamazDetailState.loaded(namaz: $namaz)';
  }
}

/// @nodoc
abstract mixin class $NamazDetailLoadedStateCopyWith<$Res>
    implements $NamazDetailStateCopyWith<$Res> {
  factory $NamazDetailLoadedStateCopyWith(NamazDetailLoadedState value,
          $Res Function(NamazDetailLoadedState) _then) =
      _$NamazDetailLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<NamazDTO> namaz});
}

/// @nodoc
class _$NamazDetailLoadedStateCopyWithImpl<$Res>
    implements $NamazDetailLoadedStateCopyWith<$Res> {
  _$NamazDetailLoadedStateCopyWithImpl(this._self, this._then);

  final NamazDetailLoadedState _self;
  final $Res Function(NamazDetailLoadedState) _then;

  /// Create a copy of NamazDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? namaz = null,
  }) {
    return _then(NamazDetailLoadedState(
      namaz: null == namaz
          ? _self._namaz
          : namaz // ignore: cast_nullable_to_non_nullable
              as List<NamazDTO>,
    ));
  }
}

/// @nodoc

class NamazDetailErrorState implements NamazDetailState {
  const NamazDetailErrorState({required this.message});

  final String message;

  /// Create a copy of NamazDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NamazDetailErrorStateCopyWith<NamazDetailErrorState> get copyWith =>
      _$NamazDetailErrorStateCopyWithImpl<NamazDetailErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NamazDetailErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NamazDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NamazDetailErrorStateCopyWith<$Res>
    implements $NamazDetailStateCopyWith<$Res> {
  factory $NamazDetailErrorStateCopyWith(NamazDetailErrorState value,
          $Res Function(NamazDetailErrorState) _then) =
      _$NamazDetailErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NamazDetailErrorStateCopyWithImpl<$Res>
    implements $NamazDetailErrorStateCopyWith<$Res> {
  _$NamazDetailErrorStateCopyWithImpl(this._self, this._then);

  final NamazDetailErrorState _self;
  final $Res Function(NamazDetailErrorState) _then;

  /// Create a copy of NamazDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NamazDetailErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
