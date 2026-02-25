// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dua_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DuaDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuaDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuaDetailState()';
  }
}

/// @nodoc
class $DuaDetailStateCopyWith<$Res> {
  $DuaDetailStateCopyWith(DuaDetailState _, $Res Function(DuaDetailState) __);
}

/// @nodoc

class DuaDetailInitialPage implements DuaDetailState {
  const DuaDetailInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuaDetailInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuaDetailState.initial()';
  }
}

/// @nodoc

class DuaDetailLoadingState implements DuaDetailState {
  const DuaDetailLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DuaDetailLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DuaDetailState.loading()';
  }
}

/// @nodoc

class DuaDetailLoadedState implements DuaDetailState {
  const DuaDetailLoadedState({required this.res});

  final ResultTeachingDTO res;

  /// Create a copy of DuaDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DuaDetailLoadedStateCopyWith<DuaDetailLoadedState> get copyWith =>
      _$DuaDetailLoadedStateCopyWithImpl<DuaDetailLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DuaDetailLoadedState &&
            (identical(other.res, res) || other.res == res));
  }

  @override
  int get hashCode => Object.hash(runtimeType, res);

  @override
  String toString() {
    return 'DuaDetailState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $DuaDetailLoadedStateCopyWith<$Res>
    implements $DuaDetailStateCopyWith<$Res> {
  factory $DuaDetailLoadedStateCopyWith(DuaDetailLoadedState value,
          $Res Function(DuaDetailLoadedState) _then) =
      _$DuaDetailLoadedStateCopyWithImpl;
  @useResult
  $Res call({ResultTeachingDTO res});

  $ResultTeachingDTOCopyWith<$Res> get res;
}

/// @nodoc
class _$DuaDetailLoadedStateCopyWithImpl<$Res>
    implements $DuaDetailLoadedStateCopyWith<$Res> {
  _$DuaDetailLoadedStateCopyWithImpl(this._self, this._then);

  final DuaDetailLoadedState _self;
  final $Res Function(DuaDetailLoadedState) _then;

  /// Create a copy of DuaDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(DuaDetailLoadedState(
      res: null == res
          ? _self.res
          : res // ignore: cast_nullable_to_non_nullable
              as ResultTeachingDTO,
    ));
  }

  /// Create a copy of DuaDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultTeachingDTOCopyWith<$Res> get res {
    return $ResultTeachingDTOCopyWith<$Res>(_self.res, (value) {
      return _then(_self.copyWith(res: value));
    });
  }
}

/// @nodoc

class DuaDetailErrorState implements DuaDetailState {
  const DuaDetailErrorState({required this.message});

  final String message;

  /// Create a copy of DuaDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DuaDetailErrorStateCopyWith<DuaDetailErrorState> get copyWith =>
      _$DuaDetailErrorStateCopyWithImpl<DuaDetailErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DuaDetailErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DuaDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DuaDetailErrorStateCopyWith<$Res>
    implements $DuaDetailStateCopyWith<$Res> {
  factory $DuaDetailErrorStateCopyWith(
          DuaDetailErrorState value, $Res Function(DuaDetailErrorState) _then) =
      _$DuaDetailErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DuaDetailErrorStateCopyWithImpl<$Res>
    implements $DuaDetailErrorStateCopyWith<$Res> {
  _$DuaDetailErrorStateCopyWithImpl(this._self, this._then);

  final DuaDetailErrorState _self;
  final $Res Function(DuaDetailErrorState) _then;

  /// Create a copy of DuaDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DuaDetailErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
