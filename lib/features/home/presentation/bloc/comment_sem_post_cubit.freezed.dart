// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_sem_post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentSemPostState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CommentSemPostState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemPostState()';
  }
}

/// @nodoc
class $CommentSemPostStateCopyWith<$Res> {
  $CommentSemPostStateCopyWith(
      CommentSemPostState _, $Res Function(CommentSemPostState) __);
}

/// @nodoc

class CommentSemPostInitialPage implements CommentSemPostState {
  const CommentSemPostInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemPostInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemPostState.initial()';
  }
}

/// @nodoc

class CommentSemPostLoadingState implements CommentSemPostState {
  const CommentSemPostLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemPostLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemPostState.loading()';
  }
}

/// @nodoc

class CommentSemPostLoadedState implements CommentSemPostState {
  const CommentSemPostLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemPostLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CommentSemPostState.loaded()';
  }
}

/// @nodoc

class CommentSemPostErrorState implements CommentSemPostState {
  const CommentSemPostErrorState({required this.message});

  final String message;

  /// Create a copy of CommentSemPostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentSemPostErrorStateCopyWith<CommentSemPostErrorState> get copyWith =>
      _$CommentSemPostErrorStateCopyWithImpl<CommentSemPostErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentSemPostErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CommentSemPostState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CommentSemPostErrorStateCopyWith<$Res>
    implements $CommentSemPostStateCopyWith<$Res> {
  factory $CommentSemPostErrorStateCopyWith(CommentSemPostErrorState value,
          $Res Function(CommentSemPostErrorState) _then) =
      _$CommentSemPostErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CommentSemPostErrorStateCopyWithImpl<$Res>
    implements $CommentSemPostErrorStateCopyWith<$Res> {
  _$CommentSemPostErrorStateCopyWithImpl(this._self, this._then);

  final CommentSemPostErrorState _self;
  final $Res Function(CommentSemPostErrorState) _then;

  /// Create a copy of CommentSemPostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CommentSemPostErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
