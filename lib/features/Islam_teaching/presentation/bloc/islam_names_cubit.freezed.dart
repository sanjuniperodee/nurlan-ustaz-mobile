// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'islam_names_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IslamNamesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IslamNamesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNamesState()';
  }
}

/// @nodoc
class $IslamNamesStateCopyWith<$Res> {
  $IslamNamesStateCopyWith(
      IslamNamesState _, $Res Function(IslamNamesState) __);
}

/// @nodoc

class IslamNamesInitialPage implements IslamNamesState {
  const IslamNamesInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IslamNamesInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNamesState.initial()';
  }
}

/// @nodoc

class IslamNamesLoadingState implements IslamNamesState {
  const IslamNamesLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IslamNamesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNamesState.loading()';
  }
}

/// @nodoc

class IslamNamesLoadingMoreState implements IslamNamesState {
  const IslamNamesLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNamesLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNamesState.loadingMore()';
  }
}

/// @nodoc

class IslamNamesLoadedState implements IslamNamesState {
  const IslamNamesLoadedState({required final List<ResultTeachingDTO> islam})
      : _islam = islam;

  final List<ResultTeachingDTO> _islam;
  List<ResultTeachingDTO> get islam {
    if (_islam is EqualUnmodifiableListView) return _islam;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_islam);
  }

  /// Create a copy of IslamNamesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IslamNamesLoadedStateCopyWith<IslamNamesLoadedState> get copyWith =>
      _$IslamNamesLoadedStateCopyWithImpl<IslamNamesLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNamesLoadedState &&
            const DeepCollectionEquality().equals(other._islam, _islam));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_islam));

  @override
  String toString() {
    return 'IslamNamesState.loaded(islam: $islam)';
  }
}

/// @nodoc
abstract mixin class $IslamNamesLoadedStateCopyWith<$Res>
    implements $IslamNamesStateCopyWith<$Res> {
  factory $IslamNamesLoadedStateCopyWith(IslamNamesLoadedState value,
          $Res Function(IslamNamesLoadedState) _then) =
      _$IslamNamesLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultTeachingDTO> islam});
}

/// @nodoc
class _$IslamNamesLoadedStateCopyWithImpl<$Res>
    implements $IslamNamesLoadedStateCopyWith<$Res> {
  _$IslamNamesLoadedStateCopyWithImpl(this._self, this._then);

  final IslamNamesLoadedState _self;
  final $Res Function(IslamNamesLoadedState) _then;

  /// Create a copy of IslamNamesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? islam = null,
  }) {
    return _then(IslamNamesLoadedState(
      islam: null == islam
          ? _self._islam
          : islam // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
    ));
  }
}

/// @nodoc

class IslamNamesErrorState implements IslamNamesState {
  const IslamNamesErrorState({required this.message});

  final String message;

  /// Create a copy of IslamNamesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IslamNamesErrorStateCopyWith<IslamNamesErrorState> get copyWith =>
      _$IslamNamesErrorStateCopyWithImpl<IslamNamesErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNamesErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'IslamNamesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $IslamNamesErrorStateCopyWith<$Res>
    implements $IslamNamesStateCopyWith<$Res> {
  factory $IslamNamesErrorStateCopyWith(IslamNamesErrorState value,
          $Res Function(IslamNamesErrorState) _then) =
      _$IslamNamesErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$IslamNamesErrorStateCopyWithImpl<$Res>
    implements $IslamNamesErrorStateCopyWith<$Res> {
  _$IslamNamesErrorStateCopyWithImpl(this._self, this._then);

  final IslamNamesErrorState _self;
  final $Res Function(IslamNamesErrorState) _then;

  /// Create a copy of IslamNamesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(IslamNamesErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
