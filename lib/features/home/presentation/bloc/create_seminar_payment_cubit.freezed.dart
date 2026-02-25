// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_seminar_payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateSeminarPaymentState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'CreateSeminarPaymentState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSeminarPaymentState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateSeminarPaymentState()';
  }
}

/// @nodoc
class $CreateSeminarPaymentStateCopyWith<$Res> {
  $CreateSeminarPaymentStateCopyWith(
      CreateSeminarPaymentState _, $Res Function(CreateSeminarPaymentState) __);
}

/// @nodoc

class CreateSeminarPaymentInitialPage
    with DiagnosticableTreeMixin
    implements CreateSeminarPaymentState {
  const CreateSeminarPaymentInitialPage();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CreateSeminarPaymentState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSeminarPaymentInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateSeminarPaymentState.initial()';
  }
}

/// @nodoc

class CreateSeminarPaymentLoadingState
    with DiagnosticableTreeMixin
    implements CreateSeminarPaymentState {
  const CreateSeminarPaymentLoadingState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CreateSeminarPaymentState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSeminarPaymentLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateSeminarPaymentState.loading()';
  }
}

/// @nodoc

class CreateSeminarPaymentLoadedState
    with DiagnosticableTreeMixin
    implements CreateSeminarPaymentState {
  const CreateSeminarPaymentLoadedState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CreateSeminarPaymentState.loaded'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSeminarPaymentLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateSeminarPaymentState.loaded()';
  }
}

/// @nodoc

class CreateSeminarPaymentErrorState
    with DiagnosticableTreeMixin
    implements CreateSeminarPaymentState {
  const CreateSeminarPaymentErrorState({required this.message});

  final String message;

  /// Create a copy of CreateSeminarPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateSeminarPaymentErrorStateCopyWith<CreateSeminarPaymentErrorState>
      get copyWith => _$CreateSeminarPaymentErrorStateCopyWithImpl<
          CreateSeminarPaymentErrorState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CreateSeminarPaymentState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSeminarPaymentErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateSeminarPaymentState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CreateSeminarPaymentErrorStateCopyWith<$Res>
    implements $CreateSeminarPaymentStateCopyWith<$Res> {
  factory $CreateSeminarPaymentErrorStateCopyWith(
          CreateSeminarPaymentErrorState value,
          $Res Function(CreateSeminarPaymentErrorState) _then) =
      _$CreateSeminarPaymentErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CreateSeminarPaymentErrorStateCopyWithImpl<$Res>
    implements $CreateSeminarPaymentErrorStateCopyWith<$Res> {
  _$CreateSeminarPaymentErrorStateCopyWithImpl(this._self, this._then);

  final CreateSeminarPaymentErrorState _self;
  final $Res Function(CreateSeminarPaymentErrorState) _then;

  /// Create a copy of CreateSeminarPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CreateSeminarPaymentErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CreateSeminarPaymentSuccessPay
    with DiagnosticableTreeMixin
    implements CreateSeminarPaymentState {
  const CreateSeminarPaymentSuccessPay();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CreateSeminarPaymentState.successPay'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateSeminarPaymentSuccessPay);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateSeminarPaymentState.successPay()';
  }
}

// dart format on
