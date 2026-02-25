// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dhikrs_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DhikrsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DhikrsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DhikrsState()';
  }
}

/// @nodoc
class $DhikrsStateCopyWith<$Res> {
  $DhikrsStateCopyWith(DhikrsState _, $Res Function(DhikrsState) __);
}

/// @nodoc

class DhikrsInitialPage implements DhikrsState {
  const DhikrsInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DhikrsInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DhikrsState.initial()';
  }
}

/// @nodoc

class DhikrsLoadingState implements DhikrsState {
  const DhikrsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DhikrsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DhikrsState.loading()';
  }
}

/// @nodoc

class DhikrsLoadingMoreState implements DhikrsState {
  const DhikrsLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DhikrsLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DhikrsState.loadingMore()';
  }
}

/// @nodoc

class DhikrsLoadedState implements DhikrsState {
  const DhikrsLoadedState({required final List<ResultTeachingDTO> dhikrs})
      : _dhikrs = dhikrs;

  final List<ResultTeachingDTO> _dhikrs;
  List<ResultTeachingDTO> get dhikrs {
    if (_dhikrs is EqualUnmodifiableListView) return _dhikrs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dhikrs);
  }

  /// Create a copy of DhikrsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DhikrsLoadedStateCopyWith<DhikrsLoadedState> get copyWith =>
      _$DhikrsLoadedStateCopyWithImpl<DhikrsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DhikrsLoadedState &&
            const DeepCollectionEquality().equals(other._dhikrs, _dhikrs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_dhikrs));

  @override
  String toString() {
    return 'DhikrsState.loaded(dhikrs: $dhikrs)';
  }
}

/// @nodoc
abstract mixin class $DhikrsLoadedStateCopyWith<$Res>
    implements $DhikrsStateCopyWith<$Res> {
  factory $DhikrsLoadedStateCopyWith(
          DhikrsLoadedState value, $Res Function(DhikrsLoadedState) _then) =
      _$DhikrsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultTeachingDTO> dhikrs});
}

/// @nodoc
class _$DhikrsLoadedStateCopyWithImpl<$Res>
    implements $DhikrsLoadedStateCopyWith<$Res> {
  _$DhikrsLoadedStateCopyWithImpl(this._self, this._then);

  final DhikrsLoadedState _self;
  final $Res Function(DhikrsLoadedState) _then;

  /// Create a copy of DhikrsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dhikrs = null,
  }) {
    return _then(DhikrsLoadedState(
      dhikrs: null == dhikrs
          ? _self._dhikrs
          : dhikrs // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
    ));
  }
}

/// @nodoc

class DhikrsErrorState implements DhikrsState {
  const DhikrsErrorState({required this.message});

  final String message;

  /// Create a copy of DhikrsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DhikrsErrorStateCopyWith<DhikrsErrorState> get copyWith =>
      _$DhikrsErrorStateCopyWithImpl<DhikrsErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DhikrsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DhikrsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DhikrsErrorStateCopyWith<$Res>
    implements $DhikrsStateCopyWith<$Res> {
  factory $DhikrsErrorStateCopyWith(
          DhikrsErrorState value, $Res Function(DhikrsErrorState) _then) =
      _$DhikrsErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DhikrsErrorStateCopyWithImpl<$Res>
    implements $DhikrsErrorStateCopyWith<$Res> {
  _$DhikrsErrorStateCopyWithImpl(this._self, this._then);

  final DhikrsErrorState _self;
  final $Res Function(DhikrsErrorState) _then;

  /// Create a copy of DhikrsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DhikrsErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
