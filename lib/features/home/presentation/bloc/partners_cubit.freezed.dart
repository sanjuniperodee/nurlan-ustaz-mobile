// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partners_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnersState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PartnersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartnersState()';
  }
}

/// @nodoc
class $PartnersStateCopyWith<$Res> {
  $PartnersStateCopyWith(PartnersState _, $Res Function(PartnersState) __);
}

/// @nodoc

class PartnersInitialPage implements PartnersState {
  const PartnersInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PartnersInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartnersState.initial()';
  }
}

/// @nodoc

class PartnersLoadingState implements PartnersState {
  const PartnersLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PartnersLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PartnersState.loading()';
  }
}

/// @nodoc

class PartnersLoadedState implements PartnersState {
  const PartnersLoadedState({required final List<ResultHomeDTO> partners})
      : _partners = partners;

  final List<ResultHomeDTO> _partners;
  List<ResultHomeDTO> get partners {
    if (_partners is EqualUnmodifiableListView) return _partners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partners);
  }

  /// Create a copy of PartnersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnersLoadedStateCopyWith<PartnersLoadedState> get copyWith =>
      _$PartnersLoadedStateCopyWithImpl<PartnersLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnersLoadedState &&
            const DeepCollectionEquality().equals(other._partners, _partners));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_partners));

  @override
  String toString() {
    return 'PartnersState.loaded(partners: $partners)';
  }
}

/// @nodoc
abstract mixin class $PartnersLoadedStateCopyWith<$Res>
    implements $PartnersStateCopyWith<$Res> {
  factory $PartnersLoadedStateCopyWith(
          PartnersLoadedState value, $Res Function(PartnersLoadedState) _then) =
      _$PartnersLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> partners});
}

/// @nodoc
class _$PartnersLoadedStateCopyWithImpl<$Res>
    implements $PartnersLoadedStateCopyWith<$Res> {
  _$PartnersLoadedStateCopyWithImpl(this._self, this._then);

  final PartnersLoadedState _self;
  final $Res Function(PartnersLoadedState) _then;

  /// Create a copy of PartnersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? partners = null,
  }) {
    return _then(PartnersLoadedState(
      partners: null == partners
          ? _self._partners
          : partners // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class PartnersErrorState implements PartnersState {
  const PartnersErrorState({required this.message});

  final String message;

  /// Create a copy of PartnersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PartnersErrorStateCopyWith<PartnersErrorState> get copyWith =>
      _$PartnersErrorStateCopyWithImpl<PartnersErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PartnersErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PartnersState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PartnersErrorStateCopyWith<$Res>
    implements $PartnersStateCopyWith<$Res> {
  factory $PartnersErrorStateCopyWith(
          PartnersErrorState value, $Res Function(PartnersErrorState) _then) =
      _$PartnersErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PartnersErrorStateCopyWithImpl<$Res>
    implements $PartnersErrorStateCopyWith<$Res> {
  _$PartnersErrorStateCopyWithImpl(this._self, this._then);

  final PartnersErrorState _self;
  final $Res Function(PartnersErrorState) _then;

  /// Create a copy of PartnersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PartnersErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
