// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tandaulilar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TandaulilarState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TandaulilarState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TandaulilarState()';
  }
}

/// @nodoc
class $TandaulilarStateCopyWith<$Res> {
  $TandaulilarStateCopyWith(
      TandaulilarState _, $Res Function(TandaulilarState) __);
}

/// @nodoc

class TandaulilarInitialPage implements TandaulilarState {
  const TandaulilarInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TandaulilarInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TandaulilarState.initial()';
  }
}

/// @nodoc

class TandaulilarLoadingState implements TandaulilarState {
  const TandaulilarLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TandaulilarLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TandaulilarState.loading()';
  }
}

/// @nodoc

class TandaulilarLoadedState implements TandaulilarState {
  const TandaulilarLoadedState(
      {final List<ResultHomeDTO> lives = const [],
      final List<ResultHomeDTO> news = const [],
      final List<ResultHomeDTO> seminars = const []})
      : _lives = lives,
        _news = news,
        _seminars = seminars;

  final List<ResultHomeDTO> _lives;
  @JsonKey()
  List<ResultHomeDTO> get lives {
    if (_lives is EqualUnmodifiableListView) return _lives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lives);
  }

  final List<ResultHomeDTO> _news;
  @JsonKey()
  List<ResultHomeDTO> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  final List<ResultHomeDTO> _seminars;
  @JsonKey()
  List<ResultHomeDTO> get seminars {
    if (_seminars is EqualUnmodifiableListView) return _seminars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seminars);
  }

  /// Create a copy of TandaulilarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TandaulilarLoadedStateCopyWith<TandaulilarLoadedState> get copyWith =>
      _$TandaulilarLoadedStateCopyWithImpl<TandaulilarLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TandaulilarLoadedState &&
            const DeepCollectionEquality().equals(other._lives, _lives) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality().equals(other._seminars, _seminars));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lives),
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_seminars));

  @override
  String toString() {
    return 'TandaulilarState.loaded(lives: $lives, news: $news, seminars: $seminars)';
  }
}

/// @nodoc
abstract mixin class $TandaulilarLoadedStateCopyWith<$Res>
    implements $TandaulilarStateCopyWith<$Res> {
  factory $TandaulilarLoadedStateCopyWith(TandaulilarLoadedState value,
          $Res Function(TandaulilarLoadedState) _then) =
      _$TandaulilarLoadedStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ResultHomeDTO> lives,
      List<ResultHomeDTO> news,
      List<ResultHomeDTO> seminars});
}

/// @nodoc
class _$TandaulilarLoadedStateCopyWithImpl<$Res>
    implements $TandaulilarLoadedStateCopyWith<$Res> {
  _$TandaulilarLoadedStateCopyWithImpl(this._self, this._then);

  final TandaulilarLoadedState _self;
  final $Res Function(TandaulilarLoadedState) _then;

  /// Create a copy of TandaulilarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lives = null,
    Object? news = null,
    Object? seminars = null,
  }) {
    return _then(TandaulilarLoadedState(
      lives: null == lives
          ? _self._lives
          : lives // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
      news: null == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
      seminars: null == seminars
          ? _self._seminars
          : seminars // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class TandaulilarErrorState implements TandaulilarState {
  const TandaulilarErrorState({required this.message});

  final String message;

  /// Create a copy of TandaulilarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TandaulilarErrorStateCopyWith<TandaulilarErrorState> get copyWith =>
      _$TandaulilarErrorStateCopyWithImpl<TandaulilarErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TandaulilarErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TandaulilarState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TandaulilarErrorStateCopyWith<$Res>
    implements $TandaulilarStateCopyWith<$Res> {
  factory $TandaulilarErrorStateCopyWith(TandaulilarErrorState value,
          $Res Function(TandaulilarErrorState) _then) =
      _$TandaulilarErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TandaulilarErrorStateCopyWithImpl<$Res>
    implements $TandaulilarErrorStateCopyWith<$Res> {
  _$TandaulilarErrorStateCopyWithImpl(this._self, this._then);

  final TandaulilarErrorState _self;
  final $Res Function(TandaulilarErrorState) _then;

  /// Create a copy of TandaulilarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TandaulilarErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
