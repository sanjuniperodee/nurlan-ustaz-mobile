// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentNewsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentNewsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentNewsState()';
  }
}

/// @nodoc
class $CommentNewsStateCopyWith<$Res> {
  $CommentNewsStateCopyWith(
      CommentNewsState _, $Res Function(CommentNewsState) __);
}

/// @nodoc

class CommentNewsInitialPage implements CommentNewsState {
  const CommentNewsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentNewsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentNewsState.initial()';
  }
}

/// @nodoc

class CommentNewsLoadingState implements CommentNewsState {
  const CommentNewsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentNewsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentNewsState.loading()';
  }
}

/// @nodoc

class CommentNewsLoadingMoreState implements CommentNewsState {
  const CommentNewsLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentNewsLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentNewsState.loadingMore()';
  }
}

/// @nodoc

class CommentNewsLoadedState implements CommentNewsState {
  const CommentNewsLoadedState({required final List<ResultHomeDTO> comments})
      : _comments = comments;

  final List<ResultHomeDTO> _comments;
  List<ResultHomeDTO> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  /// Create a copy of CommentNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentNewsLoadedStateCopyWith<CommentNewsLoadedState> get copyWith =>
      _$CommentNewsLoadedStateCopyWithImpl<CommentNewsLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentNewsLoadedState &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @override
  String toString() {
    return 'CommentNewsState.loaded(comments: $comments)';
  }
}

/// @nodoc
abstract mixin class $CommentNewsLoadedStateCopyWith<$Res>
    implements $CommentNewsStateCopyWith<$Res> {
  factory $CommentNewsLoadedStateCopyWith(CommentNewsLoadedState value,
          $Res Function(CommentNewsLoadedState) _then) =
      _$CommentNewsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> comments});
}

/// @nodoc
class _$CommentNewsLoadedStateCopyWithImpl<$Res>
    implements $CommentNewsLoadedStateCopyWith<$Res> {
  _$CommentNewsLoadedStateCopyWithImpl(this._self, this._then);

  final CommentNewsLoadedState _self;
  final $Res Function(CommentNewsLoadedState) _then;

  /// Create a copy of CommentNewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? comments = null,
  }) {
    return _then(CommentNewsLoadedState(
      comments: null == comments
          ? _self._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class CommentNewsErrorState implements CommentNewsState {
  const CommentNewsErrorState({required this.message});

  final String message;

  /// Create a copy of CommentNewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentNewsErrorStateCopyWith<CommentNewsErrorState> get copyWith =>
      _$CommentNewsErrorStateCopyWithImpl<CommentNewsErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentNewsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CommentNewsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CommentNewsErrorStateCopyWith<$Res>
    implements $CommentNewsStateCopyWith<$Res> {
  factory $CommentNewsErrorStateCopyWith(CommentNewsErrorState value,
          $Res Function(CommentNewsErrorState) _then) =
      _$CommentNewsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CommentNewsErrorStateCopyWithImpl<$Res>
    implements $CommentNewsErrorStateCopyWith<$Res> {
  _$CommentNewsErrorStateCopyWithImpl(this._self, this._then);

  final CommentNewsErrorState _self;
  final $Res Function(CommentNewsErrorState) _then;

  /// Create a copy of CommentNewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CommentNewsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
