// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pillars_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PillarsDTO _$PillarsDTOFromJson(Map<String, dynamic> json) {
  return _PillarsDTO.fromJson(json);
}

/// @nodoc
mixin _$PillarsDTO {
  int get id => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PillarsDTOCopyWith<PillarsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PillarsDTOCopyWith<$Res> {
  factory $PillarsDTOCopyWith(
          PillarsDTO value, $Res Function(PillarsDTO) then) =
      _$PillarsDTOCopyWithImpl<$Res, PillarsDTO>;
  @useResult
  $Res call({int id, int? type, String? title, String? text, String? url});
}

/// @nodoc
class _$PillarsDTOCopyWithImpl<$Res, $Val extends PillarsDTO>
    implements $PillarsDTOCopyWith<$Res> {
  _$PillarsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PillarsDTOCopyWith<$Res>
    implements $PillarsDTOCopyWith<$Res> {
  factory _$$_PillarsDTOCopyWith(
          _$_PillarsDTO value, $Res Function(_$_PillarsDTO) then) =
      __$$_PillarsDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int? type, String? title, String? text, String? url});
}

/// @nodoc
class __$$_PillarsDTOCopyWithImpl<$Res>
    extends _$PillarsDTOCopyWithImpl<$Res, _$_PillarsDTO>
    implements _$$_PillarsDTOCopyWith<$Res> {
  __$$_PillarsDTOCopyWithImpl(
      _$_PillarsDTO _value, $Res Function(_$_PillarsDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_PillarsDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PillarsDTO implements _PillarsDTO {
  const _$_PillarsDTO(
      {required this.id, this.type, this.title, this.text, this.url});

  factory _$_PillarsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PillarsDTOFromJson(json);

  @override
  final int id;
  @override
  final int? type;
  @override
  final String? title;
  @override
  final String? text;
  @override
  final String? url;

  @override
  String toString() {
    return 'PillarsDTO(id: $id, type: $type, title: $title, text: $text, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PillarsDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, text, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PillarsDTOCopyWith<_$_PillarsDTO> get copyWith =>
      __$$_PillarsDTOCopyWithImpl<_$_PillarsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PillarsDTOToJson(
      this,
    );
  }
}

abstract class _PillarsDTO implements PillarsDTO {
  const factory _PillarsDTO(
      {required final int id,
      final int? type,
      final String? title,
      final String? text,
      final String? url}) = _$_PillarsDTO;

  factory _PillarsDTO.fromJson(Map<String, dynamic> json) =
      _$_PillarsDTO.fromJson;

  @override
  int get id;
  @override
  int? get type;
  @override
  String? get title;
  @override
  String? get text;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_PillarsDTOCopyWith<_$_PillarsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
