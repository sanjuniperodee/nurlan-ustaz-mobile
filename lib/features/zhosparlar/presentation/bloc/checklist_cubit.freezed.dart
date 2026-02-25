// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckListState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckListState()';
  }
}

/// @nodoc
class $CheckListStateCopyWith<$Res> {
  $CheckListStateCopyWith(CheckListState _, $Res Function(CheckListState) __);
}

/// @nodoc

class CheckListInitialState implements CheckListState {
  const CheckListInitialState(
      {final List<CheckListDayDto> days = const [],
      this.selectedDate,
      final List<CheckListTaskDto>? tasks,
      this.isLoading = false})
      : _days = days,
        _tasks = tasks;

  final List<CheckListDayDto> _days;
  @JsonKey()
  List<CheckListDayDto> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  final DateTime? selectedDate;
  final List<CheckListTaskDto>? _tasks;
  List<CheckListTaskDto>? get tasks {
    final value = _tasks;
    if (value == null) return null;
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey()
  final bool isLoading;

  /// Create a copy of CheckListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckListInitialStateCopyWith<CheckListInitialState> get copyWith =>
      _$CheckListInitialStateCopyWithImpl<CheckListInitialState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckListInitialState &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_days),
      selectedDate,
      const DeepCollectionEquality().hash(_tasks),
      isLoading);

  @override
  String toString() {
    return 'CheckListState.initial(days: $days, selectedDate: $selectedDate, tasks: $tasks, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $CheckListInitialStateCopyWith<$Res>
    implements $CheckListStateCopyWith<$Res> {
  factory $CheckListInitialStateCopyWith(CheckListInitialState value,
          $Res Function(CheckListInitialState) _then) =
      _$CheckListInitialStateCopyWithImpl;
  @useResult
  $Res call(
      {List<CheckListDayDto> days,
      DateTime? selectedDate,
      List<CheckListTaskDto>? tasks,
      bool isLoading});
}

/// @nodoc
class _$CheckListInitialStateCopyWithImpl<$Res>
    implements $CheckListInitialStateCopyWith<$Res> {
  _$CheckListInitialStateCopyWithImpl(this._self, this._then);

  final CheckListInitialState _self;
  final $Res Function(CheckListInitialState) _then;

  /// Create a copy of CheckListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? days = null,
    Object? selectedDate = freezed,
    Object? tasks = freezed,
    Object? isLoading = null,
  }) {
    return _then(CheckListInitialState(
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<CheckListDayDto>,
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tasks: freezed == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<CheckListTaskDto>?,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class CheckListLoadedState implements CheckListState {
  const CheckListLoadedState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckListLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckListState.loaded()';
  }
}

/// @nodoc

class CheckListLoadingState implements CheckListState {
  const CheckListLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckListLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckListState.loading()';
  }
}

/// @nodoc

class CheckListErrorState implements CheckListState {
  const CheckListErrorState({required this.message});

  final String message;

  /// Create a copy of CheckListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckListErrorStateCopyWith<CheckListErrorState> get copyWith =>
      _$CheckListErrorStateCopyWithImpl<CheckListErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckListErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CheckListState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CheckListErrorStateCopyWith<$Res>
    implements $CheckListStateCopyWith<$Res> {
  factory $CheckListErrorStateCopyWith(
          CheckListErrorState value, $Res Function(CheckListErrorState) _then) =
      _$CheckListErrorStateCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CheckListErrorStateCopyWithImpl<$Res>
    implements $CheckListErrorStateCopyWith<$Res> {
  _$CheckListErrorStateCopyWithImpl(this._self, this._then);

  final CheckListErrorState _self;
  final $Res Function(CheckListErrorState) _then;

  /// Create a copy of CheckListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CheckListErrorState(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
