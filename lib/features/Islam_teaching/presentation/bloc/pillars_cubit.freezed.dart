// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pillars_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PillarsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PillarsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PillarsState()';
  }
}

/// @nodoc
class $PillarsStateCopyWith<$Res> {
  $PillarsStateCopyWith(PillarsState _, $Res Function(PillarsState) __);
}

/// @nodoc

class PillarsInitialPage implements PillarsState {
  const PillarsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PillarsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PillarsState.initial()';
  }
}

/// @nodoc

class PillarsLoadingState implements PillarsState {
  const PillarsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PillarsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PillarsState.loading()';
  }
}

/// @nodoc

class PillarsLoadedState implements PillarsState {
  const PillarsLoadedState({required final List<PillarsDTO> pillars})
      : _pillars = pillars;

  final List<PillarsDTO> _pillars;
  List<PillarsDTO> get pillars {
    if (_pillars is EqualUnmodifiableListView) return _pillars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pillars);
  }

  /// Create a copy of PillarsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PillarsLoadedStateCopyWith<PillarsLoadedState> get copyWith =>
      _$PillarsLoadedStateCopyWithImpl<PillarsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PillarsLoadedState &&
            const DeepCollectionEquality().equals(other._pillars, _pillars));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pillars));

  @override
  String toString() {
    return 'PillarsState.loaded(pillars: $pillars)';
  }
}

/// @nodoc
abstract mixin class $PillarsLoadedStateCopyWith<$Res>
    implements $PillarsStateCopyWith<$Res> {
  factory $PillarsLoadedStateCopyWith(
          PillarsLoadedState value, $Res Function(PillarsLoadedState) _then) =
      _$PillarsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<PillarsDTO> pillars});
}

/// @nodoc
class _$PillarsLoadedStateCopyWithImpl<$Res>
    implements $PillarsLoadedStateCopyWith<$Res> {
  _$PillarsLoadedStateCopyWithImpl(this._self, this._then);

  final PillarsLoadedState _self;
  final $Res Function(PillarsLoadedState) _then;

  /// Create a copy of PillarsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pillars = null,
  }) {
    return _then(PillarsLoadedState(
      pillars: null == pillars
          ? _self._pillars
          : pillars // ignore: cast_nullable_to_non_nullable
              as List<PillarsDTO>,
    ));
  }
}

/// @nodoc

class PillarsErrorState implements PillarsState {
  const PillarsErrorState({required this.message});

  final String message;

  /// Create a copy of PillarsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PillarsErrorStateCopyWith<PillarsErrorState> get copyWith =>
      _$PillarsErrorStateCopyWithImpl<PillarsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PillarsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PillarsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PillarsErrorStateCopyWith<$Res>
    implements $PillarsStateCopyWith<$Res> {
  factory $PillarsErrorStateCopyWith(
          PillarsErrorState value, $Res Function(PillarsErrorState) _then) =
      _$PillarsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PillarsErrorStateCopyWithImpl<$Res>
    implements $PillarsErrorStateCopyWith<$Res> {
  _$PillarsErrorStateCopyWithImpl(this._self, this._then);

  final PillarsErrorState _self;
  final $Res Function(PillarsErrorState) _then;

  /// Create a copy of PillarsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PillarsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
