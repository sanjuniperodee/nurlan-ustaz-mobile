// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayChatState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodayChatState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodayChatState()';
  }
}

/// @nodoc
class $TodayChatStateCopyWith<$Res> {
  $TodayChatStateCopyWith(TodayChatState _, $Res Function(TodayChatState) __);
}

/// @nodoc

class TodayChatInitialState implements TodayChatState {
  const TodayChatInitialState(
      {final List<QuestionDTO> questions = const [], this.channel, this.user})
      : _questions = questions;

  final List<QuestionDTO> _questions;
  @JsonKey()
  List<QuestionDTO> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final IOWebSocketChannel? channel;
  final UserDto? user;

  /// Create a copy of TodayChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodayChatInitialStateCopyWith<TodayChatInitialState> get copyWith =>
      _$TodayChatInitialStateCopyWithImpl<TodayChatInitialState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodayChatInitialState &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_questions), channel, user);

  @override
  String toString() {
    return 'TodayChatState.initial(questions: $questions, channel: $channel, user: $user)';
  }
}

/// @nodoc
abstract mixin class $TodayChatInitialStateCopyWith<$Res>
    implements $TodayChatStateCopyWith<$Res> {
  factory $TodayChatInitialStateCopyWith(TodayChatInitialState value,
          $Res Function(TodayChatInitialState) _then) =
      _$TodayChatInitialStateCopyWithImpl;
  @useResult
  $Res call(
      {List<QuestionDTO> questions,
      IOWebSocketChannel? channel,
      UserDto? user});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$TodayChatInitialStateCopyWithImpl<$Res>
    implements $TodayChatInitialStateCopyWith<$Res> {
  _$TodayChatInitialStateCopyWithImpl(this._self, this._then);

  final TodayChatInitialState _self;
  final $Res Function(TodayChatInitialState) _then;

  /// Create a copy of TodayChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questions = null,
    Object? channel = freezed,
    Object? user = freezed,
  }) {
    return _then(TodayChatInitialState(
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionDTO>,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as IOWebSocketChannel?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
    ));
  }

  /// Create a copy of TodayChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class TodayChatLoadedState implements TodayChatState {
  const TodayChatLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodayChatLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodayChatState.loaded()';
  }
}

/// @nodoc

class TodayChatLoadingState implements TodayChatState {
  const TodayChatLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodayChatLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodayChatState.loading()';
  }
}

/// @nodoc

class TodayChatErrorState implements TodayChatState {
  const TodayChatErrorState({required this.message});

  final String message;

  /// Create a copy of TodayChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodayChatErrorStateCopyWith<TodayChatErrorState> get copyWith =>
      _$TodayChatErrorStateCopyWithImpl<TodayChatErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodayChatErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TodayChatState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TodayChatErrorStateCopyWith<$Res>
    implements $TodayChatStateCopyWith<$Res> {
  factory $TodayChatErrorStateCopyWith(
          TodayChatErrorState value, $Res Function(TodayChatErrorState) _then) =
      _$TodayChatErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TodayChatErrorStateCopyWithImpl<$Res>
    implements $TodayChatErrorStateCopyWith<$Res> {
  _$TodayChatErrorStateCopyWithImpl(this._self, this._then);

  final TodayChatErrorState _self;
  final $Res Function(TodayChatErrorState) _then;

  /// Create a copy of TodayChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TodayChatErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
