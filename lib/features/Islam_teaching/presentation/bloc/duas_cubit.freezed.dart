// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duas_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DuasState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuasState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuasState()';
  }
}

/// @nodoc
class $DuasStateCopyWith<$Res> {
  $DuasStateCopyWith(DuasState _, $Res Function(DuasState) __);
}

/// @nodoc

class DuasInitialPage implements DuasState {
  const DuasInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuasInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuasState.initial()';
  }
}

/// @nodoc

class DuasLoadingState implements DuasState {
  const DuasLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuasLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuasState.loading()';
  }
}

/// @nodoc

class DuasLoadingMoreState implements DuasState {
  const DuasLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuasLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuasState.loadingMore()';
  }
}

/// @nodoc

class DuasLoadedState implements DuasState {
  const DuasLoadedState({required final List<ResultTeachingDTO> duha})
      : _duha = duha;

  final List<ResultTeachingDTO> _duha;
  List<ResultTeachingDTO> get duha {
    if (_duha is EqualUnmodifiableListView) return _duha;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_duha);
  }

  /// Create a copy of DuasState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DuasLoadedStateCopyWith<DuasLoadedState> get copyWith =>
      _$DuasLoadedStateCopyWithImpl<DuasLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DuasLoadedState &&
            const DeepCollectionEquality().equals(other._duha, _duha));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_duha));

  @override
  String toString() {
    return 'DuasState.loaded(duha: $duha)';
  }
}

/// @nodoc
abstract mixin class $DuasLoadedStateCopyWith<$Res>
    implements $DuasStateCopyWith<$Res> {
  factory $DuasLoadedStateCopyWith(
          DuasLoadedState value, $Res Function(DuasLoadedState) _then) =
      _$DuasLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultTeachingDTO> duha});
}

/// @nodoc
class _$DuasLoadedStateCopyWithImpl<$Res>
    implements $DuasLoadedStateCopyWith<$Res> {
  _$DuasLoadedStateCopyWithImpl(this._self, this._then);

  final DuasLoadedState _self;
  final $Res Function(DuasLoadedState) _then;

  /// Create a copy of DuasState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? duha = null,
  }) {
    return _then(DuasLoadedState(
      duha: null == duha
          ? _self._duha
          : duha // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
    ));
  }
}

/// @nodoc

class DuasErrorState implements DuasState {
  const DuasErrorState({required this.message});

  final String message;

  /// Create a copy of DuasState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DuasErrorStateCopyWith<DuasErrorState> get copyWith =>
      _$DuasErrorStateCopyWithImpl<DuasErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DuasErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DuasState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DuasErrorStateCopyWith<$Res>
    implements $DuasStateCopyWith<$Res> {
  factory $DuasErrorStateCopyWith(
          DuasErrorState value, $Res Function(DuasErrorState) _then) =
      _$DuasErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DuasErrorStateCopyWithImpl<$Res>
    implements $DuasErrorStateCopyWith<$Res> {
  _$DuasErrorStateCopyWithImpl(this._self, this._then);

  final DuasErrorState _self;
  final $Res Function(DuasErrorState) _then;

  /// Create a copy of DuasState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DuasErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
