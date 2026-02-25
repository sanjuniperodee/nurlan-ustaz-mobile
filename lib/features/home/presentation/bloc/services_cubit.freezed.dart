// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServicesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServicesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServicesState()';
  }
}

/// @nodoc
class $ServicesStateCopyWith<$Res> {
  $ServicesStateCopyWith(ServicesState _, $Res Function(ServicesState) __);
}

/// @nodoc

class ServicesInitialPage implements ServicesState {
  const ServicesInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServicesInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServicesState.initial()';
  }
}

/// @nodoc

class ServicesLoadingState implements ServicesState {
  const ServicesLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServicesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServicesState.loading()';
  }
}

/// @nodoc

class ServicesLoadingMoreState implements ServicesState {
  const ServicesLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServicesLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ServicesState.loadingMore()';
  }
}

/// @nodoc

class ServicesLoadedState implements ServicesState {
  const ServicesLoadedState({required final List<MediaDTO> media})
      : _media = media;

  final List<MediaDTO> _media;
  List<MediaDTO> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicesLoadedStateCopyWith<ServicesLoadedState> get copyWith =>
      _$ServicesLoadedStateCopyWithImpl<ServicesLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicesLoadedState &&
            const DeepCollectionEquality().equals(other._media, _media));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_media));

  @override
  String toString() {
    return 'ServicesState.loaded(media: $media)';
  }
}

/// @nodoc
abstract mixin class $ServicesLoadedStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory $ServicesLoadedStateCopyWith(
          ServicesLoadedState value, $Res Function(ServicesLoadedState) _then) =
      _$ServicesLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<MediaDTO> media});
}

/// @nodoc
class _$ServicesLoadedStateCopyWithImpl<$Res>
    implements $ServicesLoadedStateCopyWith<$Res> {
  _$ServicesLoadedStateCopyWithImpl(this._self, this._then);

  final ServicesLoadedState _self;
  final $Res Function(ServicesLoadedState) _then;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? media = null,
  }) {
    return _then(ServicesLoadedState(
      media: null == media
          ? _self._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>,
    ));
  }
}

/// @nodoc

class ServicesErrorState implements ServicesState {
  const ServicesErrorState({required this.message});

  final String message;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServicesErrorStateCopyWith<ServicesErrorState> get copyWith =>
      _$ServicesErrorStateCopyWithImpl<ServicesErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServicesErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ServicesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ServicesErrorStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory $ServicesErrorStateCopyWith(
          ServicesErrorState value, $Res Function(ServicesErrorState) _then) =
      _$ServicesErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ServicesErrorStateCopyWithImpl<$Res>
    implements $ServicesErrorStateCopyWith<$Res> {
  _$ServicesErrorStateCopyWithImpl(this._self, this._then);

  final ServicesErrorState _self;
  final $Res Function(ServicesErrorState) _then;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ServicesErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
