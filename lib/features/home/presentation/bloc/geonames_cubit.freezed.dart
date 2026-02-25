// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geonames_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeonamesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GeonamesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GeonamesState()';
  }
}

/// @nodoc
class $GeonamesStateCopyWith<$Res> {
  $GeonamesStateCopyWith(GeonamesState _, $Res Function(GeonamesState) __);
}

/// @nodoc

class GeonamesInitialPage implements GeonamesState {
  const GeonamesInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GeonamesInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GeonamesState.initial()';
  }
}

/// @nodoc

class GeonamesLoadingState implements GeonamesState {
  const GeonamesLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GeonamesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GeonamesState.loading()';
  }
}

/// @nodoc

class GeonamesLoadedState implements GeonamesState {
  const GeonamesLoadedState({required final List<GeonamesDTO> geo})
      : _geo = geo;

  final List<GeonamesDTO> _geo;
  List<GeonamesDTO> get geo {
    if (_geo is EqualUnmodifiableListView) return _geo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_geo);
  }

  /// Create a copy of GeonamesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeonamesLoadedStateCopyWith<GeonamesLoadedState> get copyWith =>
      _$GeonamesLoadedStateCopyWithImpl<GeonamesLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeonamesLoadedState &&
            const DeepCollectionEquality().equals(other._geo, _geo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_geo));

  @override
  String toString() {
    return 'GeonamesState.loaded(geo: $geo)';
  }
}

/// @nodoc
abstract mixin class $GeonamesLoadedStateCopyWith<$Res>
    implements $GeonamesStateCopyWith<$Res> {
  factory $GeonamesLoadedStateCopyWith(
          GeonamesLoadedState value, $Res Function(GeonamesLoadedState) _then) =
      _$GeonamesLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<GeonamesDTO> geo});
}

/// @nodoc
class _$GeonamesLoadedStateCopyWithImpl<$Res>
    implements $GeonamesLoadedStateCopyWith<$Res> {
  _$GeonamesLoadedStateCopyWithImpl(this._self, this._then);

  final GeonamesLoadedState _self;
  final $Res Function(GeonamesLoadedState) _then;

  /// Create a copy of GeonamesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? geo = null,
  }) {
    return _then(GeonamesLoadedState(
      geo: null == geo
          ? _self._geo
          : geo // ignore: cast_nullable_to_non_nullable
              as List<GeonamesDTO>,
    ));
  }
}

/// @nodoc

class GeonamesErrorState implements GeonamesState {
  const GeonamesErrorState({required this.message});

  final String message;

  /// Create a copy of GeonamesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeonamesErrorStateCopyWith<GeonamesErrorState> get copyWith =>
      _$GeonamesErrorStateCopyWithImpl<GeonamesErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GeonamesErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GeonamesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GeonamesErrorStateCopyWith<$Res>
    implements $GeonamesStateCopyWith<$Res> {
  factory $GeonamesErrorStateCopyWith(
          GeonamesErrorState value, $Res Function(GeonamesErrorState) _then) =
      _$GeonamesErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GeonamesErrorStateCopyWithImpl<$Res>
    implements $GeonamesErrorStateCopyWith<$Res> {
  _$GeonamesErrorStateCopyWithImpl(this._self, this._then);

  final GeonamesErrorState _self;
  final $Res Function(GeonamesErrorState) _then;

  /// Create a copy of GeonamesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(GeonamesErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
