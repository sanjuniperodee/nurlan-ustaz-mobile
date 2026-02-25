// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CardsState()';
  }
}

/// @nodoc
class $CardsStateCopyWith<$Res> {
  $CardsStateCopyWith(CardsState _, $Res Function(CardsState) __);
}

/// @nodoc

class CardsInitialPage implements CardsState {
  const CardsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CardsState.initial()';
  }
}

/// @nodoc

class CardsLoadingState implements CardsState {
  const CardsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CardsState.loading()';
  }
}

/// @nodoc

class CardsLoadedState implements CardsState {
  const CardsLoadedState({required final List<CardDTO> cards}) : _cards = cards;

  final List<CardDTO> _cards;
  List<CardDTO> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardsLoadedStateCopyWith<CardsLoadedState> get copyWith =>
      _$CardsLoadedStateCopyWithImpl<CardsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardsLoadedState &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @override
  String toString() {
    return 'CardsState.loaded(cards: $cards)';
  }
}

/// @nodoc
abstract mixin class $CardsLoadedStateCopyWith<$Res>
    implements $CardsStateCopyWith<$Res> {
  factory $CardsLoadedStateCopyWith(
          CardsLoadedState value, $Res Function(CardsLoadedState) _then) =
      _$CardsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<CardDTO> cards});
}

/// @nodoc
class _$CardsLoadedStateCopyWithImpl<$Res>
    implements $CardsLoadedStateCopyWith<$Res> {
  _$CardsLoadedStateCopyWithImpl(this._self, this._then);

  final CardsLoadedState _self;
  final $Res Function(CardsLoadedState) _then;

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cards = null,
  }) {
    return _then(CardsLoadedState(
      cards: null == cards
          ? _self._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardDTO>,
    ));
  }
}

/// @nodoc

class CardsErrorState implements CardsState {
  const CardsErrorState({required this.message});

  final String message;

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardsErrorStateCopyWith<CardsErrorState> get copyWith =>
      _$CardsErrorStateCopyWithImpl<CardsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CardsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CardsErrorStateCopyWith<$Res>
    implements $CardsStateCopyWith<$Res> {
  factory $CardsErrorStateCopyWith(
          CardsErrorState value, $Res Function(CardsErrorState) _then) =
      _$CardsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CardsErrorStateCopyWithImpl<$Res>
    implements $CardsErrorStateCopyWith<$Res> {
  _$CardsErrorStateCopyWithImpl(this._self, this._then);

  final CardsErrorState _self;
  final $Res Function(CardsErrorState) _then;

  /// Create a copy of CardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CardsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
