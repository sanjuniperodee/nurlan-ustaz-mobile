// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah_favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurahFavoriteState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SurahFavoriteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahFavoriteState()';
  }
}

/// @nodoc
class $SurahFavoriteStateCopyWith<$Res> {
  $SurahFavoriteStateCopyWith(
      SurahFavoriteState _, $Res Function(SurahFavoriteState) __);
}

/// @nodoc

class _InitialPage implements SurahFavoriteState {
  const _InitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahFavoriteState.initialState()';
  }
}

/// @nodoc

class _LoadingState implements SurahFavoriteState {
  const _LoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahFavoriteState.loadingState()';
  }
}

/// @nodoc

class _LoadedState implements SurahFavoriteState {
  const _LoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahFavoriteState.loaded()';
  }
}

/// @nodoc

class _ErrorState implements SurahFavoriteState {
  const _ErrorState({required this.message});

  final String message;

  /// Create a copy of SurahFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorStateCopyWith<_ErrorState> get copyWith =>
      __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SurahFavoriteState.errorState(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorStateCopyWith<$Res>
    implements $SurahFavoriteStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(
          _ErrorState value, $Res Function(_ErrorState) _then) =
      __$ErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorStateCopyWithImpl<$Res> implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(this._self, this._then);

  final _ErrorState _self;
  final $Res Function(_ErrorState) _then;

  /// Create a copy of SurahFavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
