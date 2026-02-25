// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaDTO {
  int get id;
  String? get file;
  String? get title;
  String? get type;
  String? get body;
  String? get icon;

  /// Create a copy of MediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MediaDTOCopyWith<MediaDTO> get copyWith =>
      _$MediaDTOCopyWithImpl<MediaDTO>(this as MediaDTO, _$identity);

  /// Serializes this MediaDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MediaDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, file, title, type, body, icon);

  @override
  String toString() {
    return 'MediaDTO(id: $id, file: $file, title: $title, type: $type, body: $body, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class $MediaDTOCopyWith<$Res> {
  factory $MediaDTOCopyWith(MediaDTO value, $Res Function(MediaDTO) _then) =
      _$MediaDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? file,
      String? title,
      String? type,
      String? body,
      String? icon});
}

/// @nodoc
class _$MediaDTOCopyWithImpl<$Res> implements $MediaDTOCopyWith<$Res> {
  _$MediaDTOCopyWithImpl(this._self, this._then);

  final MediaDTO _self;
  final $Res Function(MediaDTO) _then;

  /// Create a copy of MediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? file = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? body = freezed,
    Object? icon = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MediaDTO implements MediaDTO {
  const _MediaDTO(
      {required this.id,
      this.file,
      this.title,
      this.type,
      this.body,
      this.icon});
  factory _MediaDTO.fromJson(Map<String, dynamic> json) =>
      _$MediaDTOFromJson(json);

  @override
  final int id;
  @override
  final String? file;
  @override
  final String? title;
  @override
  final String? type;
  @override
  final String? body;
  @override
  final String? icon;

  /// Create a copy of MediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MediaDTOCopyWith<_MediaDTO> get copyWith =>
      __$MediaDTOCopyWithImpl<_MediaDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MediaDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MediaDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, file, title, type, body, icon);

  @override
  String toString() {
    return 'MediaDTO(id: $id, file: $file, title: $title, type: $type, body: $body, icon: $icon)';
  }
}

/// @nodoc
abstract mixin class _$MediaDTOCopyWith<$Res>
    implements $MediaDTOCopyWith<$Res> {
  factory _$MediaDTOCopyWith(_MediaDTO value, $Res Function(_MediaDTO) _then) =
      __$MediaDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? file,
      String? title,
      String? type,
      String? body,
      String? icon});
}

/// @nodoc
class __$MediaDTOCopyWithImpl<$Res> implements _$MediaDTOCopyWith<$Res> {
  __$MediaDTOCopyWithImpl(this._self, this._then);

  final _MediaDTO _self;
  final $Res Function(_MediaDTO) _then;

  /// Create a copy of MediaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? file = freezed,
    Object? title = freezed,
    Object? type = freezed,
    Object? body = freezed,
    Object? icon = freezed,
  }) {
    return _then(_MediaDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
