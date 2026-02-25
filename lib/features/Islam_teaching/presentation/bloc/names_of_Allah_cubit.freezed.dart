// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'names_of_Allah_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NamesOfAllahState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NamesOfAllahState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NamesOfAllahState()';
  }
}

/// @nodoc
class $NamesOfAllahStateCopyWith<$Res> {
  $NamesOfAllahStateCopyWith(
      NamesOfAllahState _, $Res Function(NamesOfAllahState) __);
}

/// @nodoc

class NamesOfAllahInitialPage implements NamesOfAllahState {
  const NamesOfAllahInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NamesOfAllahInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NamesOfAllahState.initial()';
  }
}

/// @nodoc

class NamesOfAllahLoadingState implements NamesOfAllahState {
  const NamesOfAllahLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NamesOfAllahLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NamesOfAllahState.loading()';
  }
}

/// @nodoc

class NamesOfAllahLoadedState implements NamesOfAllahState {
  const NamesOfAllahLoadedState({required final List<NamesOfAllahDTO> names})
      : _names = names;

  final List<NamesOfAllahDTO> _names;
  List<NamesOfAllahDTO> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  /// Create a copy of NamesOfAllahState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NamesOfAllahLoadedStateCopyWith<NamesOfAllahLoadedState> get copyWith =>
      _$NamesOfAllahLoadedStateCopyWithImpl<NamesOfAllahLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NamesOfAllahLoadedState &&
            const DeepCollectionEquality().equals(other._names, _names));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_names));

  @override
  String toString() {
    return 'NamesOfAllahState.loaded(names: $names)';
  }
}

/// @nodoc
abstract mixin class $NamesOfAllahLoadedStateCopyWith<$Res>
    implements $NamesOfAllahStateCopyWith<$Res> {
  factory $NamesOfAllahLoadedStateCopyWith(NamesOfAllahLoadedState value,
          $Res Function(NamesOfAllahLoadedState) _then) =
      _$NamesOfAllahLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<NamesOfAllahDTO> names});
}

/// @nodoc
class _$NamesOfAllahLoadedStateCopyWithImpl<$Res>
    implements $NamesOfAllahLoadedStateCopyWith<$Res> {
  _$NamesOfAllahLoadedStateCopyWithImpl(this._self, this._then);

  final NamesOfAllahLoadedState _self;
  final $Res Function(NamesOfAllahLoadedState) _then;

  /// Create a copy of NamesOfAllahState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? names = null,
  }) {
    return _then(NamesOfAllahLoadedState(
      names: null == names
          ? _self._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<NamesOfAllahDTO>,
    ));
  }
}

/// @nodoc

class NamesOfAllahErrorState implements NamesOfAllahState {
  const NamesOfAllahErrorState({required this.message});

  final String message;

  /// Create a copy of NamesOfAllahState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NamesOfAllahErrorStateCopyWith<NamesOfAllahErrorState> get copyWith =>
      _$NamesOfAllahErrorStateCopyWithImpl<NamesOfAllahErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NamesOfAllahErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NamesOfAllahState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NamesOfAllahErrorStateCopyWith<$Res>
    implements $NamesOfAllahStateCopyWith<$Res> {
  factory $NamesOfAllahErrorStateCopyWith(NamesOfAllahErrorState value,
          $Res Function(NamesOfAllahErrorState) _then) =
      _$NamesOfAllahErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NamesOfAllahErrorStateCopyWithImpl<$Res>
    implements $NamesOfAllahErrorStateCopyWith<$Res> {
  _$NamesOfAllahErrorStateCopyWithImpl(this._self, this._then);

  final NamesOfAllahErrorState _self;
  final $Res Function(NamesOfAllahErrorState) _then;

  /// Create a copy of NamesOfAllahState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NamesOfAllahErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
