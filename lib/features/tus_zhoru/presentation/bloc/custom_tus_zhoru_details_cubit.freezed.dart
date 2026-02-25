// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_tus_zhoru_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomTusZhoruDetailsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomTusZhoruDetailsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomTusZhoruDetailsState()';
  }
}

/// @nodoc
class $CustomTusZhoruDetailsStateCopyWith<$Res> {
  $CustomTusZhoruDetailsStateCopyWith(CustomTusZhoruDetailsState _,
      $Res Function(CustomTusZhoruDetailsState) __);
}

/// @nodoc

class CustomTusZhoruDetailsInitialPage implements CustomTusZhoruDetailsState {
  const CustomTusZhoruDetailsInitialPage(
      {final List<TusZhoruDTO> tusZhoruList = const [],
      final List<TusZhoruDTO> customTusZhoru = const [],
      this.currentIndex = 0})
      : _tusZhoruList = tusZhoruList,
        _customTusZhoru = customTusZhoru;

  final List<TusZhoruDTO> _tusZhoruList;
  @JsonKey()
  List<TusZhoruDTO> get tusZhoruList {
    if (_tusZhoruList is EqualUnmodifiableListView) return _tusZhoruList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tusZhoruList);
  }

  final List<TusZhoruDTO> _customTusZhoru;
  @JsonKey()
  List<TusZhoruDTO> get customTusZhoru {
    if (_customTusZhoru is EqualUnmodifiableListView) return _customTusZhoru;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customTusZhoru);
  }

  @JsonKey()
  final int currentIndex;

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomTusZhoruDetailsInitialPageCopyWith<CustomTusZhoruDetailsInitialPage>
      get copyWith => _$CustomTusZhoruDetailsInitialPageCopyWithImpl<
          CustomTusZhoruDetailsInitialPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomTusZhoruDetailsInitialPage &&
            const DeepCollectionEquality()
                .equals(other._tusZhoruList, _tusZhoruList) &&
            const DeepCollectionEquality()
                .equals(other._customTusZhoru, _customTusZhoru) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tusZhoruList),
      const DeepCollectionEquality().hash(_customTusZhoru),
      currentIndex);

  @override
  String toString() {
    return 'CustomTusZhoruDetailsState.initial(tusZhoruList: $tusZhoruList, customTusZhoru: $customTusZhoru, currentIndex: $currentIndex)';
  }
}

/// @nodoc
abstract mixin class $CustomTusZhoruDetailsInitialPageCopyWith<$Res>
    implements $CustomTusZhoruDetailsStateCopyWith<$Res> {
  factory $CustomTusZhoruDetailsInitialPageCopyWith(
          CustomTusZhoruDetailsInitialPage value,
          $Res Function(CustomTusZhoruDetailsInitialPage) _then) =
      _$CustomTusZhoruDetailsInitialPageCopyWithImpl;
  @useResult
  $Res call(
      {List<TusZhoruDTO> tusZhoruList,
      List<TusZhoruDTO> customTusZhoru,
      int currentIndex});
}

/// @nodoc
class _$CustomTusZhoruDetailsInitialPageCopyWithImpl<$Res>
    implements $CustomTusZhoruDetailsInitialPageCopyWith<$Res> {
  _$CustomTusZhoruDetailsInitialPageCopyWithImpl(this._self, this._then);

  final CustomTusZhoruDetailsInitialPage _self;
  final $Res Function(CustomTusZhoruDetailsInitialPage) _then;

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tusZhoruList = null,
    Object? customTusZhoru = null,
    Object? currentIndex = null,
  }) {
    return _then(CustomTusZhoruDetailsInitialPage(
      tusZhoruList: null == tusZhoruList
          ? _self._tusZhoruList
          : tusZhoruList // ignore: cast_nullable_to_non_nullable
              as List<TusZhoruDTO>,
      customTusZhoru: null == customTusZhoru
          ? _self._customTusZhoru
          : customTusZhoru // ignore: cast_nullable_to_non_nullable
              as List<TusZhoruDTO>,
      currentIndex: null == currentIndex
          ? _self.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CustomTusZhoruDetailsLoadingState implements CustomTusZhoruDetailsState {
  const CustomTusZhoruDetailsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomTusZhoruDetailsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CustomTusZhoruDetailsState.loading()';
  }
}

/// @nodoc

class CustomTusZhoruDetailsLoadedState implements CustomTusZhoruDetailsState {
  const CustomTusZhoruDetailsLoadedState(this.tusZhoru);

  final TusZhoruDTO? tusZhoru;

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomTusZhoruDetailsLoadedStateCopyWith<CustomTusZhoruDetailsLoadedState>
      get copyWith => _$CustomTusZhoruDetailsLoadedStateCopyWithImpl<
          CustomTusZhoruDetailsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomTusZhoruDetailsLoadedState &&
            (identical(other.tusZhoru, tusZhoru) ||
                other.tusZhoru == tusZhoru));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tusZhoru);

  @override
  String toString() {
    return 'CustomTusZhoruDetailsState.loaded(tusZhoru: $tusZhoru)';
  }
}

/// @nodoc
abstract mixin class $CustomTusZhoruDetailsLoadedStateCopyWith<$Res>
    implements $CustomTusZhoruDetailsStateCopyWith<$Res> {
  factory $CustomTusZhoruDetailsLoadedStateCopyWith(
          CustomTusZhoruDetailsLoadedState value,
          $Res Function(CustomTusZhoruDetailsLoadedState) _then) =
      _$CustomTusZhoruDetailsLoadedStateCopyWithImpl;
  @useResult
  $Res call({TusZhoruDTO? tusZhoru});

  $TusZhoruDTOCopyWith<$Res>? get tusZhoru;
}

/// @nodoc
class _$CustomTusZhoruDetailsLoadedStateCopyWithImpl<$Res>
    implements $CustomTusZhoruDetailsLoadedStateCopyWith<$Res> {
  _$CustomTusZhoruDetailsLoadedStateCopyWithImpl(this._self, this._then);

  final CustomTusZhoruDetailsLoadedState _self;
  final $Res Function(CustomTusZhoruDetailsLoadedState) _then;

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tusZhoru = freezed,
  }) {
    return _then(CustomTusZhoruDetailsLoadedState(
      freezed == tusZhoru
          ? _self.tusZhoru
          : tusZhoru // ignore: cast_nullable_to_non_nullable
              as TusZhoruDTO?,
    ));
  }

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TusZhoruDTOCopyWith<$Res>? get tusZhoru {
    if (_self.tusZhoru == null) {
      return null;
    }

    return $TusZhoruDTOCopyWith<$Res>(_self.tusZhoru!, (value) {
      return _then(_self.copyWith(tusZhoru: value));
    });
  }
}

/// @nodoc

class CustomTusZhoruDetailsErrorState implements CustomTusZhoruDetailsState {
  const CustomTusZhoruDetailsErrorState({required this.message});

  final String message;

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomTusZhoruDetailsErrorStateCopyWith<CustomTusZhoruDetailsErrorState>
      get copyWith => _$CustomTusZhoruDetailsErrorStateCopyWithImpl<
          CustomTusZhoruDetailsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomTusZhoruDetailsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CustomTusZhoruDetailsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CustomTusZhoruDetailsErrorStateCopyWith<$Res>
    implements $CustomTusZhoruDetailsStateCopyWith<$Res> {
  factory $CustomTusZhoruDetailsErrorStateCopyWith(
          CustomTusZhoruDetailsErrorState value,
          $Res Function(CustomTusZhoruDetailsErrorState) _then) =
      _$CustomTusZhoruDetailsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CustomTusZhoruDetailsErrorStateCopyWithImpl<$Res>
    implements $CustomTusZhoruDetailsErrorStateCopyWith<$Res> {
  _$CustomTusZhoruDetailsErrorStateCopyWithImpl(this._self, this._then);

  final CustomTusZhoruDetailsErrorState _self;
  final $Res Function(CustomTusZhoruDetailsErrorState) _then;

  /// Create a copy of CustomTusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CustomTusZhoruDetailsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
