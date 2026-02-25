// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState()';
  }
}

/// @nodoc
class $NewsStateCopyWith<$Res> {
  $NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}

/// @nodoc

class NewsInitialPage implements NewsState {
  const NewsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState.initial()';
  }
}

/// @nodoc

class NewsLoadingState implements NewsState {
  const NewsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState.loading()';
  }
}

/// @nodoc

class NewsLoadingMoreState implements NewsState {
  const NewsLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState.loadingMore()';
  }
}

/// @nodoc

class NewsLoadedState implements NewsState {
  const NewsLoadedState({required final List<ResultHomeDTO> news})
      : _news = news;

  final List<ResultHomeDTO> _news;
  List<ResultHomeDTO> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsLoadedStateCopyWith<NewsLoadedState> get copyWith =>
      _$NewsLoadedStateCopyWithImpl<NewsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsLoadedState &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  @override
  String toString() {
    return 'NewsState.loaded(news: $news)';
  }
}

/// @nodoc
abstract mixin class $NewsLoadedStateCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory $NewsLoadedStateCopyWith(
          NewsLoadedState value, $Res Function(NewsLoadedState) _then) =
      _$NewsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> news});
}

/// @nodoc
class _$NewsLoadedStateCopyWithImpl<$Res>
    implements $NewsLoadedStateCopyWith<$Res> {
  _$NewsLoadedStateCopyWithImpl(this._self, this._then);

  final NewsLoadedState _self;
  final $Res Function(NewsLoadedState) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? news = null,
  }) {
    return _then(NewsLoadedState(
      news: null == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class NewsErrorState implements NewsState {
  const NewsErrorState({required this.message});

  final String message;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsErrorStateCopyWith<NewsErrorState> get copyWith =>
      _$NewsErrorStateCopyWithImpl<NewsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NewsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NewsErrorStateCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory $NewsErrorStateCopyWith(
          NewsErrorState value, $Res Function(NewsErrorState) _then) =
      _$NewsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NewsErrorStateCopyWithImpl<$Res>
    implements $NewsErrorStateCopyWith<$Res> {
  _$NewsErrorStateCopyWithImpl(this._self, this._then);

  final NewsErrorState _self;
  final $Res Function(NewsErrorState) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NewsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
