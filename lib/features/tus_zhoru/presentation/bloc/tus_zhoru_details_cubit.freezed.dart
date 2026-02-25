// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tus_zhoru_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TusZhoruDetailsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TusZhoruDetailsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TusZhoruDetailsState()';
  }
}

/// @nodoc
class $TusZhoruDetailsStateCopyWith<$Res> {
  $TusZhoruDetailsStateCopyWith(
      TusZhoruDetailsState _, $Res Function(TusZhoruDetailsState) __);
}

/// @nodoc

class TusZhoruDetailsInitialPage implements TusZhoruDetailsState {
  const TusZhoruDetailsInitialPage(
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

  /// Create a copy of TusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TusZhoruDetailsInitialPageCopyWith<TusZhoruDetailsInitialPage>
      get copyWith =>
          _$TusZhoruDetailsInitialPageCopyWithImpl<TusZhoruDetailsInitialPage>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruDetailsInitialPage &&
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
    return 'TusZhoruDetailsState.initial(tusZhoruList: $tusZhoruList, customTusZhoru: $customTusZhoru, currentIndex: $currentIndex)';
  }
}

/// @nodoc
abstract mixin class $TusZhoruDetailsInitialPageCopyWith<$Res>
    implements $TusZhoruDetailsStateCopyWith<$Res> {
  factory $TusZhoruDetailsInitialPageCopyWith(TusZhoruDetailsInitialPage value,
          $Res Function(TusZhoruDetailsInitialPage) _then) =
      _$TusZhoruDetailsInitialPageCopyWithImpl;
  @useResult
  $Res call(
      {List<TusZhoruDTO> tusZhoruList,
      List<TusZhoruDTO> customTusZhoru,
      int currentIndex});
}

/// @nodoc
class _$TusZhoruDetailsInitialPageCopyWithImpl<$Res>
    implements $TusZhoruDetailsInitialPageCopyWith<$Res> {
  _$TusZhoruDetailsInitialPageCopyWithImpl(this._self, this._then);

  final TusZhoruDetailsInitialPage _self;
  final $Res Function(TusZhoruDetailsInitialPage) _then;

  /// Create a copy of TusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tusZhoruList = null,
    Object? customTusZhoru = null,
    Object? currentIndex = null,
  }) {
    return _then(TusZhoruDetailsInitialPage(
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

class TusZhoruDetailsLoadingState implements TusZhoruDetailsState {
  const TusZhoruDetailsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruDetailsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TusZhoruDetailsState.loading()';
  }
}

/// @nodoc

class TusZhoruDetailsLoadedState implements TusZhoruDetailsState {
  const TusZhoruDetailsLoadedState(this.tusZhoru);

  final TusZhoruDTO? tusZhoru;

  /// Create a copy of TusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TusZhoruDetailsLoadedStateCopyWith<TusZhoruDetailsLoadedState>
      get copyWith =>
          _$TusZhoruDetailsLoadedStateCopyWithImpl<TusZhoruDetailsLoadedState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruDetailsLoadedState &&
            (identical(other.tusZhoru, tusZhoru) ||
                other.tusZhoru == tusZhoru));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tusZhoru);

  @override
  String toString() {
    return 'TusZhoruDetailsState.loaded(tusZhoru: $tusZhoru)';
  }
}

/// @nodoc
abstract mixin class $TusZhoruDetailsLoadedStateCopyWith<$Res>
    implements $TusZhoruDetailsStateCopyWith<$Res> {
  factory $TusZhoruDetailsLoadedStateCopyWith(TusZhoruDetailsLoadedState value,
          $Res Function(TusZhoruDetailsLoadedState) _then) =
      _$TusZhoruDetailsLoadedStateCopyWithImpl;
  @useResult
  $Res call({TusZhoruDTO? tusZhoru});

  $TusZhoruDTOCopyWith<$Res>? get tusZhoru;
}

/// @nodoc
class _$TusZhoruDetailsLoadedStateCopyWithImpl<$Res>
    implements $TusZhoruDetailsLoadedStateCopyWith<$Res> {
  _$TusZhoruDetailsLoadedStateCopyWithImpl(this._self, this._then);

  final TusZhoruDetailsLoadedState _self;
  final $Res Function(TusZhoruDetailsLoadedState) _then;

  /// Create a copy of TusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tusZhoru = freezed,
  }) {
    return _then(TusZhoruDetailsLoadedState(
      freezed == tusZhoru
          ? _self.tusZhoru
          : tusZhoru // ignore: cast_nullable_to_non_nullable
              as TusZhoruDTO?,
    ));
  }

  /// Create a copy of TusZhoruDetailsState
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

class TusZhoruDetailsErrorState implements TusZhoruDetailsState {
  const TusZhoruDetailsErrorState({required this.message});

  final String message;

  /// Create a copy of TusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TusZhoruDetailsErrorStateCopyWith<TusZhoruDetailsErrorState> get copyWith =>
      _$TusZhoruDetailsErrorStateCopyWithImpl<TusZhoruDetailsErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruDetailsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TusZhoruDetailsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TusZhoruDetailsErrorStateCopyWith<$Res>
    implements $TusZhoruDetailsStateCopyWith<$Res> {
  factory $TusZhoruDetailsErrorStateCopyWith(TusZhoruDetailsErrorState value,
          $Res Function(TusZhoruDetailsErrorState) _then) =
      _$TusZhoruDetailsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TusZhoruDetailsErrorStateCopyWithImpl<$Res>
    implements $TusZhoruDetailsErrorStateCopyWith<$Res> {
  _$TusZhoruDetailsErrorStateCopyWithImpl(this._self, this._then);

  final TusZhoruDetailsErrorState _self;
  final $Res Function(TusZhoruDetailsErrorState) _then;

  /// Create a copy of TusZhoruDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TusZhoruDetailsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
