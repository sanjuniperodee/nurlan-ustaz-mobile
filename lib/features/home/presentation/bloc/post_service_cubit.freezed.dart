// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_service_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostServiceState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PostServiceState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PostServiceState()';
  }
}

/// @nodoc
class $PostServiceStateCopyWith<$Res> {
  $PostServiceStateCopyWith(
      PostServiceState _, $Res Function(PostServiceState) __);
}

/// @nodoc

class PostServiceInitialPage implements PostServiceState {
  const PostServiceInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PostServiceInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PostServiceState.initial()';
  }
}

/// @nodoc

class PostServiceLoadingState implements PostServiceState {
  const PostServiceLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PostServiceLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PostServiceState.loading()';
  }
}

/// @nodoc

class PostServiceLoadedState implements PostServiceState {
  const PostServiceLoadedState({required this.url});

  final String url;

  /// Create a copy of PostServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostServiceLoadedStateCopyWith<PostServiceLoadedState> get copyWith =>
      _$PostServiceLoadedStateCopyWithImpl<PostServiceLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostServiceLoadedState &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString() {
    return 'PostServiceState.loaded(url: $url)';
  }
}

/// @nodoc
abstract mixin class $PostServiceLoadedStateCopyWith<$Res>
    implements $PostServiceStateCopyWith<$Res> {
  factory $PostServiceLoadedStateCopyWith(PostServiceLoadedState value,
          $Res Function(PostServiceLoadedState) _then) =
      _$PostServiceLoadedStateCopyWithImpl;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$PostServiceLoadedStateCopyWithImpl<$Res>
    implements $PostServiceLoadedStateCopyWith<$Res> {
  _$PostServiceLoadedStateCopyWithImpl(this._self, this._then);

  final PostServiceLoadedState _self;
  final $Res Function(PostServiceLoadedState) _then;

  /// Create a copy of PostServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
  }) {
    return _then(PostServiceLoadedState(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PostServiceErrorState implements PostServiceState {
  const PostServiceErrorState({required this.message});

  final String message;

  /// Create a copy of PostServiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostServiceErrorStateCopyWith<PostServiceErrorState> get copyWith =>
      _$PostServiceErrorStateCopyWithImpl<PostServiceErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostServiceErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PostServiceState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PostServiceErrorStateCopyWith<$Res>
    implements $PostServiceStateCopyWith<$Res> {
  factory $PostServiceErrorStateCopyWith(PostServiceErrorState value,
          $Res Function(PostServiceErrorState) _then) =
      _$PostServiceErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PostServiceErrorStateCopyWithImpl<$Res>
    implements $PostServiceErrorStateCopyWith<$Res> {
  _$PostServiceErrorStateCopyWithImpl(this._self, this._then);

  final PostServiceErrorState _self;
  final $Res Function(PostServiceErrorState) _then;

  /// Create a copy of PostServiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PostServiceErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
