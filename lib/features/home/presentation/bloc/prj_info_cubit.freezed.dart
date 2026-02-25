// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prj_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrjInfoState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PrjInfoState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrjInfoState()';
  }
}

/// @nodoc
class $PrjInfoStateCopyWith<$Res> {
  $PrjInfoStateCopyWith(PrjInfoState _, $Res Function(PrjInfoState) __);
}

/// @nodoc

class PrjInfoInitialPage implements PrjInfoState {
  const PrjInfoInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PrjInfoInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrjInfoState.initial()';
  }
}

/// @nodoc

class PrjInfoLoadingState implements PrjInfoState {
  const PrjInfoLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PrjInfoLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrjInfoState.loading()';
  }
}

/// @nodoc

class PrjInfoLoadedState implements PrjInfoState {
  const PrjInfoLoadedState({required final List<ResultHomeDTO> res})
      : _res = res;

  final List<ResultHomeDTO> _res;
  List<ResultHomeDTO> get res {
    if (_res is EqualUnmodifiableListView) return _res;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_res);
  }

  /// Create a copy of PrjInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrjInfoLoadedStateCopyWith<PrjInfoLoadedState> get copyWith =>
      _$PrjInfoLoadedStateCopyWithImpl<PrjInfoLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrjInfoLoadedState &&
            const DeepCollectionEquality().equals(other._res, _res));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_res));

  @override
  String toString() {
    return 'PrjInfoState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $PrjInfoLoadedStateCopyWith<$Res>
    implements $PrjInfoStateCopyWith<$Res> {
  factory $PrjInfoLoadedStateCopyWith(
          PrjInfoLoadedState value, $Res Function(PrjInfoLoadedState) _then) =
      _$PrjInfoLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> res});
}

/// @nodoc
class _$PrjInfoLoadedStateCopyWithImpl<$Res>
    implements $PrjInfoLoadedStateCopyWith<$Res> {
  _$PrjInfoLoadedStateCopyWithImpl(this._self, this._then);

  final PrjInfoLoadedState _self;
  final $Res Function(PrjInfoLoadedState) _then;

  /// Create a copy of PrjInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(PrjInfoLoadedState(
      res: null == res
          ? _self._res
          : res // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
    ));
  }
}

/// @nodoc

class PrjInfoErrorState implements PrjInfoState {
  const PrjInfoErrorState({required this.message});

  final String message;

  /// Create a copy of PrjInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrjInfoErrorStateCopyWith<PrjInfoErrorState> get copyWith =>
      _$PrjInfoErrorStateCopyWithImpl<PrjInfoErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrjInfoErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PrjInfoState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PrjInfoErrorStateCopyWith<$Res>
    implements $PrjInfoStateCopyWith<$Res> {
  factory $PrjInfoErrorStateCopyWith(
          PrjInfoErrorState value, $Res Function(PrjInfoErrorState) _then) =
      _$PrjInfoErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PrjInfoErrorStateCopyWithImpl<$Res>
    implements $PrjInfoErrorStateCopyWith<$Res> {
  _$PrjInfoErrorStateCopyWithImpl(this._self, this._then);

  final PrjInfoErrorState _self;
  final $Res Function(PrjInfoErrorState) _then;

  /// Create a copy of PrjInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PrjInfoErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
