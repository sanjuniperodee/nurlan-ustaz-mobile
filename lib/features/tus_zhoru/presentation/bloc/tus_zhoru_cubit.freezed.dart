// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tus_zhoru_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TusZhoruState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TusZhoruState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TusZhoruState()';
  }
}

/// @nodoc
class $TusZhoruStateCopyWith<$Res> {
  $TusZhoruStateCopyWith(TusZhoruState _, $Res Function(TusZhoruState) __);
}

/// @nodoc

class TusZhoruInitialPage implements TusZhoruState {
  const TusZhoruInitialPage(
      {final List<TusZhoruDTO> tusZhoruList = const [],
      final List<TusZhoruDTO> customTusZhoru = const [],
      this.currentIndex = 0,
      this.currentPage = 1})
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
  @JsonKey()
  final int currentPage;

  /// Create a copy of TusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TusZhoruInitialPageCopyWith<TusZhoruInitialPage> get copyWith =>
      _$TusZhoruInitialPageCopyWithImpl<TusZhoruInitialPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruInitialPage &&
            const DeepCollectionEquality()
                .equals(other._tusZhoruList, _tusZhoruList) &&
            const DeepCollectionEquality()
                .equals(other._customTusZhoru, _customTusZhoru) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tusZhoruList),
      const DeepCollectionEquality().hash(_customTusZhoru),
      currentIndex,
      currentPage);

  @override
  String toString() {
    return 'TusZhoruState.initial(tusZhoruList: $tusZhoruList, customTusZhoru: $customTusZhoru, currentIndex: $currentIndex, currentPage: $currentPage)';
  }
}

/// @nodoc
abstract mixin class $TusZhoruInitialPageCopyWith<$Res>
    implements $TusZhoruStateCopyWith<$Res> {
  factory $TusZhoruInitialPageCopyWith(
          TusZhoruInitialPage value, $Res Function(TusZhoruInitialPage) _then) =
      _$TusZhoruInitialPageCopyWithImpl;
  @useResult
  $Res call(
      {List<TusZhoruDTO> tusZhoruList,
      List<TusZhoruDTO> customTusZhoru,
      int currentIndex,
      int currentPage});
}

/// @nodoc
class _$TusZhoruInitialPageCopyWithImpl<$Res>
    implements $TusZhoruInitialPageCopyWith<$Res> {
  _$TusZhoruInitialPageCopyWithImpl(this._self, this._then);

  final TusZhoruInitialPage _self;
  final $Res Function(TusZhoruInitialPage) _then;

  /// Create a copy of TusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tusZhoruList = null,
    Object? customTusZhoru = null,
    Object? currentIndex = null,
    Object? currentPage = null,
  }) {
    return _then(TusZhoruInitialPage(
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
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class TusZhoruLoadingState implements TusZhoruState {
  const TusZhoruLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TusZhoruLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TusZhoruState.loading()';
  }
}

/// @nodoc

class TusZhoruLoadedState implements TusZhoruState {
  const TusZhoruLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TusZhoruLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TusZhoruState.loaded()';
  }
}

/// @nodoc

class TusZhoruErrorState implements TusZhoruState {
  const TusZhoruErrorState({required this.message});

  final String message;

  /// Create a copy of TusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TusZhoruErrorStateCopyWith<TusZhoruErrorState> get copyWith =>
      _$TusZhoruErrorStateCopyWithImpl<TusZhoruErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TusZhoruErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TusZhoruState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TusZhoruErrorStateCopyWith<$Res>
    implements $TusZhoruStateCopyWith<$Res> {
  factory $TusZhoruErrorStateCopyWith(
          TusZhoruErrorState value, $Res Function(TusZhoruErrorState) _then) =
      _$TusZhoruErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TusZhoruErrorStateCopyWithImpl<$Res>
    implements $TusZhoruErrorStateCopyWith<$Res> {
  _$TusZhoruErrorStateCopyWithImpl(this._self, this._then);

  final TusZhoruErrorState _self;
  final $Res Function(TusZhoruErrorState) _then;

  /// Create a copy of TusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TusZhoruErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
