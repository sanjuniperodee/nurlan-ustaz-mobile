// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_pass_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangePassState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChangePassState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChangePassState()';
  }
}

/// @nodoc
class $ChangePassStateCopyWith<$Res> {
  $ChangePassStateCopyWith(
      ChangePassState _, $Res Function(ChangePassState) __);
}

/// @nodoc

class ChangePassInitialPage implements ChangePassState {
  const ChangePassInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChangePassInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChangePassState.initial()';
  }
}

/// @nodoc

class ChangePassLoadingState implements ChangePassState {
  const ChangePassLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChangePassLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChangePassState.loading()';
  }
}

/// @nodoc

class ChangePassLoadedState implements ChangePassState {
  const ChangePassLoadedState({required this.status});

  final bool status;

  /// Create a copy of ChangePassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangePassLoadedStateCopyWith<ChangePassLoadedState> get copyWith =>
      _$ChangePassLoadedStateCopyWithImpl<ChangePassLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangePassLoadedState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'ChangePassState.loaded(status: $status)';
  }
}

/// @nodoc
abstract mixin class $ChangePassLoadedStateCopyWith<$Res>
    implements $ChangePassStateCopyWith<$Res> {
  factory $ChangePassLoadedStateCopyWith(ChangePassLoadedState value,
          $Res Function(ChangePassLoadedState) _then) =
      _$ChangePassLoadedStateCopyWithImpl;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class _$ChangePassLoadedStateCopyWithImpl<$Res>
    implements $ChangePassLoadedStateCopyWith<$Res> {
  _$ChangePassLoadedStateCopyWithImpl(this._self, this._then);

  final ChangePassLoadedState _self;
  final $Res Function(ChangePassLoadedState) _then;

  /// Create a copy of ChangePassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(ChangePassLoadedState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ChangePassErrorState implements ChangePassState {
  const ChangePassErrorState({required this.message});

  final String message;

  /// Create a copy of ChangePassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChangePassErrorStateCopyWith<ChangePassErrorState> get copyWith =>
      _$ChangePassErrorStateCopyWithImpl<ChangePassErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChangePassErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ChangePassState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ChangePassErrorStateCopyWith<$Res>
    implements $ChangePassStateCopyWith<$Res> {
  factory $ChangePassErrorStateCopyWith(ChangePassErrorState value,
          $Res Function(ChangePassErrorState) _then) =
      _$ChangePassErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ChangePassErrorStateCopyWithImpl<$Res>
    implements $ChangePassErrorStateCopyWith<$Res> {
  _$ChangePassErrorStateCopyWithImpl(this._self, this._then);

  final ChangePassErrorState _self;
  final $Res Function(ChangePassErrorState) _then;

  /// Create a copy of ChangePassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ChangePassErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
