// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimingsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimingsState()';
  }
}

/// @nodoc
class $TimingsStateCopyWith<$Res> {
  $TimingsStateCopyWith(TimingsState _, $Res Function(TimingsState) __);
}

/// @nodoc

class TimingsInitialPage implements TimingsState {
  const TimingsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimingsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimingsState.initial()';
  }
}

/// @nodoc

class TimingsLoadingState implements TimingsState {
  const TimingsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimingsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimingsState.loading()';
  }
}

/// @nodoc

class TimingsLoadedState implements TimingsState {
  const TimingsLoadedState({required this.not, required this.geo});

  final TimingsDTO not;
  final GeonamesDTO geo;

  /// Create a copy of TimingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimingsLoadedStateCopyWith<TimingsLoadedState> get copyWith =>
      _$TimingsLoadedStateCopyWithImpl<TimingsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimingsLoadedState &&
            (identical(other.not, not) || other.not == not) &&
            (identical(other.geo, geo) || other.geo == geo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, not, geo);

  @override
  String toString() {
    return 'TimingsState.loaded(not: $not, geo: $geo)';
  }
}

/// @nodoc
abstract mixin class $TimingsLoadedStateCopyWith<$Res>
    implements $TimingsStateCopyWith<$Res> {
  factory $TimingsLoadedStateCopyWith(
          TimingsLoadedState value, $Res Function(TimingsLoadedState) _then) =
      _$TimingsLoadedStateCopyWithImpl;
  @useResult
  $Res call({TimingsDTO not, GeonamesDTO geo});

  $TimingsDTOCopyWith<$Res> get not;
  $GeonamesDTOCopyWith<$Res> get geo;
}

/// @nodoc
class _$TimingsLoadedStateCopyWithImpl<$Res>
    implements $TimingsLoadedStateCopyWith<$Res> {
  _$TimingsLoadedStateCopyWithImpl(this._self, this._then);

  final TimingsLoadedState _self;
  final $Res Function(TimingsLoadedState) _then;

  /// Create a copy of TimingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? not = null,
    Object? geo = null,
  }) {
    return _then(TimingsLoadedState(
      not: null == not
          ? _self.not
          : not // ignore: cast_nullable_to_non_nullable
              as TimingsDTO,
      geo: null == geo
          ? _self.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as GeonamesDTO,
    ));
  }

  /// Create a copy of TimingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimingsDTOCopyWith<$Res> get not {
    return $TimingsDTOCopyWith<$Res>(_self.not, (value) {
      return _then(_self.copyWith(not: value));
    });
  }

  /// Create a copy of TimingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeonamesDTOCopyWith<$Res> get geo {
    return $GeonamesDTOCopyWith<$Res>(_self.geo, (value) {
      return _then(_self.copyWith(geo: value));
    });
  }
}

/// @nodoc

class TimingsErrorState implements TimingsState {
  const TimingsErrorState({required this.message});

  final String message;

  /// Create a copy of TimingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimingsErrorStateCopyWith<TimingsErrorState> get copyWith =>
      _$TimingsErrorStateCopyWithImpl<TimingsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimingsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TimingsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TimingsErrorStateCopyWith<$Res>
    implements $TimingsStateCopyWith<$Res> {
  factory $TimingsErrorStateCopyWith(
          TimingsErrorState value, $Res Function(TimingsErrorState) _then) =
      _$TimingsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TimingsErrorStateCopyWithImpl<$Res>
    implements $TimingsErrorStateCopyWith<$Res> {
  _$TimingsErrorStateCopyWithImpl(this._self, this._then);

  final TimingsErrorState _self;
  final $Res Function(TimingsErrorState) _then;

  /// Create a copy of TimingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TimingsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
