// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pillars_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PillarsDTO {
  int get id;
  int? get type;
  String? get title;
  String? get gender;
  String? get text;
  String? get url;
  int? get time;
  String? get rakats;
  String? get cover;

  /// Create a copy of PillarsDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PillarsDTOCopyWith<PillarsDTO> get copyWith =>
      _$PillarsDTOCopyWithImpl<PillarsDTO>(this as PillarsDTO, _$identity);

  /// Serializes this PillarsDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PillarsDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.rakats, rakats) || other.rakats == rakats) &&
            (identical(other.cover, cover) || other.cover == cover));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, title, gender, text, url, time, rakats, cover);

  @override
  String toString() {
    return 'PillarsDTO(id: $id, type: $type, title: $title, gender: $gender, text: $text, url: $url, time: $time, rakats: $rakats, cover: $cover)';
  }
}

/// @nodoc
abstract mixin class $PillarsDTOCopyWith<$Res> {
  factory $PillarsDTOCopyWith(
          PillarsDTO value, $Res Function(PillarsDTO) _then) =
      _$PillarsDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int? type,
      String? title,
      String? gender,
      String? text,
      String? url,
      int? time,
      String? rakats,
      String? cover});
}

/// @nodoc
class _$PillarsDTOCopyWithImpl<$Res> implements $PillarsDTOCopyWith<$Res> {
  _$PillarsDTOCopyWithImpl(this._self, this._then);

  final PillarsDTO _self;
  final $Res Function(PillarsDTO) _then;

  /// Create a copy of PillarsDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? title = freezed,
    Object? gender = freezed,
    Object? text = freezed,
    Object? url = freezed,
    Object? time = freezed,
    Object? rakats = freezed,
    Object? cover = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
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
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      rakats: freezed == rakats
          ? _self.rakats
          : rakats // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _self.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PillarsDTO implements PillarsDTO {
  const _PillarsDTO(
      {required this.id,
      this.type,
      this.title,
      this.gender,
      this.text,
      this.url,
      this.time,
      this.rakats,
      this.cover});
  factory _PillarsDTO.fromJson(Map<String, dynamic> json) =>
      _$PillarsDTOFromJson(json);

  @override
  final int id;
  @override
  final int? type;
  @override
  final String? title;
  @override
  final String? gender;
  @override
  final String? text;
  @override
  final String? url;
  @override
  final int? time;
  @override
  final String? rakats;
  @override
  final String? cover;

  /// Create a copy of PillarsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PillarsDTOCopyWith<_PillarsDTO> get copyWith =>
      __$PillarsDTOCopyWithImpl<_PillarsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PillarsDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PillarsDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.rakats, rakats) || other.rakats == rakats) &&
            (identical(other.cover, cover) || other.cover == cover));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, title, gender, text, url, time, rakats, cover);

  @override
  String toString() {
    return 'PillarsDTO(id: $id, type: $type, title: $title, gender: $gender, text: $text, url: $url, time: $time, rakats: $rakats, cover: $cover)';
  }
}

/// @nodoc
abstract mixin class _$PillarsDTOCopyWith<$Res>
    implements $PillarsDTOCopyWith<$Res> {
  factory _$PillarsDTOCopyWith(
          _PillarsDTO value, $Res Function(_PillarsDTO) _then) =
      __$PillarsDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int? type,
      String? title,
      String? gender,
      String? text,
      String? url,
      int? time,
      String? rakats,
      String? cover});
}

/// @nodoc
class __$PillarsDTOCopyWithImpl<$Res> implements _$PillarsDTOCopyWith<$Res> {
  __$PillarsDTOCopyWithImpl(this._self, this._then);

  final _PillarsDTO _self;
  final $Res Function(_PillarsDTO) _then;

  /// Create a copy of PillarsDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? title = freezed,
    Object? gender = freezed,
    Object? text = freezed,
    Object? url = freezed,
    Object? time = freezed,
    Object? rakats = freezed,
    Object? cover = freezed,
  }) {
    return _then(_PillarsDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
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
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      rakats: freezed == rakats
          ? _self.rakats
          : rakats // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _self.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
