// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDTO {
  @JsonKey(name: "id")
  int? get id;
  @JsonKey(name: "date")
  String? get date;
  @JsonKey(name: "start_time")
  String? get startTime;
  @JsonKey(name: "end_time")
  String? get endTime;

  /// Create a copy of ChatDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatDTOCopyWith<ChatDTO> get copyWith =>
      _$ChatDTOCopyWithImpl<ChatDTO>(this as ChatDTO, _$identity);

  /// Serializes this ChatDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, startTime, endTime);

  @override
  String toString() {
    return 'ChatDTO(id: $id, date: $date, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class $ChatDTOCopyWith<$Res> {
  factory $ChatDTOCopyWith(ChatDTO value, $Res Function(ChatDTO) _then) =
      _$ChatDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime});
}

/// @nodoc
class _$ChatDTOCopyWithImpl<$Res> implements $ChatDTOCopyWith<$Res> {
  _$ChatDTOCopyWithImpl(this._self, this._then);

  final ChatDTO _self;
  final $Res Function(ChatDTO) _then;

  /// Create a copy of ChatDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatDTO implements ChatDTO {
  const _ChatDTO(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "end_time") this.endTime});
  factory _ChatDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "date")
  final String? date;
  @override
  @JsonKey(name: "start_time")
  final String? startTime;
  @override
  @JsonKey(name: "end_time")
  final String? endTime;

  /// Create a copy of ChatDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatDTOCopyWith<_ChatDTO> get copyWith =>
      __$ChatDTOCopyWithImpl<_ChatDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, startTime, endTime);

  @override
  String toString() {
    return 'ChatDTO(id: $id, date: $date, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class _$ChatDTOCopyWith<$Res> implements $ChatDTOCopyWith<$Res> {
  factory _$ChatDTOCopyWith(_ChatDTO value, $Res Function(_ChatDTO) _then) =
      __$ChatDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime});
}

/// @nodoc
class __$ChatDTOCopyWithImpl<$Res> implements _$ChatDTOCopyWith<$Res> {
  __$ChatDTOCopyWithImpl(this._self, this._then);

  final _ChatDTO _self;
  final $Res Function(_ChatDTO) _then;

  /// Create a copy of ChatDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_ChatDTO(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
