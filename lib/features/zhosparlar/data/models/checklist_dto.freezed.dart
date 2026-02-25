// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckListDto {
  int get id;
  @JsonKey(name: "is_active")
  bool? get isActive;
  String get title;
  @JsonKey(name: "start_date")
  String? get startDate;
  @JsonKey(name: "end_date")
  String? get endDate;
  @JsonKey(name: "default_tasks")
  String? get defaultTasks;

  /// Create a copy of CheckListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckListDtoCopyWith<CheckListDto> get copyWith =>
      _$CheckListDtoCopyWithImpl<CheckListDto>(
          this as CheckListDto, _$identity);

  /// Serializes this CheckListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckListDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.defaultTasks, defaultTasks) ||
                other.defaultTasks == defaultTasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, isActive, title, startDate, endDate, defaultTasks);

  @override
  String toString() {
    return 'CheckListDto(id: $id, isActive: $isActive, title: $title, startDate: $startDate, endDate: $endDate, defaultTasks: $defaultTasks)';
  }
}

/// @nodoc
abstract mixin class $CheckListDtoCopyWith<$Res> {
  factory $CheckListDtoCopyWith(
          CheckListDto value, $Res Function(CheckListDto) _then) =
      _$CheckListDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "is_active") bool? isActive,
      String title,
      @JsonKey(name: "start_date") String? startDate,
      @JsonKey(name: "end_date") String? endDate,
      @JsonKey(name: "default_tasks") String? defaultTasks});
}

/// @nodoc
class _$CheckListDtoCopyWithImpl<$Res> implements $CheckListDtoCopyWith<$Res> {
  _$CheckListDtoCopyWithImpl(this._self, this._then);

  final CheckListDto _self;
  final $Res Function(CheckListDto) _then;

  /// Create a copy of CheckListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = freezed,
    Object? title = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? defaultTasks = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultTasks: freezed == defaultTasks
          ? _self.defaultTasks
          : defaultTasks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CheckListDto implements CheckListDto {
  const _CheckListDto(
      {required this.id,
      @JsonKey(name: "is_active") this.isActive,
      required this.title,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "default_tasks") this.defaultTasks});
  factory _CheckListDto.fromJson(Map<String, dynamic> json) =>
      _$CheckListDtoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String title;
  @override
  @JsonKey(name: "start_date")
  final String? startDate;
  @override
  @JsonKey(name: "end_date")
  final String? endDate;
  @override
  @JsonKey(name: "default_tasks")
  final String? defaultTasks;

  /// Create a copy of CheckListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckListDtoCopyWith<_CheckListDto> get copyWith =>
      __$CheckListDtoCopyWithImpl<_CheckListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckListDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckListDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.defaultTasks, defaultTasks) ||
                other.defaultTasks == defaultTasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, isActive, title, startDate, endDate, defaultTasks);

  @override
  String toString() {
    return 'CheckListDto(id: $id, isActive: $isActive, title: $title, startDate: $startDate, endDate: $endDate, defaultTasks: $defaultTasks)';
  }
}

/// @nodoc
abstract mixin class _$CheckListDtoCopyWith<$Res>
    implements $CheckListDtoCopyWith<$Res> {
  factory _$CheckListDtoCopyWith(
          _CheckListDto value, $Res Function(_CheckListDto) _then) =
      __$CheckListDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "is_active") bool? isActive,
      String title,
      @JsonKey(name: "start_date") String? startDate,
      @JsonKey(name: "end_date") String? endDate,
      @JsonKey(name: "default_tasks") String? defaultTasks});
}

/// @nodoc
class __$CheckListDtoCopyWithImpl<$Res>
    implements _$CheckListDtoCopyWith<$Res> {
  __$CheckListDtoCopyWithImpl(this._self, this._then);

  final _CheckListDto _self;
  final $Res Function(_CheckListDto) _then;

  /// Create a copy of CheckListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isActive = freezed,
    Object? title = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? defaultTasks = freezed,
  }) {
    return _then(_CheckListDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultTasks: freezed == defaultTasks
          ? _self.defaultTasks
          : defaultTasks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
