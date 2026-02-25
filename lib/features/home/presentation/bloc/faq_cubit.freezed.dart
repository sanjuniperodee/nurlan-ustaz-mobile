// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FaqState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FaqState()';
  }
}

/// @nodoc
class $FaqStateCopyWith<$Res> {
  $FaqStateCopyWith(FaqState _, $Res Function(FaqState) __);
}

/// @nodoc

class FaqInitialPage implements FaqState {
  const FaqInitialPage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FaqInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FaqState.initial()';
  }
}

/// @nodoc

class FaqLoadingState implements FaqState {
  const FaqLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FaqLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FaqState.loading()';
  }
}

/// @nodoc

class FaqLoadedState implements FaqState {
  const FaqLoadedState({required final List<FaqModelDTO> faq}) : _faq = faq;

  final List<FaqModelDTO> _faq;
  List<FaqModelDTO> get faq {
    if (_faq is EqualUnmodifiableListView) return _faq;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faq);
  }

  /// Create a copy of FaqState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqLoadedStateCopyWith<FaqLoadedState> get copyWith =>
      _$FaqLoadedStateCopyWithImpl<FaqLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaqLoadedState &&
            const DeepCollectionEquality().equals(other._faq, _faq));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_faq));

  @override
  String toString() {
    return 'FaqState.loaded(faq: $faq)';
  }
}

/// @nodoc
abstract mixin class $FaqLoadedStateCopyWith<$Res>
    implements $FaqStateCopyWith<$Res> {
  factory $FaqLoadedStateCopyWith(
          FaqLoadedState value, $Res Function(FaqLoadedState) _then) =
      _$FaqLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<FaqModelDTO> faq});
}

/// @nodoc
class _$FaqLoadedStateCopyWithImpl<$Res>
    implements $FaqLoadedStateCopyWith<$Res> {
  _$FaqLoadedStateCopyWithImpl(this._self, this._then);

  final FaqLoadedState _self;
  final $Res Function(FaqLoadedState) _then;

  /// Create a copy of FaqState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? faq = null,
  }) {
    return _then(FaqLoadedState(
      faq: null == faq
          ? _self._faq
          : faq // ignore: cast_nullable_to_non_nullable
              as List<FaqModelDTO>,
    ));
  }
}

/// @nodoc

class FaqErrorState implements FaqState {
  const FaqErrorState({required this.message});

  final String message;

  /// Create a copy of FaqState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqErrorStateCopyWith<FaqErrorState> get copyWith =>
      _$FaqErrorStateCopyWithImpl<FaqErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaqErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FaqState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FaqErrorStateCopyWith<$Res>
    implements $FaqStateCopyWith<$Res> {
  factory $FaqErrorStateCopyWith(
          FaqErrorState value, $Res Function(FaqErrorState) _then) =
      _$FaqErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FaqErrorStateCopyWithImpl<$Res>
    implements $FaqErrorStateCopyWith<$Res> {
  _$FaqErrorStateCopyWithImpl(this._self, this._then);

  final FaqErrorState _self;
  final $Res Function(FaqErrorState) _then;

  /// Create a copy of FaqState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FaqErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
