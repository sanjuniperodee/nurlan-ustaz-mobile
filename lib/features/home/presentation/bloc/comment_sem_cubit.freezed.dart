// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_sem_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentSemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function() loadingMoreState,
    required TResult Function(List<ResultHomeDTO> comments) loaded,
    required TResult Function(String message) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function()? loadingMoreState,
    TResult? Function(List<ResultHomeDTO> comments)? loaded,
    TResult? Function(String message)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function()? loadingMoreState,
    TResult Function(List<ResultHomeDTO> comments)? loaded,
    TResult Function(String message)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialPage value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadingMoreState value) loadingMoreState,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialPage value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadingMoreState value)? loadingMoreState,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? errorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialPage value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadingMoreState value)? loadingMoreState,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentSemStateCopyWith<$Res> {
  factory $CommentSemStateCopyWith(
          CommentSemState value, $Res Function(CommentSemState) then) =
      _$CommentSemStateCopyWithImpl<$Res, CommentSemState>;
}

/// @nodoc
class _$CommentSemStateCopyWithImpl<$Res, $Val extends CommentSemState>
    implements $CommentSemStateCopyWith<$Res> {
  _$CommentSemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialPageImplCopyWith<$Res> {
  factory _$$InitialPageImplCopyWith(
          _$InitialPageImpl value, $Res Function(_$InitialPageImpl) then) =
      __$$InitialPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialPageImplCopyWithImpl<$Res>
    extends _$CommentSemStateCopyWithImpl<$Res, _$InitialPageImpl>
    implements _$$InitialPageImplCopyWith<$Res> {
  __$$InitialPageImplCopyWithImpl(
      _$InitialPageImpl _value, $Res Function(_$InitialPageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialPageImpl implements _InitialPage {
  const _$InitialPageImpl();

  @override
  String toString() {
    return 'CommentSemState.initialState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function() loadingMoreState,
    required TResult Function(List<ResultHomeDTO> comments) loaded,
    required TResult Function(String message) errorState,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function()? loadingMoreState,
    TResult? Function(List<ResultHomeDTO> comments)? loaded,
    TResult? Function(String message)? errorState,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function()? loadingMoreState,
    TResult Function(List<ResultHomeDTO> comments)? loaded,
    TResult Function(String message)? errorState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialPage value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadingMoreState value) loadingMoreState,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialPage value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadingMoreState value)? loadingMoreState,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialPage value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadingMoreState value)? loadingMoreState,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class _InitialPage implements CommentSemState {
  const factory _InitialPage() = _$InitialPageImpl;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$CommentSemStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'CommentSemState.loadingState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function() loadingMoreState,
    required TResult Function(List<ResultHomeDTO> comments) loaded,
    required TResult Function(String message) errorState,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function()? loadingMoreState,
    TResult? Function(List<ResultHomeDTO> comments)? loaded,
    TResult? Function(String message)? errorState,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function()? loadingMoreState,
    TResult Function(List<ResultHomeDTO> comments)? loaded,
    TResult Function(String message)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialPage value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadingMoreState value) loadingMoreState,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialPage value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadingMoreState value)? loadingMoreState,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialPage value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadingMoreState value)? loadingMoreState,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements CommentSemState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$LoadingMoreStateImplCopyWith<$Res> {
  factory _$$LoadingMoreStateImplCopyWith(_$LoadingMoreStateImpl value,
          $Res Function(_$LoadingMoreStateImpl) then) =
      __$$LoadingMoreStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingMoreStateImplCopyWithImpl<$Res>
    extends _$CommentSemStateCopyWithImpl<$Res, _$LoadingMoreStateImpl>
    implements _$$LoadingMoreStateImplCopyWith<$Res> {
  __$$LoadingMoreStateImplCopyWithImpl(_$LoadingMoreStateImpl _value,
      $Res Function(_$LoadingMoreStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingMoreStateImpl implements _LoadingMoreState {
  const _$LoadingMoreStateImpl();

  @override
  String toString() {
    return 'CommentSemState.loadingMoreState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingMoreStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function() loadingMoreState,
    required TResult Function(List<ResultHomeDTO> comments) loaded,
    required TResult Function(String message) errorState,
  }) {
    return loadingMoreState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function()? loadingMoreState,
    TResult? Function(List<ResultHomeDTO> comments)? loaded,
    TResult? Function(String message)? errorState,
  }) {
    return loadingMoreState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function()? loadingMoreState,
    TResult Function(List<ResultHomeDTO> comments)? loaded,
    TResult Function(String message)? errorState,
    required TResult orElse(),
  }) {
    if (loadingMoreState != null) {
      return loadingMoreState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialPage value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadingMoreState value) loadingMoreState,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loadingMoreState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialPage value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadingMoreState value)? loadingMoreState,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loadingMoreState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialPage value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadingMoreState value)? loadingMoreState,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loadingMoreState != null) {
      return loadingMoreState(this);
    }
    return orElse();
  }
}

abstract class _LoadingMoreState implements CommentSemState {
  const factory _LoadingMoreState() = _$LoadingMoreStateImpl;
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ResultHomeDTO> comments});
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$CommentSemStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_$LoadedStateImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class _$LoadedStateImpl implements _LoadedState {
  const _$LoadedStateImpl({required final List<ResultHomeDTO> comments})
      : _comments = comments;

  final List<ResultHomeDTO> _comments;
  @override
  List<ResultHomeDTO> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommentSemState.loaded(comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      __$$LoadedStateImplCopyWithImpl<_$LoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function() loadingMoreState,
    required TResult Function(List<ResultHomeDTO> comments) loaded,
    required TResult Function(String message) errorState,
  }) {
    return loaded(comments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function()? loadingMoreState,
    TResult? Function(List<ResultHomeDTO> comments)? loaded,
    TResult? Function(String message)? errorState,
  }) {
    return loaded?.call(comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function()? loadingMoreState,
    TResult Function(List<ResultHomeDTO> comments)? loaded,
    TResult Function(String message)? errorState,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialPage value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadingMoreState value) loadingMoreState,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialPage value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadingMoreState value)? loadingMoreState,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialPage value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadingMoreState value)? loadingMoreState,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements CommentSemState {
  const factory _LoadedState({required final List<ResultHomeDTO> comments}) =
      _$LoadedStateImpl;

  List<ResultHomeDTO> get comments;
  @JsonKey(ignore: true)
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$CommentSemStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CommentSemState.errorState(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function() loadingMoreState,
    required TResult Function(List<ResultHomeDTO> comments) loaded,
    required TResult Function(String message) errorState,
  }) {
    return errorState(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialState,
    TResult? Function()? loadingState,
    TResult? Function()? loadingMoreState,
    TResult? Function(List<ResultHomeDTO> comments)? loaded,
    TResult? Function(String message)? errorState,
  }) {
    return errorState?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function()? loadingMoreState,
    TResult Function(List<ResultHomeDTO> comments)? loaded,
    TResult Function(String message)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialPage value) initialState,
    required TResult Function(_LoadingState value) loadingState,
    required TResult Function(_LoadingMoreState value) loadingMoreState,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) errorState,
  }) {
    return errorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialPage value)? initialState,
    TResult? Function(_LoadingState value)? loadingState,
    TResult? Function(_LoadingMoreState value)? loadingMoreState,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? errorState,
  }) {
    return errorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialPage value)? initialState,
    TResult Function(_LoadingState value)? loadingState,
    TResult Function(_LoadingMoreState value)? loadingMoreState,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? errorState,
    required TResult orElse(),
  }) {
    if (errorState != null) {
      return errorState(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements CommentSemState {
  const factory _ErrorState({required final String message}) = _$ErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
