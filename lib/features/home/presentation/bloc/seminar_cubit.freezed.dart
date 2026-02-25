// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seminar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeminarState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeminarState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarState()';
  }
}

/// @nodoc
class $SeminarStateCopyWith<$Res> {
  $SeminarStateCopyWith(SeminarState _, $Res Function(SeminarState) __);
}

/// @nodoc

class SeminarInitialPage implements SeminarState {
  const SeminarInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeminarInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarState.initial()';
  }
}

/// @nodoc

class SeminarLoadingState implements SeminarState {
  const SeminarLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeminarLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarState.loading()';
  }
}

/// @nodoc

class SeminarLoadingMoreState implements SeminarState {
  const SeminarLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SeminarLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SeminarState.loadingMore()';
  }
}

/// @nodoc

class SeminarLoadedState implements SeminarState {
  const SeminarLoadedState({required final List<ResultHomeDTO> news})
      : _news = news;

  final List<ResultHomeDTO> _news;
  List<ResultHomeDTO> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  /// Create a copy of SeminarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeminarLoadedStateCopyWith<SeminarLoadedState> get copyWith =>
      _$SeminarLoadedStateCopyWithImpl<SeminarLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeminarLoadedState &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  @override
  String toString() {
    return 'SeminarState.loaded(news: $news)';
  }
}

/// @nodoc
abstract mixin class $SeminarLoadedStateCopyWith<$Res>
    implements $SeminarStateCopyWith<$Res> {
  factory $SeminarLoadedStateCopyWith(
          SeminarLoadedState value, $Res Function(SeminarLoadedState) _then) =
      _$SeminarLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> news});
}

/// @nodoc
class _$SeminarLoadedStateCopyWithImpl<$Res>
    implements $SeminarLoadedStateCopyWith<$Res> {
  _$SeminarLoadedStateCopyWithImpl(this._self, this._then);

  final SeminarLoadedState _self;
  final $Res Function(SeminarLoadedState) _then;

  /// Create a copy of SeminarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? news = null,
  }) {
    return _then(SeminarLoadedState(
      news: null == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class SeminarErrorState implements SeminarState {
  const SeminarErrorState({required this.message});

  final String message;

  /// Create a copy of SeminarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SeminarErrorStateCopyWith<SeminarErrorState> get copyWith =>
      _$SeminarErrorStateCopyWithImpl<SeminarErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SeminarErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SeminarState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SeminarErrorStateCopyWith<$Res>
    implements $SeminarStateCopyWith<$Res> {
  factory $SeminarErrorStateCopyWith(
          SeminarErrorState value, $Res Function(SeminarErrorState) _then) =
      _$SeminarErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SeminarErrorStateCopyWithImpl<$Res>
    implements $SeminarErrorStateCopyWith<$Res> {
  _$SeminarErrorStateCopyWithImpl(this._self, this._then);

  final SeminarErrorState _self;
  final $Res Function(SeminarErrorState) _then;

  /// Create a copy of SeminarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SeminarErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
