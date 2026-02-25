// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_noti_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetNotiState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetNotiState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetNotiState()';
  }
}

/// @nodoc
class $GetNotiStateCopyWith<$Res> {
  $GetNotiStateCopyWith(GetNotiState _, $Res Function(GetNotiState) __);
}

/// @nodoc

class GetNotiInitialPage implements GetNotiState {
  const GetNotiInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetNotiInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetNotiState.initial()';
  }
}

/// @nodoc

class GetNotiLoadingState implements GetNotiState {
  const GetNotiLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetNotiLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetNotiState.loading()';
  }
}

/// @nodoc

class GetNotiLoadedState implements GetNotiState {
  const GetNotiLoadedState({required this.res});

  final GetNotiDTO res;

  /// Create a copy of GetNotiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNotiLoadedStateCopyWith<GetNotiLoadedState> get copyWith =>
      _$GetNotiLoadedStateCopyWithImpl<GetNotiLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNotiLoadedState &&
            (identical(other.res, res) || other.res == res));
  }

  @override
  int get hashCode => Object.hash(runtimeType, res);

  @override
  String toString() {
    return 'GetNotiState.loaded(res: $res)';
  }
}

/// @nodoc
abstract mixin class $GetNotiLoadedStateCopyWith<$Res>
    implements $GetNotiStateCopyWith<$Res> {
  factory $GetNotiLoadedStateCopyWith(
          GetNotiLoadedState value, $Res Function(GetNotiLoadedState) _then) =
      _$GetNotiLoadedStateCopyWithImpl;
  @useResult
  $Res call({GetNotiDTO res});

  $GetNotiDTOCopyWith<$Res> get res;
}

/// @nodoc
class _$GetNotiLoadedStateCopyWithImpl<$Res>
    implements $GetNotiLoadedStateCopyWith<$Res> {
  _$GetNotiLoadedStateCopyWithImpl(this._self, this._then);

  final GetNotiLoadedState _self;
  final $Res Function(GetNotiLoadedState) _then;

  /// Create a copy of GetNotiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
  }) {
    return _then(GetNotiLoadedState(
      res: null == res
          ? _self.res
          : res // ignore: cast_nullable_to_non_nullable
              as GetNotiDTO,
    ));
  }

  /// Create a copy of GetNotiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetNotiDTOCopyWith<$Res> get res {
    return $GetNotiDTOCopyWith<$Res>(_self.res, (value) {
      return _then(_self.copyWith(res: value));
    });
  }
}

/// @nodoc

class GetNotiErrorState implements GetNotiState {
  const GetNotiErrorState({required this.message});

  final String message;

  /// Create a copy of GetNotiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNotiErrorStateCopyWith<GetNotiErrorState> get copyWith =>
      _$GetNotiErrorStateCopyWithImpl<GetNotiErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNotiErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GetNotiState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GetNotiErrorStateCopyWith<$Res>
    implements $GetNotiStateCopyWith<$Res> {
  factory $GetNotiErrorStateCopyWith(
          GetNotiErrorState value, $Res Function(GetNotiErrorState) _then) =
      _$GetNotiErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GetNotiErrorStateCopyWithImpl<$Res>
    implements $GetNotiErrorStateCopyWith<$Res> {
  _$GetNotiErrorStateCopyWithImpl(this._self, this._then);

  final GetNotiErrorState _self;
  final $Res Function(GetNotiErrorState) _then;

  /// Create a copy of GetNotiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(GetNotiErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
