// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_city_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetCityState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SetCityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SetCityState()';
  }
}

/// @nodoc
class $SetCityStateCopyWith<$Res> {
  $SetCityStateCopyWith(SetCityState _, $Res Function(SetCityState) __);
}

/// @nodoc

class SetCityInitialPage implements SetCityState {
  const SetCityInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SetCityInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SetCityState.initial()';
  }
}

/// @nodoc

class SetCityLoadingState implements SetCityState {
  const SetCityLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SetCityLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SetCityState.loading()';
  }
}

/// @nodoc

class SetCityLoadedState implements SetCityState {
  const SetCityLoadedState({required this.not});

  final NotificationDTO not;

  /// Create a copy of SetCityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetCityLoadedStateCopyWith<SetCityLoadedState> get copyWith =>
      _$SetCityLoadedStateCopyWithImpl<SetCityLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetCityLoadedState &&
            (identical(other.not, not) || other.not == not));
  }

  @override
  int get hashCode => Object.hash(runtimeType, not);

  @override
  String toString() {
    return 'SetCityState.loaded(not: $not)';
  }
}

/// @nodoc
abstract mixin class $SetCityLoadedStateCopyWith<$Res>
    implements $SetCityStateCopyWith<$Res> {
  factory $SetCityLoadedStateCopyWith(
          SetCityLoadedState value, $Res Function(SetCityLoadedState) _then) =
      _$SetCityLoadedStateCopyWithImpl;
  @useResult
  $Res call({NotificationDTO not});

  $NotificationDTOCopyWith<$Res> get not;
}

/// @nodoc
class _$SetCityLoadedStateCopyWithImpl<$Res>
    implements $SetCityLoadedStateCopyWith<$Res> {
  _$SetCityLoadedStateCopyWithImpl(this._self, this._then);

  final SetCityLoadedState _self;
  final $Res Function(SetCityLoadedState) _then;

  /// Create a copy of SetCityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? not = null,
  }) {
    return _then(SetCityLoadedState(
      not: null == not
          ? _self.not
          : not // ignore: cast_nullable_to_non_nullable
              as NotificationDTO,
    ));
  }

  /// Create a copy of SetCityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDTOCopyWith<$Res> get not {
    return $NotificationDTOCopyWith<$Res>(_self.not, (value) {
      return _then(_self.copyWith(not: value));
    });
  }
}

/// @nodoc

class SetCityErrorState implements SetCityState {
  const SetCityErrorState({required this.message});

  final String message;

  /// Create a copy of SetCityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SetCityErrorStateCopyWith<SetCityErrorState> get copyWith =>
      _$SetCityErrorStateCopyWithImpl<SetCityErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetCityErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SetCityState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SetCityErrorStateCopyWith<$Res>
    implements $SetCityStateCopyWith<$Res> {
  factory $SetCityErrorStateCopyWith(
          SetCityErrorState value, $Res Function(SetCityErrorState) _then) =
      _$SetCityErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SetCityErrorStateCopyWithImpl<$Res>
    implements $SetCityErrorStateCopyWith<$Res> {
  _$SetCityErrorStateCopyWithImpl(this._self, this._then);

  final SetCityErrorState _self;
  final $Res Function(SetCityErrorState) _then;

  /// Create a copy of SetCityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SetCityErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
