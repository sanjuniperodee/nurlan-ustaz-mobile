// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_tick_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentTickState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentTickState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentTickState()';
  }
}

/// @nodoc
class $PaymentTickStateCopyWith<$Res> {
  $PaymentTickStateCopyWith(
      PaymentTickState _, $Res Function(PaymentTickState) __);
}

/// @nodoc

class PaymentTickInitialPage implements PaymentTickState {
  const PaymentTickInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentTickInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentTickState.initial()';
  }
}

/// @nodoc

class PaymentTickLoadingState implements PaymentTickState {
  const PaymentTickLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentTickLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentTickState.loading()';
  }
}

/// @nodoc

class PaymentTickLoadingMoreState implements PaymentTickState {
  const PaymentTickLoadingMoreState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentTickLoadingMoreState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PaymentTickState.loadingMore()';
  }
}

/// @nodoc

class PaymentTickLoadedState implements PaymentTickState {
  const PaymentTickLoadedState(
      {required final List<ResultHomeDTO> res,
      required final List<TusZhoruDTO> res2})
      : _res = res,
        _res2 = res2;

  final List<ResultHomeDTO> _res;
  List<ResultHomeDTO> get res {
    if (_res is EqualUnmodifiableListView) return _res;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_res);
  }

  final List<TusZhoruDTO> _res2;
  List<TusZhoruDTO> get res2 {
    if (_res2 is EqualUnmodifiableListView) return _res2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_res2);
  }

  /// Create a copy of PaymentTickState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentTickLoadedStateCopyWith<PaymentTickLoadedState> get copyWith =>
      _$PaymentTickLoadedStateCopyWithImpl<PaymentTickLoadedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentTickLoadedState &&
            const DeepCollectionEquality().equals(other._res, _res) &&
            const DeepCollectionEquality().equals(other._res2, _res2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_res),
      const DeepCollectionEquality().hash(_res2));

  @override
  String toString() {
    return 'PaymentTickState.loaded(res: $res, res2: $res2)';
  }
}

/// @nodoc
abstract mixin class $PaymentTickLoadedStateCopyWith<$Res>
    implements $PaymentTickStateCopyWith<$Res> {
  factory $PaymentTickLoadedStateCopyWith(PaymentTickLoadedState value,
          $Res Function(PaymentTickLoadedState) _then) =
      _$PaymentTickLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<ResultHomeDTO> res, List<TusZhoruDTO> res2});
}

/// @nodoc
class _$PaymentTickLoadedStateCopyWithImpl<$Res>
    implements $PaymentTickLoadedStateCopyWith<$Res> {
  _$PaymentTickLoadedStateCopyWithImpl(this._self, this._then);

  final PaymentTickLoadedState _self;
  final $Res Function(PaymentTickLoadedState) _then;

  /// Create a copy of PaymentTickState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? res = null,
    Object? res2 = null,
  }) {
    return _then(PaymentTickLoadedState(
      res: null == res
          ? _self._res
          : res // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>,
      res2: null == res2
          ? _self._res2
          : res2 // ignore: cast_nullable_to_non_nullable
              as List<TusZhoruDTO>,
    ));
  }
}

/// @nodoc

class PaymentTickErrorState implements PaymentTickState {
  const PaymentTickErrorState({required this.message});

  final String message;

  /// Create a copy of PaymentTickState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentTickErrorStateCopyWith<PaymentTickErrorState> get copyWith =>
      _$PaymentTickErrorStateCopyWithImpl<PaymentTickErrorState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentTickErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PaymentTickState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $PaymentTickErrorStateCopyWith<$Res>
    implements $PaymentTickStateCopyWith<$Res> {
  factory $PaymentTickErrorStateCopyWith(PaymentTickErrorState value,
          $Res Function(PaymentTickErrorState) _then) =
      _$PaymentTickErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$PaymentTickErrorStateCopyWithImpl<$Res>
    implements $PaymentTickErrorStateCopyWith<$Res> {
  _$PaymentTickErrorStateCopyWithImpl(this._self, this._then);

  final PaymentTickErrorState _self;
  final $Res Function(PaymentTickErrorState) _then;

  /// Create a copy of PaymentTickState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(PaymentTickErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
