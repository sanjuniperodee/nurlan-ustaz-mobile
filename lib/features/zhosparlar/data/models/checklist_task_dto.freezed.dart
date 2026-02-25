// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckListTaskDto {
  int get id;
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "is_completed")
  bool? get isCompleted;

  /// Create a copy of CheckListTaskDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckListTaskDtoCopyWith<CheckListTaskDto> get copyWith =>
      _$CheckListTaskDtoCopyWithImpl<CheckListTaskDto>(
          this as CheckListTaskDto, _$identity);

  /// Serializes this CheckListTaskDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckListTaskDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted);

  @override
  String toString() {
    return 'CheckListTaskDto(id: $id, title: $title, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $CheckListTaskDtoCopyWith<$Res> {
  factory $CheckListTaskDtoCopyWith(
          CheckListTaskDto value, $Res Function(CheckListTaskDto) _then) =
      _$CheckListTaskDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "is_completed") bool? isCompleted});
}

/// @nodoc
class _$CheckListTaskDtoCopyWithImpl<$Res>
    implements $CheckListTaskDtoCopyWith<$Res> {
  _$CheckListTaskDtoCopyWithImpl(this._self, this._then);

  final CheckListTaskDto _self;
  final $Res Function(CheckListTaskDto) _then;

  /// Create a copy of CheckListTaskDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CheckListTaskDto implements CheckListTaskDto {
  const _CheckListTaskDto(
      {required this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "is_completed") this.isCompleted});
  factory _CheckListTaskDto.fromJson(Map<String, dynamic> json) =>
      _$CheckListTaskDtoFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "is_completed")
  final bool? isCompleted;

  /// Create a copy of CheckListTaskDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CheckListTaskDtoCopyWith<_CheckListTaskDto> get copyWith =>
      __$CheckListTaskDtoCopyWithImpl<_CheckListTaskDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CheckListTaskDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckListTaskDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted);

  @override
  String toString() {
    return 'CheckListTaskDto(id: $id, title: $title, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class _$CheckListTaskDtoCopyWith<$Res>
    implements $CheckListTaskDtoCopyWith<$Res> {
  factory _$CheckListTaskDtoCopyWith(
          _CheckListTaskDto value, $Res Function(_CheckListTaskDto) _then) =
      __$CheckListTaskDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "is_completed") bool? isCompleted});
}

/// @nodoc
class __$CheckListTaskDtoCopyWithImpl<$Res>
    implements _$CheckListTaskDtoCopyWith<$Res> {
  __$CheckListTaskDtoCopyWithImpl(this._self, this._then);

  final _CheckListTaskDto _self;
  final $Res Function(_CheckListTaskDto) _then;

  /// Create a copy of CheckListTaskDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_CheckListTaskDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
