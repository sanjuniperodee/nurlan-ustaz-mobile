// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_chats_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalendarChatsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CalendarChatsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarChatsState()';
  }
}

/// @nodoc
class $CalendarChatsStateCopyWith<$Res> {
  $CalendarChatsStateCopyWith(
      CalendarChatsState _, $Res Function(CalendarChatsState) __);
}

/// @nodoc

class CalendarChatsInitialState implements CalendarChatsState {
  const CalendarChatsInitialState(
      {final List<ChatDTO>? chats,
      final List<QuestionDTO>? questions,
      this.isLoading = false})
      : _chats = chats,
        _questions = questions;

  final List<ChatDTO>? _chats;
  List<ChatDTO>? get chats {
    final value = _chats;
    if (value == null) return null;
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<QuestionDTO>? _questions;
  List<QuestionDTO>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey()
  final bool isLoading;

  /// Create a copy of CalendarChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarChatsInitialStateCopyWith<CalendarChatsInitialState> get copyWith =>
      _$CalendarChatsInitialStateCopyWithImpl<CalendarChatsInitialState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarChatsInitialState &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chats),
      const DeepCollectionEquality().hash(_questions),
      isLoading);

  @override
  String toString() {
    return 'CalendarChatsState.initial(chats: $chats, questions: $questions, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $CalendarChatsInitialStateCopyWith<$Res>
    implements $CalendarChatsStateCopyWith<$Res> {
  factory $CalendarChatsInitialStateCopyWith(CalendarChatsInitialState value,
          $Res Function(CalendarChatsInitialState) _then) =
      _$CalendarChatsInitialStateCopyWithImpl;
  @useResult
  $Res call(
      {List<ChatDTO>? chats, List<QuestionDTO>? questions, bool isLoading});
}

/// @nodoc
class _$CalendarChatsInitialStateCopyWithImpl<$Res>
    implements $CalendarChatsInitialStateCopyWith<$Res> {
  _$CalendarChatsInitialStateCopyWithImpl(this._self, this._then);

  final CalendarChatsInitialState _self;
  final $Res Function(CalendarChatsInitialState) _then;

  /// Create a copy of CalendarChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chats = freezed,
    Object? questions = freezed,
    Object? isLoading = null,
  }) {
    return _then(CalendarChatsInitialState(
      chats: freezed == chats
          ? _self._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatDTO>?,
      questions: freezed == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionDTO>?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class CalendarChatsLoadedState implements CalendarChatsState {
  const CalendarChatsLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CalendarChatsLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarChatsState.loaded()';
  }
}

/// @nodoc

class CalendarChatsLoadingState implements CalendarChatsState {
  const CalendarChatsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarChatsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CalendarChatsState.loading()';
  }
}

/// @nodoc

class CalendarChatsErrorState implements CalendarChatsState {
  const CalendarChatsErrorState({required this.message});

  final String message;

  /// Create a copy of CalendarChatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalendarChatsErrorStateCopyWith<CalendarChatsErrorState> get copyWith =>
      _$CalendarChatsErrorStateCopyWithImpl<CalendarChatsErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalendarChatsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CalendarChatsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CalendarChatsErrorStateCopyWith<$Res>
    implements $CalendarChatsStateCopyWith<$Res> {
  factory $CalendarChatsErrorStateCopyWith(CalendarChatsErrorState value,
          $Res Function(CalendarChatsErrorState) _then) =
      _$CalendarChatsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CalendarChatsErrorStateCopyWithImpl<$Res>
    implements $CalendarChatsErrorStateCopyWith<$Res> {
  _$CalendarChatsErrorStateCopyWithImpl(this._self, this._then);

  final CalendarChatsErrorState _self;
  final $Res Function(CalendarChatsErrorState) _then;

  /// Create a copy of CalendarChatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CalendarChatsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
