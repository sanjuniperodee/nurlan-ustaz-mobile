// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_main_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsMainState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsMainState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsMainState()';
  }
}

/// @nodoc
class $NewsMainStateCopyWith<$Res> {
  $NewsMainStateCopyWith(NewsMainState _, $Res Function(NewsMainState) __);
}

/// @nodoc

class NewsMainInitialPage implements NewsMainState {
  const NewsMainInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsMainInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsMainState.initial()';
  }
}

/// @nodoc

class NewsMainLoadingState implements NewsMainState {
  const NewsMainLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsMainLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsMainState.loading()';
  }
}

/// @nodoc

class NewsMainLoadedState implements NewsMainState {
  const NewsMainLoadedState({required final List<ResultHomeDTO> res})
      : _res = res;

  final List<ResultHomeDTO> _res;
  List<ResultHomeDTO> get res {
    if (_res is EqualUnmodifiableListView) return _res;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_res);
  }

  /// Create a copy of NewsMainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsMainLoadedStateCopyWith<NewsMainLoadedState> get copyWith =>
      _$NewsMainLoadedStateCopyWithImpl<NewsMainLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsMainLoadedState &&
            const DeepCollectionEquality().equals(other._res, _res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_res));

  @override
  String toString() {
    return 'NewsMainState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $NewsMainLoadedStateCopyWith<$Res>
    implements $NewsMainStateCopyWith<$Res> {
  factory $NewsMainLoadedStateCopyWith(
          NewsMainLoadedState value, $Res Function(NewsMainLoadedState) _then) =
      _$NewsMainLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> res});
}

/// @nodoc
class _$NewsMainLoadedStateCopyWithImpl<$Res>
    implements $NewsMainLoadedStateCopyWith<$Res> {
  _$NewsMainLoadedStateCopyWithImpl(this._self, this._then);

  final NewsMainLoadedState _self;
  final $Res Function(NewsMainLoadedState) _then;

  /// Create a copy of NewsMainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(NewsMainLoadedState(
      res: null == res
          ? _self._res
          : res // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class NewsMainErrorState implements NewsMainState {
  const NewsMainErrorState({required this.message});

  final String message;

  /// Create a copy of NewsMainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsMainErrorStateCopyWith<NewsMainErrorState> get copyWith =>
      _$NewsMainErrorStateCopyWithImpl<NewsMainErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsMainErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NewsMainState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NewsMainErrorStateCopyWith<$Res>
    implements $NewsMainStateCopyWith<$Res> {
  factory $NewsMainErrorStateCopyWith(
          NewsMainErrorState value, $Res Function(NewsMainErrorState) _then) =
      _$NewsMainErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NewsMainErrorStateCopyWithImpl<$Res>
    implements $NewsMainErrorStateCopyWith<$Res> {
  _$NewsMainErrorStateCopyWithImpl(this._self, this._then);

  final NewsMainErrorState _self;
  final $Res Function(NewsMainErrorState) _then;

  /// Create a copy of NewsMainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NewsMainErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
