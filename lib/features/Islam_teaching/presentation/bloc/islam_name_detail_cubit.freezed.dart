// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'islam_name_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IslamNameDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IslamNameDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNameDetailState()';
  }
}

/// @nodoc
class $IslamNameDetailStateCopyWith<$Res> {
  $IslamNameDetailStateCopyWith(
      IslamNameDetailState _, $Res Function(IslamNameDetailState) __);
}

/// @nodoc

class IslamNameDetailInitialPage implements IslamNameDetailState {
  const IslamNameDetailInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNameDetailInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNameDetailState.initial()';
  }
}

/// @nodoc

class IslamNameDetailLoadingState implements IslamNameDetailState {
  const IslamNameDetailLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNameDetailLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'IslamNameDetailState.loading()';
  }
}

/// @nodoc

class IslamNameDetailLoadedState implements IslamNameDetailState {
  const IslamNameDetailLoadedState({required this.res});

  final ResultTeachingDTO res;

  /// Create a copy of IslamNameDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IslamNameDetailLoadedStateCopyWith<IslamNameDetailLoadedState>
      get copyWith =>
          _$IslamNameDetailLoadedStateCopyWithImpl<IslamNameDetailLoadedState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNameDetailLoadedState &&
            (identical(other.res, res) || other.res == res));
  }

  @override
  int get hashCode => Object.hash(runtimeType, res);

  @override
  String toString() {
    return 'IslamNameDetailState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $IslamNameDetailLoadedStateCopyWith<$Res>
    implements $IslamNameDetailStateCopyWith<$Res> {
  factory $IslamNameDetailLoadedStateCopyWith(IslamNameDetailLoadedState value,
          $Res Function(IslamNameDetailLoadedState) _then) =
      _$IslamNameDetailLoadedStateCopyWithImpl;
  @useResult
  $Res call({ResultTeachingDTO res});

  $ResultTeachingDTOCopyWith<$Res> get res;
}

/// @nodoc
class _$IslamNameDetailLoadedStateCopyWithImpl<$Res>
    implements $IslamNameDetailLoadedStateCopyWith<$Res> {
  _$IslamNameDetailLoadedStateCopyWithImpl(this._self, this._then);

  final IslamNameDetailLoadedState _self;
  final $Res Function(IslamNameDetailLoadedState) _then;

  /// Create a copy of IslamNameDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(IslamNameDetailLoadedState(
      res: null == res
          ? _self.res
          : res // ignore: cast_nullable_to_non_nullable
              as ResultTeachingDTO,
    ));
  }

  /// Create a copy of IslamNameDetailState
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

class IslamNameDetailErrorState implements IslamNameDetailState {
  const IslamNameDetailErrorState({required this.message});

  final String message;

  /// Create a copy of IslamNameDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IslamNameDetailErrorStateCopyWith<IslamNameDetailErrorState> get copyWith =>
      _$IslamNameDetailErrorStateCopyWithImpl<IslamNameDetailErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IslamNameDetailErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'IslamNameDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $IslamNameDetailErrorStateCopyWith<$Res>
    implements $IslamNameDetailStateCopyWith<$Res> {
  factory $IslamNameDetailErrorStateCopyWith(IslamNameDetailErrorState value,
          $Res Function(IslamNameDetailErrorState) _then) =
      _$IslamNameDetailErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$IslamNameDetailErrorStateCopyWithImpl<$Res>
    implements $IslamNameDetailErrorStateCopyWith<$Res> {
  _$IslamNameDetailErrorStateCopyWithImpl(this._self, this._then);

  final IslamNameDetailErrorState _self;
  final $Res Function(IslamNameDetailErrorState) _then;

  /// Create a copy of IslamNameDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(IslamNameDetailErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
