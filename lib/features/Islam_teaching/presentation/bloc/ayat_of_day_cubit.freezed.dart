// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ayat_of_day_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AyatOfDayState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AyatOfDayState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AyatOfDayState()';
  }
}

/// @nodoc
class $AyatOfDayStateCopyWith<$Res> {
  $AyatOfDayStateCopyWith(AyatOfDayState _, $Res Function(AyatOfDayState) __);
}

/// @nodoc

class AyatOfDayInitialPage implements AyatOfDayState {
  const AyatOfDayInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AyatOfDayInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AyatOfDayState.initial()';
  }
}

/// @nodoc

class AyatOfDayLoadingState implements AyatOfDayState {
  const AyatOfDayLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AyatOfDayLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AyatOfDayState.loading()';
  }
}

/// @nodoc

class AyatOfDayLoadedState implements AyatOfDayState {
  const AyatOfDayLoadedState(
      {required this.ayat, required final List<PillarsDTO> pillars})
      : _pillars = pillars;

  final AyatDTO ayat;
  final List<PillarsDTO> _pillars;
  List<PillarsDTO> get pillars {
    if (_pillars is EqualUnmodifiableListView) return _pillars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pillars);
  }

  /// Create a copy of AyatOfDayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AyatOfDayLoadedStateCopyWith<AyatOfDayLoadedState> get copyWith =>
      _$AyatOfDayLoadedStateCopyWithImpl<AyatOfDayLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AyatOfDayLoadedState &&
            (identical(other.ayat, ayat) || other.ayat == ayat) &&
            const DeepCollectionEquality().equals(other._pillars, _pillars));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, ayat, const DeepCollectionEquality().hash(_pillars));

  @override
  String toString() {
    return 'AyatOfDayState.loaded(ayat: $ayat, pillars: $pillars)';
  }
}

/// @nodoc
abstract mixin class $AyatOfDayLoadedStateCopyWith<$Res>
    implements $AyatOfDayStateCopyWith<$Res> {
  factory $AyatOfDayLoadedStateCopyWith(AyatOfDayLoadedState value,
          $Res Function(AyatOfDayLoadedState) _then) =
      _$AyatOfDayLoadedStateCopyWithImpl;
  @useResult
  $Res call({AyatDTO ayat, List<PillarsDTO> pillars});

  $AyatDTOCopyWith<$Res> get ayat;
}

/// @nodoc
class _$AyatOfDayLoadedStateCopyWithImpl<$Res>
    implements $AyatOfDayLoadedStateCopyWith<$Res> {
  _$AyatOfDayLoadedStateCopyWithImpl(this._self, this._then);

  final AyatOfDayLoadedState _self;
  final $Res Function(AyatOfDayLoadedState) _then;

  /// Create a copy of AyatOfDayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ayat = null,
    Object? pillars = null,
  }) {
    return _then(AyatOfDayLoadedState(
      ayat: null == ayat
          ? _self.ayat
          : ayat // ignore: cast_nullable_to_non_nullable
              as AyatDTO,
      pillars: null == pillars
          ? _self._pillars
          : pillars // ignore: cast_nullable_to_non_nullable
              as List<PillarsDTO>,
    ));
  }

  /// Create a copy of AyatOfDayState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AyatDTOCopyWith<$Res> get ayat {
    return $AyatDTOCopyWith<$Res>(_self.ayat, (value) {
      return _then(_self.copyWith(ayat: value));
    });
  }
}

/// @nodoc

class AyatOfDayErrorState implements AyatOfDayState {
  const AyatOfDayErrorState({required this.message});

  final String message;

  /// Create a copy of AyatOfDayState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AyatOfDayErrorStateCopyWith<AyatOfDayErrorState> get copyWith =>
      _$AyatOfDayErrorStateCopyWithImpl<AyatOfDayErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AyatOfDayErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AyatOfDayState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AyatOfDayErrorStateCopyWith<$Res>
    implements $AyatOfDayStateCopyWith<$Res> {
  factory $AyatOfDayErrorStateCopyWith(
          AyatOfDayErrorState value, $Res Function(AyatOfDayErrorState) _then) =
      _$AyatOfDayErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AyatOfDayErrorStateCopyWithImpl<$Res>
    implements $AyatOfDayErrorStateCopyWith<$Res> {
  _$AyatOfDayErrorStateCopyWithImpl(this._self, this._then);

  final AyatOfDayErrorState _self;
  final $Res Function(AyatOfDayErrorState) _then;

  /// Create a copy of AyatOfDayState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AyatOfDayErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
