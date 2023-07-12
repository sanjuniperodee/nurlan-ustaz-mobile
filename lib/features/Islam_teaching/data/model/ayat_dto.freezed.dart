// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ayat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AyatDTO _$AyatDTOFromJson(Map<String, dynamic> json) {
  return _AyatDTO.fromJson(json);
}

/// @nodoc
mixin _$AyatDTO {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "ayat_number")
  int? get ayatNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get arabic => throw _privateConstructorUsedError;
  String? get transcription => throw _privateConstructorUsedError;
  String? get translation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AyatDTOCopyWith<AyatDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AyatDTOCopyWith<$Res> {
  factory $AyatDTOCopyWith(AyatDTO value, $Res Function(AyatDTO) then) =
      _$AyatDTOCopyWithImpl<$Res, AyatDTO>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "ayat_number") int? ayatNumber,
      String? name,
      String? arabic,
      String? transcription,
      String? translation});
}

/// @nodoc
class _$AyatDTOCopyWithImpl<$Res, $Val extends AyatDTO>
    implements $AyatDTOCopyWith<$Res> {
  _$AyatDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ayatNumber = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? transcription = freezed,
    Object? translation = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ayatNumber: freezed == ayatNumber
          ? _value.ayatNumber
          : ayatNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      transcription: freezed == transcription
          ? _value.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AyatDTOCopyWith<$Res> implements $AyatDTOCopyWith<$Res> {
  factory _$$_AyatDTOCopyWith(
          _$_AyatDTO value, $Res Function(_$_AyatDTO) then) =
      __$$_AyatDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "ayat_number") int? ayatNumber,
      String? name,
      String? arabic,
      String? transcription,
      String? translation});
}

/// @nodoc
class __$$_AyatDTOCopyWithImpl<$Res>
    extends _$AyatDTOCopyWithImpl<$Res, _$_AyatDTO>
    implements _$$_AyatDTOCopyWith<$Res> {
  __$$_AyatDTOCopyWithImpl(_$_AyatDTO _value, $Res Function(_$_AyatDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ayatNumber = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? transcription = freezed,
    Object? translation = freezed,
  }) {
    return _then(_$_AyatDTO(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ayatNumber: freezed == ayatNumber
          ? _value.ayatNumber
          : ayatNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _value.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      transcription: freezed == transcription
          ? _value.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AyatDTO implements _AyatDTO {
  const _$_AyatDTO(
      {this.id,
      @JsonKey(name: "ayat_number") this.ayatNumber,
      this.name,
      this.arabic,
      this.transcription,
      this.translation});

  factory _$_AyatDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AyatDTOFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "ayat_number")
  final int? ayatNumber;
  @override
  final String? name;
  @override
  final String? arabic;
  @override
  final String? transcription;
  @override
  final String? translation;

  @override
  String toString() {
    return 'AyatDTO(id: $id, ayatNumber: $ayatNumber, name: $name, arabic: $arabic, transcription: $transcription, translation: $translation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AyatDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ayatNumber, ayatNumber) ||
                other.ayatNumber == ayatNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, ayatNumber, name, arabic, transcription, translation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AyatDTOCopyWith<_$_AyatDTO> get copyWith =>
      __$$_AyatDTOCopyWithImpl<_$_AyatDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AyatDTOToJson(
      this,
    );
  }
}

abstract class _AyatDTO implements AyatDTO {
  const factory _AyatDTO(
      {final int? id,
      @JsonKey(name: "ayat_number") final int? ayatNumber,
      final String? name,
      final String? arabic,
      final String? transcription,
      final String? translation}) = _$_AyatDTO;

  factory _AyatDTO.fromJson(Map<String, dynamic> json) = _$_AyatDTO.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "ayat_number")
  int? get ayatNumber;
  @override
  String? get name;
  @override
  String? get arabic;
  @override
  String? get transcription;
  @override
  String? get translation;
  @override
  @JsonKey(ignore: true)
  _$$_AyatDTOCopyWith<_$_AyatDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
