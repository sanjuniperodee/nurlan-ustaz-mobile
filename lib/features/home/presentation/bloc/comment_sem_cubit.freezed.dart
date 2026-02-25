// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_sem_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentSemState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentSemState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemState()';
  }
}

/// @nodoc
class $CommentSemStateCopyWith<$Res> {
  $CommentSemStateCopyWith(
      CommentSemState _, $Res Function(CommentSemState) __);
}

/// @nodoc

class CommentSemInitialPage implements CommentSemState {
  const CommentSemInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentSemInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemState.initial()';
  }
}

/// @nodoc

class CommentSemLoadingState implements CommentSemState {
  const CommentSemLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentSemLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemState.loading()';
  }
}

/// @nodoc

class CommentSemLoadingMoreState implements CommentSemState {
  const CommentSemLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemState.loadingMore()';
  }
}

/// @nodoc

class CommentSemLoadedState implements CommentSemState {
  const CommentSemLoadedState({required final List<ResultHomeDTO> comments})
      : _comments = comments;

  final List<ResultHomeDTO> _comments;
  List<ResultHomeDTO> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  /// Create a copy of CommentSemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentSemLoadedStateCopyWith<CommentSemLoadedState> get copyWith =>
      _$CommentSemLoadedStateCopyWithImpl<CommentSemLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemLoadedState &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @override
  String toString() {
    return 'CommentSemState.loaded(comments: $comments)';
  }
}

/// @nodoc
abstract mixin class $CommentSemLoadedStateCopyWith<$Res>
    implements $CommentSemStateCopyWith<$Res> {
  factory $CommentSemLoadedStateCopyWith(CommentSemLoadedState value,
          $Res Function(CommentSemLoadedState) _then) =
      _$CommentSemLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> comments});
}

/// @nodoc
class _$CommentSemLoadedStateCopyWithImpl<$Res>
    implements $CommentSemLoadedStateCopyWith<$Res> {
  _$CommentSemLoadedStateCopyWithImpl(this._self, this._then);

  final CommentSemLoadedState _self;
  final $Res Function(CommentSemLoadedState) _then;

  /// Create a copy of CommentSemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? comments = null,
  }) {
    return _then(CommentSemLoadedState(
      comments: null == comments
          ? _self._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class CommentSemErrorState implements CommentSemState {
  const CommentSemErrorState({required this.message});

  final String message;

  /// Create a copy of CommentSemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentSemErrorStateCopyWith<CommentSemErrorState> get copyWith =>
      _$CommentSemErrorStateCopyWithImpl<CommentSemErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CommentSemState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CommentSemErrorStateCopyWith<$Res>
    implements $CommentSemStateCopyWith<$Res> {
  factory $CommentSemErrorStateCopyWith(CommentSemErrorState value,
          $Res Function(CommentSemErrorState) _then) =
      _$CommentSemErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CommentSemErrorStateCopyWithImpl<$Res>
    implements $CommentSemErrorStateCopyWith<$Res> {
  _$CommentSemErrorStateCopyWithImpl(this._self, this._then);

  final CommentSemErrorState _self;
  final $Res Function(CommentSemErrorState) _then;

  /// Create a copy of CommentSemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CommentSemErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
