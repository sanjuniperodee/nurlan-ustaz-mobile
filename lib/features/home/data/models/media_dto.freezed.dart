// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaDTO _$MediaDTOFromJson(Map<String, dynamic> json) {
  return _MediaDTO.fromJson(json);
}

/// @nodoc
mixin _$MediaDTO {
  int get id => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaDTOCopyWith<MediaDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDTOCopyWith<$Res> {
  factory $MediaDTOCopyWith(MediaDTO value, $Res Function(MediaDTO) then) =
      _$MediaDTOCopyWithImpl<$Res, MediaDTO>;
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
class _$MediaDTOCopyWithImpl<$Res, $Val extends MediaDTO>
    implements $MediaDTOCopyWith<$Res> {
  _$MediaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaDTOImplCopyWith<$Res>
    implements $MediaDTOCopyWith<$Res> {
  factory _$$MediaDTOImplCopyWith(
          _$MediaDTOImpl value, $Res Function(_$MediaDTOImpl) then) =
      __$$MediaDTOImplCopyWithImpl<$Res>;
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
class __$$MediaDTOImplCopyWithImpl<$Res>
    extends _$MediaDTOCopyWithImpl<$Res, _$MediaDTOImpl>
    implements _$$MediaDTOImplCopyWith<$Res> {
  __$$MediaDTOImplCopyWithImpl(
      _$MediaDTOImpl _value, $Res Function(_$MediaDTOImpl) _then)
      : super(_value, _then);

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
    return _then(_$MediaDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaDTOImpl implements _MediaDTO {
  const _$MediaDTOImpl(
      {required this.id,
      this.file,
      this.title,
      this.type,
      this.body,
      this.icon});

  factory _$MediaDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaDTOImplFromJson(json);

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

  @override
  String toString() {
    return 'MediaDTO(id: $id, file: $file, title: $title, type: $type, body: $body, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, file, title, type, body, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaDTOImplCopyWith<_$MediaDTOImpl> get copyWith =>
      __$$MediaDTOImplCopyWithImpl<_$MediaDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaDTOImplToJson(
      this,
    );
  }
}

abstract class _MediaDTO implements MediaDTO {
  const factory _MediaDTO(
      {required final int id,
      final String? file,
      final String? title,
      final String? type,
      final String? body,
      final String? icon}) = _$MediaDTOImpl;

  factory _MediaDTO.fromJson(Map<String, dynamic> json) =
      _$MediaDTOImpl.fromJson;

  @override
  int get id;
  @override
  String? get file;
  @override
  String? get title;
  @override
  String? get type;
  @override
  String? get body;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$MediaDTOImplCopyWith<_$MediaDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
