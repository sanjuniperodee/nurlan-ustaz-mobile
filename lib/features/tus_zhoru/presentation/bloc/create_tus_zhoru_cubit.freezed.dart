// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_tus_zhoru_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTusZhoruState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CreateTusZhoruState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateTusZhoruState()';
  }
}

/// @nodoc
class $CreateTusZhoruStateCopyWith<$Res> {
  $CreateTusZhoruStateCopyWith(
      CreateTusZhoruState _, $Res Function(CreateTusZhoruState) __);
}

/// @nodoc

class CreateTusZhoruInitialState implements CreateTusZhoruState {
  const CreateTusZhoruInitialState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTusZhoruInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateTusZhoruState.initial()';
  }
}

/// @nodoc

class CreateTusZhoruLoadingState implements CreateTusZhoruState {
  const CreateTusZhoruLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTusZhoruLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CreateTusZhoruState.loading()';
  }
}

/// @nodoc

class CreateTusZhoruLoadedState implements CreateTusZhoruState {
  const CreateTusZhoruLoadedState({required this.tusZhoru});

  final TusZhoruDTO tusZhoru;

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTusZhoruLoadedStateCopyWith<CreateTusZhoruLoadedState> get copyWith =>
      _$CreateTusZhoruLoadedStateCopyWithImpl<CreateTusZhoruLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTusZhoruLoadedState &&
            (identical(other.tusZhoru, tusZhoru) ||
                other.tusZhoru == tusZhoru));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tusZhoru);

  @override
  String toString() {
    return 'CreateTusZhoruState.loaded(tusZhoru: $tusZhoru)';
  }
}

/// @nodoc
abstract mixin class $CreateTusZhoruLoadedStateCopyWith<$Res>
    implements $CreateTusZhoruStateCopyWith<$Res> {
  factory $CreateTusZhoruLoadedStateCopyWith(CreateTusZhoruLoadedState value,
          $Res Function(CreateTusZhoruLoadedState) _then) =
      _$CreateTusZhoruLoadedStateCopyWithImpl;
  @useResult
  $Res call({TusZhoruDTO tusZhoru});

  $TusZhoruDTOCopyWith<$Res> get tusZhoru;
}

/// @nodoc
class _$CreateTusZhoruLoadedStateCopyWithImpl<$Res>
    implements $CreateTusZhoruLoadedStateCopyWith<$Res> {
  _$CreateTusZhoruLoadedStateCopyWithImpl(this._self, this._then);

  final CreateTusZhoruLoadedState _self;
  final $Res Function(CreateTusZhoruLoadedState) _then;

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tusZhoru = null,
  }) {
    return _then(CreateTusZhoruLoadedState(
      tusZhoru: null == tusZhoru
          ? _self.tusZhoru
          : tusZhoru // ignore: cast_nullable_to_non_nullable
              as TusZhoruDTO,
    ));
  }

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TusZhoruDTOCopyWith<$Res> get tusZhoru {
    return $TusZhoruDTOCopyWith<$Res>(_self.tusZhoru, (value) {
      return _then(_self.copyWith(tusZhoru: value));
    });
  }
}

/// @nodoc

class CreateTusZhoruErrorState implements CreateTusZhoruState {
  const CreateTusZhoruErrorState({required this.message});

  final String message;

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTusZhoruErrorStateCopyWith<CreateTusZhoruErrorState> get copyWith =>
      _$CreateTusZhoruErrorStateCopyWithImpl<CreateTusZhoruErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTusZhoruErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CreateTusZhoruState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CreateTusZhoruErrorStateCopyWith<$Res>
    implements $CreateTusZhoruStateCopyWith<$Res> {
  factory $CreateTusZhoruErrorStateCopyWith(CreateTusZhoruErrorState value,
          $Res Function(CreateTusZhoruErrorState) _then) =
      _$CreateTusZhoruErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CreateTusZhoruErrorStateCopyWithImpl<$Res>
    implements $CreateTusZhoruErrorStateCopyWith<$Res> {
  _$CreateTusZhoruErrorStateCopyWithImpl(this._self, this._then);

  final CreateTusZhoruErrorState _self;
  final $Res Function(CreateTusZhoruErrorState) _then;

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CreateTusZhoruErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CreateTusZhoruSuccessState implements CreateTusZhoruState {
  const CreateTusZhoruSuccessState({required this.message});

  final String message;

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTusZhoruSuccessStateCopyWith<CreateTusZhoruSuccessState>
      get copyWith =>
          _$CreateTusZhoruSuccessStateCopyWithImpl<CreateTusZhoruSuccessState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTusZhoruSuccessState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CreateTusZhoruState.success(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CreateTusZhoruSuccessStateCopyWith<$Res>
    implements $CreateTusZhoruStateCopyWith<$Res> {
  factory $CreateTusZhoruSuccessStateCopyWith(CreateTusZhoruSuccessState value,
          $Res Function(CreateTusZhoruSuccessState) _then) =
      _$CreateTusZhoruSuccessStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CreateTusZhoruSuccessStateCopyWithImpl<$Res>
    implements $CreateTusZhoruSuccessStateCopyWith<$Res> {
  _$CreateTusZhoruSuccessStateCopyWithImpl(this._self, this._then);

  final CreateTusZhoruSuccessState _self;
  final $Res Function(CreateTusZhoruSuccessState) _then;

  /// Create a copy of CreateTusZhoruState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CreateTusZhoruSuccessState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
