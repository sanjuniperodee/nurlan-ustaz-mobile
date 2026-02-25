// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ablutions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AblutionsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AblutionsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AblutionsState()';
  }
}

/// @nodoc
class $AblutionsStateCopyWith<$Res> {
  $AblutionsStateCopyWith(AblutionsState _, $Res Function(AblutionsState) __);
}

/// @nodoc

class AblutionsInitialPage implements AblutionsState {
  const AblutionsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AblutionsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AblutionsState.initial()';
  }
}

/// @nodoc

class AblutionsLoadingState implements AblutionsState {
  const AblutionsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AblutionsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AblutionsState.loading()';
  }
}

/// @nodoc

class AblutionsLoadedState implements AblutionsState {
  const AblutionsLoadedState(
      {required final List<NamazDTO> abl, required final List<PillarsDTO> pre})
      : _abl = abl,
        _pre = pre;

  final List<NamazDTO> _abl;
  List<NamazDTO> get abl {
    if (_abl is EqualUnmodifiableListView) return _abl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abl);
  }

  final List<PillarsDTO> _pre;
  List<PillarsDTO> get pre {
    if (_pre is EqualUnmodifiableListView) return _pre;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pre);
  }

  /// Create a copy of AblutionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AblutionsLoadedStateCopyWith<AblutionsLoadedState> get copyWith =>
      _$AblutionsLoadedStateCopyWithImpl<AblutionsLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AblutionsLoadedState &&
            const DeepCollectionEquality().equals(other._abl, _abl) &&
            const DeepCollectionEquality().equals(other._pre, _pre));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_abl),
      const DeepCollectionEquality().hash(_pre));

  @override
  String toString() {
    return 'AblutionsState.loaded(abl: $abl, pre: $pre)';
  }
}

/// @nodoc
abstract mixin class $AblutionsLoadedStateCopyWith<$Res>
    implements $AblutionsStateCopyWith<$Res> {
  factory $AblutionsLoadedStateCopyWith(AblutionsLoadedState value,
          $Res Function(AblutionsLoadedState) _then) =
      _$AblutionsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<NamazDTO> abl, List<PillarsDTO> pre});
}

/// @nodoc
class _$AblutionsLoadedStateCopyWithImpl<$Res>
    implements $AblutionsLoadedStateCopyWith<$Res> {
  _$AblutionsLoadedStateCopyWithImpl(this._self, this._then);

  final AblutionsLoadedState _self;
  final $Res Function(AblutionsLoadedState) _then;

  /// Create a copy of AblutionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? abl = null,
    Object? pre = null,
  }) {
    return _then(AblutionsLoadedState(
      abl: null == abl
          ? _self._abl
          : abl // ignore: cast_nullable_to_non_nullable
              as List<NamazDTO>,
      pre: null == pre
          ? _self._pre
          : pre // ignore: cast_nullable_to_non_nullable
              as List<PillarsDTO>,
    ));
  }
}

/// @nodoc

class AblutionsErrorState implements AblutionsState {
  const AblutionsErrorState({required this.message});

  final String message;

  /// Create a copy of AblutionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AblutionsErrorStateCopyWith<AblutionsErrorState> get copyWith =>
      _$AblutionsErrorStateCopyWithImpl<AblutionsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AblutionsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AblutionsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AblutionsErrorStateCopyWith<$Res>
    implements $AblutionsStateCopyWith<$Res> {
  factory $AblutionsErrorStateCopyWith(
          AblutionsErrorState value, $Res Function(AblutionsErrorState) _then) =
      _$AblutionsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AblutionsErrorStateCopyWithImpl<$Res>
    implements $AblutionsErrorStateCopyWith<$Res> {
  _$AblutionsErrorStateCopyWithImpl(this._self, this._then);

  final AblutionsErrorState _self;
  final $Res Function(AblutionsErrorState) _then;

  /// Create a copy of AblutionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AblutionsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
