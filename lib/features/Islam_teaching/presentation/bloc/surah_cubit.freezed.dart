// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurahState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SurahState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahState()';
  }
}

/// @nodoc
class $SurahStateCopyWith<$Res> {
  $SurahStateCopyWith(SurahState _, $Res Function(SurahState) __);
}

/// @nodoc

class SurahInitialPage implements SurahState {
  const SurahInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SurahInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahState.initial()';
  }
}

/// @nodoc

class SurahLoadingState implements SurahState {
  const SurahLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SurahLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahState.loading()';
  }
}

/// @nodoc

class SurahLoadingMoreState implements SurahState {
  const SurahLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SurahLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SurahState.loadingMore()';
  }
}

/// @nodoc

class SurahLoadedState implements SurahState {
  const SurahLoadedState({required final List<ResultTeachingDTO> sura})
      : _sura = sura;

  final List<ResultTeachingDTO> _sura;
  List<ResultTeachingDTO> get sura {
    if (_sura is EqualUnmodifiableListView) return _sura;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sura);
  }

  /// Create a copy of SurahState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SurahLoadedStateCopyWith<SurahLoadedState> get copyWith =>
      _$SurahLoadedStateCopyWithImpl<SurahLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SurahLoadedState &&
            const DeepCollectionEquality().equals(other._sura, _sura));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_sura));

  @override
  String toString() {
    return 'SurahState.loaded(sura: $sura)';
  }
}

/// @nodoc
abstract mixin class $SurahLoadedStateCopyWith<$Res>
    implements $SurahStateCopyWith<$Res> {
  factory $SurahLoadedStateCopyWith(
          SurahLoadedState value, $Res Function(SurahLoadedState) _then) =
      _$SurahLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultTeachingDTO> sura});
}

/// @nodoc
class _$SurahLoadedStateCopyWithImpl<$Res>
    implements $SurahLoadedStateCopyWith<$Res> {
  _$SurahLoadedStateCopyWithImpl(this._self, this._then);

  final SurahLoadedState _self;
  final $Res Function(SurahLoadedState) _then;

  /// Create a copy of SurahState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sura = null,
  }) {
    return _then(SurahLoadedState(
      sura: null == sura
          ? _self._sura
          : sura // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
    ));
  }
}

/// @nodoc

class SurahErrorState implements SurahState {
  const SurahErrorState({required this.message});

  final String message;

  /// Create a copy of SurahState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SurahErrorStateCopyWith<SurahErrorState> get copyWith =>
      _$SurahErrorStateCopyWithImpl<SurahErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SurahErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SurahState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SurahErrorStateCopyWith<$Res>
    implements $SurahStateCopyWith<$Res> {
  factory $SurahErrorStateCopyWith(
          SurahErrorState value, $Res Function(SurahErrorState) _then) =
      _$SurahErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SurahErrorStateCopyWithImpl<$Res>
    implements $SurahErrorStateCopyWith<$Res> {
  _$SurahErrorStateCopyWithImpl(this._self, this._then);

  final SurahErrorState _self;
  final $Res Function(SurahErrorState) _then;

  /// Create a copy of SurahState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SurahErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
