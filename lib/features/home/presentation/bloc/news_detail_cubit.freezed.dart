// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsDetailState()';
  }
}

/// @nodoc
class $NewsDetailStateCopyWith<$Res> {
  $NewsDetailStateCopyWith(
      NewsDetailState _, $Res Function(NewsDetailState) __);
}

/// @nodoc

class NewsDetailInitialPage implements NewsDetailState {
  const NewsDetailInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsDetailInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsDetailState.initial()';
  }
}

/// @nodoc

class NewsDetailLoadingState implements NewsDetailState {
  const NewsDetailLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsDetailLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsDetailState.loading()';
  }
}

/// @nodoc

class NewsDetailLoadedState implements NewsDetailState {
  const NewsDetailLoadedState({required this.res});

  final ResultHomeDTO res;

  /// Create a copy of NewsDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsDetailLoadedStateCopyWith<NewsDetailLoadedState> get copyWith =>
      _$NewsDetailLoadedStateCopyWithImpl<NewsDetailLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsDetailLoadedState &&
            (identical(other.res, res) || other.res == res));
  }

  @override
  int get hashCode => Object.hash(runtimeType, res);

  @override
  String toString() {
    return 'NewsDetailState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $NewsDetailLoadedStateCopyWith<$Res>
    implements $NewsDetailStateCopyWith<$Res> {
  factory $NewsDetailLoadedStateCopyWith(NewsDetailLoadedState value,
          $Res Function(NewsDetailLoadedState) _then) =
      _$NewsDetailLoadedStateCopyWithImpl;
  @useResult
  $Res call({ResultHomeDTO res});

  $ResultHomeDTOCopyWith<$Res> get res;
}

/// @nodoc
class _$NewsDetailLoadedStateCopyWithImpl<$Res>
    implements $NewsDetailLoadedStateCopyWith<$Res> {
  _$NewsDetailLoadedStateCopyWithImpl(this._self, this._then);

  final NewsDetailLoadedState _self;
  final $Res Function(NewsDetailLoadedState) _then;

  /// Create a copy of NewsDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(NewsDetailLoadedState(
      res: null == res
          ? _self.res
          : res // ignore: cast_nullable_to_non_nullable
              as ResultHomeDTO,
    ));
  }

  /// Create a copy of NewsDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultHomeDTOCopyWith<$Res> get res {
    return $ResultHomeDTOCopyWith<$Res>(_self.res, (value) {
      return _then(_self.copyWith(res: value));
    });
  }
}

/// @nodoc

class NewsDetailErrorState implements NewsDetailState {
  const NewsDetailErrorState({required this.message});

  final String message;

  /// Create a copy of NewsDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsDetailErrorStateCopyWith<NewsDetailErrorState> get copyWith =>
      _$NewsDetailErrorStateCopyWithImpl<NewsDetailErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsDetailErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'NewsDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NewsDetailErrorStateCopyWith<$Res>
    implements $NewsDetailStateCopyWith<$Res> {
  factory $NewsDetailErrorStateCopyWith(NewsDetailErrorState value,
          $Res Function(NewsDetailErrorState) _then) =
      _$NewsDetailErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NewsDetailErrorStateCopyWithImpl<$Res>
    implements $NewsDetailErrorStateCopyWith<$Res> {
  _$NewsDetailErrorStateCopyWithImpl(this._self, this._then);

  final NewsDetailErrorState _self;
  final $Res Function(NewsDetailErrorState) _then;

  /// Create a copy of NewsDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NewsDetailErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
