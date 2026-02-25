// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'namaz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NamazDTO {
  int get id;
  String? get type;
  @JsonKey(name: "prayer_time")
  int? get prayerTime;
  int? get queue;
  String? get title;
  String? get gender;
  String? get text;

  /// Create a copy of NamazDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NamazDTOCopyWith<NamazDTO> get copyWith =>
      _$NamazDTOCopyWithImpl<NamazDTO>(this as NamazDTO, _$identity);

  /// Serializes this NamazDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NamazDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.prayerTime, prayerTime) ||
                other.prayerTime == prayerTime) &&
            (identical(other.queue, queue) || other.queue == queue) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, prayerTime, queue, title, gender, text);

  @override
  String toString() {
    return 'NamazDTO(id: $id, type: $type, prayerTime: $prayerTime, queue: $queue, title: $title, gender: $gender, text: $text)';
  }
}

/// @nodoc
abstract mixin class $NamazDTOCopyWith<$Res> {
  factory $NamazDTOCopyWith(NamazDTO value, $Res Function(NamazDTO) _then) =
      _$NamazDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? type,
      @JsonKey(name: "prayer_time") int? prayerTime,
      int? queue,
      String? title,
      String? gender,
      String? text});
}

/// @nodoc
class _$NamazDTOCopyWithImpl<$Res> implements $NamazDTOCopyWith<$Res> {
  _$NamazDTOCopyWithImpl(this._self, this._then);

  final NamazDTO _self;
  final $Res Function(NamazDTO) _then;

  /// Create a copy of NamazDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? prayerTime = freezed,
    Object? queue = freezed,
    Object? title = freezed,
    Object? gender = freezed,
    Object? text = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      prayerTime: freezed == prayerTime
          ? _self.prayerTime
          : prayerTime // ignore: cast_nullable_to_non_nullable
              as int?,
      queue: freezed == queue
          ? _self.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NamazDTO implements NamazDTO {
  const _NamazDTO(
      {required this.id,
      this.type,
      @JsonKey(name: "prayer_time") this.prayerTime,
      this.queue,
      this.title,
      this.gender,
      this.text});
  factory _NamazDTO.fromJson(Map<String, dynamic> json) =>
      _$NamazDTOFromJson(json);

  @override
  final int id;
  @override
  final String? type;
  @override
  @JsonKey(name: "prayer_time")
  final int? prayerTime;
  @override
  final int? queue;
  @override
  final String? title;
  @override
  final String? gender;
  @override
  final String? text;

  /// Create a copy of NamazDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NamazDTOCopyWith<_NamazDTO> get copyWith =>
      __$NamazDTOCopyWithImpl<_NamazDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NamazDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NamazDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.prayerTime, prayerTime) ||
                other.prayerTime == prayerTime) &&
            (identical(other.queue, queue) || other.queue == queue) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, prayerTime, queue, title, gender, text);

  @override
  String toString() {
    return 'NamazDTO(id: $id, type: $type, prayerTime: $prayerTime, queue: $queue, title: $title, gender: $gender, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$NamazDTOCopyWith<$Res>
    implements $NamazDTOCopyWith<$Res> {
  factory _$NamazDTOCopyWith(_NamazDTO value, $Res Function(_NamazDTO) _then) =
      __$NamazDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? type,
      @JsonKey(name: "prayer_time") int? prayerTime,
      int? queue,
      String? title,
      String? gender,
      String? text});
}

/// @nodoc
class __$NamazDTOCopyWithImpl<$Res> implements _$NamazDTOCopyWith<$Res> {
  __$NamazDTOCopyWithImpl(this._self, this._then);

  final _NamazDTO _self;
  final $Res Function(_NamazDTO) _then;

  /// Create a copy of NamazDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? prayerTime = freezed,
    Object? queue = freezed,
    Object? title = freezed,
    Object? gender = freezed,
    Object? text = freezed,
  }) {
    return _then(_NamazDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      prayerTime: freezed == prayerTime
          ? _self.prayerTime
          : prayerTime // ignore: cast_nullable_to_non_nullable
              as int?,
      queue: freezed == queue
          ? _self.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
