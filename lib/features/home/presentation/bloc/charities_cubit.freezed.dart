// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charities_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharitiesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CharitiesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CharitiesState()';
  }
}

/// @nodoc
class $CharitiesStateCopyWith<$Res> {
  $CharitiesStateCopyWith(CharitiesState _, $Res Function(CharitiesState) __);
}

/// @nodoc

class CharitiesInitialPage implements CharitiesState {
  const CharitiesInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CharitiesInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CharitiesState.initial()';
  }
}

/// @nodoc

class CharitiesLoadingState implements CharitiesState {
  const CharitiesLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CharitiesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CharitiesState.loading()';
  }
}

/// @nodoc

class CharitiesLoadingMoreState implements CharitiesState {
  const CharitiesLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharitiesLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CharitiesState.loadingMore()';
  }
}

/// @nodoc

class CharitiesLoadedState implements CharitiesState {
  const CharitiesLoadedState({required final List<ResultHomeDTO> charities})
      : _charities = charities;

  final List<ResultHomeDTO> _charities;
  List<ResultHomeDTO> get charities {
    if (_charities is EqualUnmodifiableListView) return _charities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charities);
  }

  /// Create a copy of CharitiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharitiesLoadedStateCopyWith<CharitiesLoadedState> get copyWith =>
      _$CharitiesLoadedStateCopyWithImpl<CharitiesLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharitiesLoadedState &&
            const DeepCollectionEquality()
                .equals(other._charities, _charities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_charities));

  @override
  String toString() {
    return 'CharitiesState.loaded(charities: $charities)';
  }
}

/// @nodoc
abstract mixin class $CharitiesLoadedStateCopyWith<$Res>
    implements $CharitiesStateCopyWith<$Res> {
  factory $CharitiesLoadedStateCopyWith(CharitiesLoadedState value,
          $Res Function(CharitiesLoadedState) _then) =
      _$CharitiesLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> charities});
}

/// @nodoc
class _$CharitiesLoadedStateCopyWithImpl<$Res>
    implements $CharitiesLoadedStateCopyWith<$Res> {
  _$CharitiesLoadedStateCopyWithImpl(this._self, this._then);

  final CharitiesLoadedState _self;
  final $Res Function(CharitiesLoadedState) _then;

  /// Create a copy of CharitiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? charities = null,
  }) {
    return _then(CharitiesLoadedState(
      charities: null == charities
          ? _self._charities
          : charities // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class CharitiesErrorState implements CharitiesState {
  const CharitiesErrorState({required this.message});

  final String message;

  /// Create a copy of CharitiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CharitiesErrorStateCopyWith<CharitiesErrorState> get copyWith =>
      _$CharitiesErrorStateCopyWithImpl<CharitiesErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CharitiesErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CharitiesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CharitiesErrorStateCopyWith<$Res>
    implements $CharitiesStateCopyWith<$Res> {
  factory $CharitiesErrorStateCopyWith(
          CharitiesErrorState value, $Res Function(CharitiesErrorState) _then) =
      _$CharitiesErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CharitiesErrorStateCopyWithImpl<$Res>
    implements $CharitiesErrorStateCopyWith<$Res> {
  _$CharitiesErrorStateCopyWithImpl(this._self, this._then);

  final CharitiesErrorState _self;
  final $Res Function(CharitiesErrorState) _then;

  /// Create a copy of CharitiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CharitiesErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
