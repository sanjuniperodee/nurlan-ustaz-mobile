// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zhosparym_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZhosparymState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ZhosparymState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ZhosparymState()';
  }
}

/// @nodoc
class $ZhosparymStateCopyWith<$Res> {
  $ZhosparymStateCopyWith(ZhosparymState _, $Res Function(ZhosparymState) __);
}

/// @nodoc

class ZhosparymInitialState implements ZhosparymState {
  const ZhosparymInitialState(
      {final Map<String, List<EventDto>>? events,
      this.checklist,
      this.isLoading = false})
      : _events = events;

  final Map<String, List<EventDto>>? _events;
  Map<String, List<EventDto>>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableMapView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final CheckListDto? checklist;
  @JsonKey()
  final bool isLoading;

  /// Create a copy of ZhosparymState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZhosparymInitialStateCopyWith<ZhosparymInitialState> get copyWith =>
      _$ZhosparymInitialStateCopyWithImpl<ZhosparymInitialState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZhosparymInitialState &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.checklist, checklist) ||
                other.checklist == checklist) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), checklist, isLoading);

  @override
  String toString() {
    return 'ZhosparymState.initial(events: $events, checklist: $checklist, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $ZhosparymInitialStateCopyWith<$Res>
    implements $ZhosparymStateCopyWith<$Res> {
  factory $ZhosparymInitialStateCopyWith(ZhosparymInitialState value,
          $Res Function(ZhosparymInitialState) _then) =
      _$ZhosparymInitialStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, List<EventDto>>? events,
      CheckListDto? checklist,
      bool isLoading});

  $CheckListDtoCopyWith<$Res>? get checklist;
}

/// @nodoc
class _$ZhosparymInitialStateCopyWithImpl<$Res>
    implements $ZhosparymInitialStateCopyWith<$Res> {
  _$ZhosparymInitialStateCopyWithImpl(this._self, this._then);

  final ZhosparymInitialState _self;
  final $Res Function(ZhosparymInitialState) _then;

  /// Create a copy of ZhosparymState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? events = freezed,
    Object? checklist = freezed,
    Object? isLoading = null,
  }) {
    return _then(ZhosparymInitialState(
      events: freezed == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as Map<String, List<EventDto>>?,
      checklist: freezed == checklist
          ? _self.checklist
          : checklist // ignore: cast_nullable_to_non_nullable
              as CheckListDto?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ZhosparymState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckListDtoCopyWith<$Res>? get checklist {
    if (_self.checklist == null) {
      return null;
    }

    return $CheckListDtoCopyWith<$Res>(_self.checklist!, (value) {
      return _then(_self.copyWith(checklist: value));
    });
  }
}

/// @nodoc

class ZhosparymLoadedState implements ZhosparymState {
  const ZhosparymLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ZhosparymLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ZhosparymState.loaded()';
  }
}

/// @nodoc

class ZhosparymLoadingState implements ZhosparymState {
  const ZhosparymLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ZhosparymLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ZhosparymState.loading()';
  }
}

/// @nodoc

class ZhosparymErrorState implements ZhosparymState {
  const ZhosparymErrorState({required this.message});

  final String message;

  /// Create a copy of ZhosparymState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZhosparymErrorStateCopyWith<ZhosparymErrorState> get copyWith =>
      _$ZhosparymErrorStateCopyWithImpl<ZhosparymErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZhosparymErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ZhosparymState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ZhosparymErrorStateCopyWith<$Res>
    implements $ZhosparymStateCopyWith<$Res> {
  factory $ZhosparymErrorStateCopyWith(
          ZhosparymErrorState value, $Res Function(ZhosparymErrorState) _then) =
      _$ZhosparymErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ZhosparymErrorStateCopyWithImpl<$Res>
    implements $ZhosparymErrorStateCopyWith<$Res> {
  _$ZhosparymErrorStateCopyWithImpl(this._self, this._then);

  final ZhosparymErrorState _self;
  final $Res Function(ZhosparymErrorState) _then;

  /// Create a copy of ZhosparymState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ZhosparymErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
