// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_scanner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrScannerState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QrScannerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QrScannerState()';
  }
}

/// @nodoc
class $QrScannerStateCopyWith<$Res> {
  $QrScannerStateCopyWith(QrScannerState _, $Res Function(QrScannerState) __);
}

/// @nodoc

class QrScannerInitialState implements QrScannerState {
  const QrScannerInitialState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QrScannerInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QrScannerState.initial()';
  }
}

/// @nodoc

class QrScannerLoadedState implements QrScannerState {
  const QrScannerLoadedState({required this.message});

  final String message;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QrScannerLoadedStateCopyWith<QrScannerLoadedState> get copyWith =>
      _$QrScannerLoadedStateCopyWithImpl<QrScannerLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QrScannerLoadedState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'QrScannerState.loaded(message: $message)';
  }
}

/// @nodoc
abstract mixin class $QrScannerLoadedStateCopyWith<$Res>
    implements $QrScannerStateCopyWith<$Res> {
  factory $QrScannerLoadedStateCopyWith(QrScannerLoadedState value,
          $Res Function(QrScannerLoadedState) _then) =
      _$QrScannerLoadedStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$QrScannerLoadedStateCopyWithImpl<$Res>
    implements $QrScannerLoadedStateCopyWith<$Res> {
  _$QrScannerLoadedStateCopyWithImpl(this._self, this._then);

  final QrScannerLoadedState _self;
  final $Res Function(QrScannerLoadedState) _then;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(QrScannerLoadedState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class QrScannerLoadingState implements QrScannerState {
  const QrScannerLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is QrScannerLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'QrScannerState.loading()';
  }
}

/// @nodoc

class QrScannerErrorState implements QrScannerState {
  const QrScannerErrorState({required this.message});

  final String message;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QrScannerErrorStateCopyWith<QrScannerErrorState> get copyWith =>
      _$QrScannerErrorStateCopyWithImpl<QrScannerErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QrScannerErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'QrScannerState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $QrScannerErrorStateCopyWith<$Res>
    implements $QrScannerStateCopyWith<$Res> {
  factory $QrScannerErrorStateCopyWith(
          QrScannerErrorState value, $Res Function(QrScannerErrorState) _then) =
      _$QrScannerErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$QrScannerErrorStateCopyWithImpl<$Res>
    implements $QrScannerErrorStateCopyWith<$Res> {
  _$QrScannerErrorStateCopyWithImpl(this._self, this._then);

  final QrScannerErrorState _self;
  final $Res Function(QrScannerErrorState) _then;

  /// Create a copy of QrScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(QrScannerErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
