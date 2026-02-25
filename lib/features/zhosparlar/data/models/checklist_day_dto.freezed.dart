// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_day_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckListDayDto {
  int get id;
  String get date;
  @JsonKey(name: "total_tasks")
  int? get totalTasks;
  @JsonKey(name: "completed_tasks")
  int? get completedTasks;
  double get percentage;
  List<CheckListTaskDto> get tasks;

  /// Create a copy of CheckListDayDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckListDayDtoCopyWith<CheckListDayDto> get copyWith =>
      _$CheckListDayDtoCopyWithImpl<CheckListDayDto>(
          this as CheckListDayDto, _$identity);

  /// Serializes this CheckListDayDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckListDayDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.completedTasks, completedTasks) ||
                other.completedTasks == completedTasks) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, totalTasks,
      completedTasks, percentage, const DeepCollectionEquality().hash(tasks));

  @override
  String toString() {
    return 'CheckListDayDto(id: $id, date: $date, totalTasks: $totalTasks, completedTasks: $completedTasks, percentage: $percentage, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $CheckListDayDtoCopyWith<$Res> {
  factory $CheckListDayDtoCopyWith(
          CheckListDayDto value, $Res Function(CheckListDayDto) _then) =
      _$CheckListDayDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String date,
      @JsonKey(name: "total_tasks") int? totalTasks,
      @JsonKey(name: "completed_tasks") int? completedTasks,
      double percentage,
      List<CheckListTaskDto> tasks});
}

/// @nodoc
class _$CheckListDayDtoCopyWithImpl<$Res>
    implements $CheckListDayDtoCopyWith<$Res> {
  _$CheckListDayDtoCopyWithImpl(this._self, this._then);

  final CheckListDayDto _self;
  final $Res Function(CheckListDayDto) _then;

  /// Create a copy of CheckListDayDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? totalTasks = freezed,
    Object? completedTasks = freezed,
    Object? percentage = null,
    Object? tasks = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalTasks: freezed == totalTasks
          ? _self.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      completedTasks: freezed == completedTasks
          ? _self.completedTasks
          : completedTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<CheckListTaskDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CheckListDayDto implements CheckListDayDto {
  const _CheckListDayDto(
      {required this.id,
      required this.date,
      @JsonKey(name: "total_tasks") this.totalTasks,
      @JsonKey(name: "completed_tasks") this.completedTasks,
      required this.percentage,
      required final List<CheckListTaskDto> tasks})
      : _tasks = tasks;
  factory _CheckListDayDto.fromJson(Map<String, dynamic> json) =>
      _$CheckListDayDtoFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  @JsonKey(name: "total_tasks")
  final int? totalTasks;
  @override
  @JsonKey(name: "completed_tasks")
  final int? completedTasks;
  @override
  final double percentage;
  final List<CheckListTaskDto> _tasks;
  @override
  List<CheckListTaskDto> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  /// Create a copy of CheckListDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckListDayDtoCopyWith<_CheckListDayDto> get copyWith =>
      __$CheckListDayDtoCopyWithImpl<_CheckListDayDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckListDayDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckListDayDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.completedTasks, completedTasks) ||
                other.completedTasks == completedTasks) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, totalTasks,
      completedTasks, percentage, const DeepCollectionEquality().hash(_tasks));

  @override
  String toString() {
    return 'CheckListDayDto(id: $id, date: $date, totalTasks: $totalTasks, completedTasks: $completedTasks, percentage: $percentage, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class _$CheckListDayDtoCopyWith<$Res>
    implements $CheckListDayDtoCopyWith<$Res> {
  factory _$CheckListDayDtoCopyWith(
          _CheckListDayDto value, $Res Function(_CheckListDayDto) _then) =
      __$CheckListDayDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String date,
      @JsonKey(name: "total_tasks") int? totalTasks,
      @JsonKey(name: "completed_tasks") int? completedTasks,
      double percentage,
      List<CheckListTaskDto> tasks});
}

/// @nodoc
class __$CheckListDayDtoCopyWithImpl<$Res>
    implements _$CheckListDayDtoCopyWith<$Res> {
  __$CheckListDayDtoCopyWithImpl(this._self, this._then);

  final _CheckListDayDto _self;
  final $Res Function(_CheckListDayDto) _then;

  /// Create a copy of CheckListDayDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? totalTasks = freezed,
    Object? completedTasks = freezed,
    Object? percentage = null,
    Object? tasks = null,
  }) {
    return _then(_CheckListDayDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalTasks: freezed == totalTasks
          ? _self.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      completedTasks: freezed == completedTasks
          ? _self.completedTasks
          : completedTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<CheckListTaskDto>,
    ));
  }
}

// dart format on
