// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_boarding_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnBoardingState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnBoardingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnBoardingState()';
  }
}

/// @nodoc
class $OnBoardingStateCopyWith<$Res> {
  $OnBoardingStateCopyWith(
      OnBoardingState _, $Res Function(OnBoardingState) __);
}

/// @nodoc

class OnBoardingInitialPage implements OnBoardingState {
  const OnBoardingInitialPage(
      {final List<OnBoardingVideoDTO> videoList = const []})
      : _videoList = videoList;

  final List<OnBoardingVideoDTO> _videoList;
  @JsonKey()
  List<OnBoardingVideoDTO> get videoList {
    if (_videoList is EqualUnmodifiableListView) return _videoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoList);
  }

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnBoardingInitialPageCopyWith<OnBoardingInitialPage> get copyWith =>
      _$OnBoardingInitialPageCopyWithImpl<OnBoardingInitialPage>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnBoardingInitialPage &&
            const DeepCollectionEquality()
                .equals(other._videoList, _videoList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_videoList));

  @override
  String toString() {
    return 'OnBoardingState.initial(videoList: $videoList)';
  }
}

/// @nodoc
abstract mixin class $OnBoardingInitialPageCopyWith<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  factory $OnBoardingInitialPageCopyWith(OnBoardingInitialPage value,
          $Res Function(OnBoardingInitialPage) _then) =
      _$OnBoardingInitialPageCopyWithImpl;
  @useResult
  $Res call({List<OnBoardingVideoDTO> videoList});
}

/// @nodoc
class _$OnBoardingInitialPageCopyWithImpl<$Res>
    implements $OnBoardingInitialPageCopyWith<$Res> {
  _$OnBoardingInitialPageCopyWithImpl(this._self, this._then);

  final OnBoardingInitialPage _self;
  final $Res Function(OnBoardingInitialPage) _then;

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoList = null,
  }) {
    return _then(OnBoardingInitialPage(
      videoList: null == videoList
          ? _self._videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<OnBoardingVideoDTO>,
    ));
  }
}

/// @nodoc

class OnBoardingLoadingState implements OnBoardingState {
  const OnBoardingLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnBoardingLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnBoardingState.loading()';
  }
}

/// @nodoc

class OnBoardingLoadedState implements OnBoardingState {
  const OnBoardingLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnBoardingLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OnBoardingState.loaded()';
  }
}

/// @nodoc

class OnBoardingErrorState implements OnBoardingState {
  const OnBoardingErrorState({required this.message});

  final String message;

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnBoardingErrorStateCopyWith<OnBoardingErrorState> get copyWith =>
      _$OnBoardingErrorStateCopyWithImpl<OnBoardingErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnBoardingErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'OnBoardingState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $OnBoardingErrorStateCopyWith<$Res>
    implements $OnBoardingStateCopyWith<$Res> {
  factory $OnBoardingErrorStateCopyWith(OnBoardingErrorState value,
          $Res Function(OnBoardingErrorState) _then) =
      _$OnBoardingErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$OnBoardingErrorStateCopyWithImpl<$Res>
    implements $OnBoardingErrorStateCopyWith<$Res> {
  _$OnBoardingErrorStateCopyWithImpl(this._self, this._then);

  final OnBoardingErrorState _self;
  final $Res Function(OnBoardingErrorState) _then;

  /// Create a copy of OnBoardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(OnBoardingErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
