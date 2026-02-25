// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technical_support_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TechnicalSupportState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TechnicalSupportState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TechnicalSupportState()';
  }
}

/// @nodoc
class $TechnicalSupportStateCopyWith<$Res> {
  $TechnicalSupportStateCopyWith(
      TechnicalSupportState _, $Res Function(TechnicalSupportState) __);
}

/// @nodoc

class TechnicalSupportInitialState implements TechnicalSupportState {
  const TechnicalSupportInitialState(
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

  /// Create a copy of TechnicalSupportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TechnicalSupportInitialStateCopyWith<TechnicalSupportInitialState>
      get copyWith => _$TechnicalSupportInitialStateCopyWithImpl<
          TechnicalSupportInitialState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TechnicalSupportInitialState &&
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
    return 'TechnicalSupportState.initial(questions: $questions, channel: $channel, user: $user)';
  }
}

/// @nodoc
abstract mixin class $TechnicalSupportInitialStateCopyWith<$Res>
    implements $TechnicalSupportStateCopyWith<$Res> {
  factory $TechnicalSupportInitialStateCopyWith(
          TechnicalSupportInitialState value,
          $Res Function(TechnicalSupportInitialState) _then) =
      _$TechnicalSupportInitialStateCopyWithImpl;
  @useResult
  $Res call(
      {List<QuestionDTO> questions,
      IOWebSocketChannel? channel,
      UserDto? user});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$TechnicalSupportInitialStateCopyWithImpl<$Res>
    implements $TechnicalSupportInitialStateCopyWith<$Res> {
  _$TechnicalSupportInitialStateCopyWithImpl(this._self, this._then);

  final TechnicalSupportInitialState _self;
  final $Res Function(TechnicalSupportInitialState) _then;

  /// Create a copy of TechnicalSupportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questions = null,
    Object? channel = freezed,
    Object? user = freezed,
  }) {
    return _then(TechnicalSupportInitialState(
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

  /// Create a copy of TechnicalSupportState
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

class TechnicalSupportLoadedState implements TechnicalSupportState {
  const TechnicalSupportLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TechnicalSupportLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TechnicalSupportState.loaded()';
  }
}

/// @nodoc

class TechnicalSupportLoadingState implements TechnicalSupportState {
  const TechnicalSupportLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TechnicalSupportLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TechnicalSupportState.loading()';
  }
}

/// @nodoc

class TechnicalSupportErrorState implements TechnicalSupportState {
  const TechnicalSupportErrorState({required this.message});

  final String message;

  /// Create a copy of TechnicalSupportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TechnicalSupportErrorStateCopyWith<TechnicalSupportErrorState>
      get copyWith =>
          _$TechnicalSupportErrorStateCopyWithImpl<TechnicalSupportErrorState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TechnicalSupportErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TechnicalSupportState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TechnicalSupportErrorStateCopyWith<$Res>
    implements $TechnicalSupportStateCopyWith<$Res> {
  factory $TechnicalSupportErrorStateCopyWith(TechnicalSupportErrorState value,
          $Res Function(TechnicalSupportErrorState) _then) =
      _$TechnicalSupportErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TechnicalSupportErrorStateCopyWithImpl<$Res>
    implements $TechnicalSupportErrorStateCopyWith<$Res> {
  _$TechnicalSupportErrorStateCopyWithImpl(this._self, this._then);

  final TechnicalSupportErrorState _self;
  final $Res Function(TechnicalSupportErrorState) _then;

  /// Create a copy of TechnicalSupportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TechnicalSupportErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
