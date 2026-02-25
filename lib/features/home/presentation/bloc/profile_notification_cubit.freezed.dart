// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileNotificationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileNotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileNotificationState()';
  }
}

/// @nodoc
class $ProfileNotificationStateCopyWith<$Res> {
  $ProfileNotificationStateCopyWith(
      ProfileNotificationState _, $Res Function(ProfileNotificationState) __);
}

/// @nodoc

class ProfileNotificationInitialPage implements ProfileNotificationState {
  const ProfileNotificationInitialPage(
      {final List<NotificationItemDTO> items = const [],
      this.notificationDTO,
      this.serverNotificationDto})
      : _items = items;

  final List<NotificationItemDTO> _items;
  @JsonKey()
  List<NotificationItemDTO> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final NotificationDTO? notificationDTO;
  final NotificationDTO? serverNotificationDto;

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileNotificationInitialPageCopyWith<ProfileNotificationInitialPage>
      get copyWith => _$ProfileNotificationInitialPageCopyWithImpl<
          ProfileNotificationInitialPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileNotificationInitialPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.notificationDTO, notificationDTO) ||
                other.notificationDTO == notificationDTO) &&
            (identical(other.serverNotificationDto, serverNotificationDto) ||
                other.serverNotificationDto == serverNotificationDto));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      notificationDTO,
      serverNotificationDto);

  @override
  String toString() {
    return 'ProfileNotificationState.initial(items: $items, notificationDTO: $notificationDTO, serverNotificationDto: $serverNotificationDto)';
  }
}

/// @nodoc
abstract mixin class $ProfileNotificationInitialPageCopyWith<$Res>
    implements $ProfileNotificationStateCopyWith<$Res> {
  factory $ProfileNotificationInitialPageCopyWith(
          ProfileNotificationInitialPage value,
          $Res Function(ProfileNotificationInitialPage) _then) =
      _$ProfileNotificationInitialPageCopyWithImpl;
  @useResult
  $Res call(
      {List<NotificationItemDTO> items,
      NotificationDTO? notificationDTO,
      NotificationDTO? serverNotificationDto});

  $NotificationDTOCopyWith<$Res>? get notificationDTO;
  $NotificationDTOCopyWith<$Res>? get serverNotificationDto;
}

/// @nodoc
class _$ProfileNotificationInitialPageCopyWithImpl<$Res>
    implements $ProfileNotificationInitialPageCopyWith<$Res> {
  _$ProfileNotificationInitialPageCopyWithImpl(this._self, this._then);

  final ProfileNotificationInitialPage _self;
  final $Res Function(ProfileNotificationInitialPage) _then;

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? notificationDTO = freezed,
    Object? serverNotificationDto = freezed,
  }) {
    return _then(ProfileNotificationInitialPage(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NotificationItemDTO>,
      notificationDTO: freezed == notificationDTO
          ? _self.notificationDTO
          : notificationDTO // ignore: cast_nullable_to_non_nullable
              as NotificationDTO?,
      serverNotificationDto: freezed == serverNotificationDto
          ? _self.serverNotificationDto
          : serverNotificationDto // ignore: cast_nullable_to_non_nullable
              as NotificationDTO?,
    ));
  }

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDTOCopyWith<$Res>? get notificationDTO {
    if (_self.notificationDTO == null) {
      return null;
    }

    return $NotificationDTOCopyWith<$Res>(_self.notificationDTO!, (value) {
      return _then(_self.copyWith(notificationDTO: value));
    });
  }

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDTOCopyWith<$Res>? get serverNotificationDto {
    if (_self.serverNotificationDto == null) {
      return null;
    }

    return $NotificationDTOCopyWith<$Res>(_self.serverNotificationDto!,
        (value) {
      return _then(_self.copyWith(serverNotificationDto: value));
    });
  }
}

/// @nodoc

class ProfileNotificationLoadingState implements ProfileNotificationState {
  const ProfileNotificationLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileNotificationLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileNotificationState.loading()';
  }
}

/// @nodoc

class ProfileNotificationLoadingMoreState implements ProfileNotificationState {
  const ProfileNotificationLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileNotificationLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileNotificationState.loadingMore()';
  }
}

/// @nodoc

class ProfileNotificationLoadedState implements ProfileNotificationState {
  const ProfileNotificationLoadedState(
      {required final List<ResultHomeDTO> news})
      : _news = news;

  final List<ResultHomeDTO> _news;
  List<ResultHomeDTO> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileNotificationLoadedStateCopyWith<ProfileNotificationLoadedState>
      get copyWith => _$ProfileNotificationLoadedStateCopyWithImpl<
          ProfileNotificationLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileNotificationLoadedState &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  @override
  String toString() {
    return 'ProfileNotificationState.loaded(news: $news)';
  }
}

/// @nodoc
abstract mixin class $ProfileNotificationLoadedStateCopyWith<$Res>
    implements $ProfileNotificationStateCopyWith<$Res> {
  factory $ProfileNotificationLoadedStateCopyWith(
          ProfileNotificationLoadedState value,
          $Res Function(ProfileNotificationLoadedState) _then) =
      _$ProfileNotificationLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> news});
}

/// @nodoc
class _$ProfileNotificationLoadedStateCopyWithImpl<$Res>
    implements $ProfileNotificationLoadedStateCopyWith<$Res> {
  _$ProfileNotificationLoadedStateCopyWithImpl(this._self, this._then);

  final ProfileNotificationLoadedState _self;
  final $Res Function(ProfileNotificationLoadedState) _then;

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? news = null,
  }) {
    return _then(ProfileNotificationLoadedState(
      news: null == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class ProfileNotificationErrorState implements ProfileNotificationState {
  const ProfileNotificationErrorState({required this.message});

  final String message;

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileNotificationErrorStateCopyWith<ProfileNotificationErrorState>
      get copyWith => _$ProfileNotificationErrorStateCopyWithImpl<
          ProfileNotificationErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileNotificationErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProfileNotificationState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProfileNotificationErrorStateCopyWith<$Res>
    implements $ProfileNotificationStateCopyWith<$Res> {
  factory $ProfileNotificationErrorStateCopyWith(
          ProfileNotificationErrorState value,
          $Res Function(ProfileNotificationErrorState) _then) =
      _$ProfileNotificationErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProfileNotificationErrorStateCopyWithImpl<$Res>
    implements $ProfileNotificationErrorStateCopyWith<$Res> {
  _$ProfileNotificationErrorStateCopyWithImpl(this._self, this._then);

  final ProfileNotificationErrorState _self;
  final $Res Function(ProfileNotificationErrorState) _then;

  /// Create a copy of ProfileNotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProfileNotificationErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
