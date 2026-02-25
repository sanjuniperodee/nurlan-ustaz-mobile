// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ayat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AyatDTO {
  int? get id;
  @JsonKey(name: "ayat_number")
  int? get ayatNumber;
  String? get name;
  String? get arabic;
  String? get transcription;
  String? get translation;

  /// Create a copy of AyatDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AyatDTOCopyWith<AyatDTO> get copyWith =>
      _$AyatDTOCopyWithImpl<AyatDTO>(this as AyatDTO, _$identity);

  /// Serializes this AyatDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AyatDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, ayatNumber, name, arabic, transcription, translation);

  @override
  String toString() {
    return 'AyatDTO(id: $id, ayatNumber: $ayatNumber, name: $name, arabic: $arabic, transcription: $transcription, translation: $translation)';
  }
}

/// @nodoc
abstract mixin class $AyatDTOCopyWith<$Res> {
  factory $AyatDTOCopyWith(AyatDTO value, $Res Function(AyatDTO) _then) =
      _$AyatDTOCopyWithImpl;
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
class _$AyatDTOCopyWithImpl<$Res> implements $AyatDTOCopyWith<$Res> {
  _$AyatDTOCopyWithImpl(this._self, this._then);

  final AyatDTO _self;
  final $Res Function(AyatDTO) _then;

  /// Create a copy of AyatDTO
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ayatNumber: freezed == ayatNumber
          ? _self.ayatNumber
          : ayatNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      transcription: freezed == transcription
          ? _self.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AyatDTO implements AyatDTO {
  const _AyatDTO(
      {this.id,
      @JsonKey(name: "ayat_number") this.ayatNumber,
      this.name,
      this.arabic,
      this.transcription,
      this.translation});
  factory _AyatDTO.fromJson(Map<String, dynamic> json) =>
      _$AyatDTOFromJson(json);

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

  /// Create a copy of AyatDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AyatDTOCopyWith<_AyatDTO> get copyWith =>
      __$AyatDTOCopyWithImpl<_AyatDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AyatDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AyatDTO &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, ayatNumber, name, arabic, transcription, translation);

  @override
  String toString() {
    return 'AyatDTO(id: $id, ayatNumber: $ayatNumber, name: $name, arabic: $arabic, transcription: $transcription, translation: $translation)';
  }
}

/// @nodoc
abstract mixin class _$AyatDTOCopyWith<$Res> implements $AyatDTOCopyWith<$Res> {
  factory _$AyatDTOCopyWith(_AyatDTO value, $Res Function(_AyatDTO) _then) =
      __$AyatDTOCopyWithImpl;
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
class __$AyatDTOCopyWithImpl<$Res> implements _$AyatDTOCopyWith<$Res> {
  __$AyatDTOCopyWithImpl(this._self, this._then);

  final _AyatDTO _self;
  final $Res Function(_AyatDTO) _then;

  /// Create a copy of AyatDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? ayatNumber = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? transcription = freezed,
    Object? translation = freezed,
  }) {
    return _then(_AyatDTO(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ayatNumber: freezed == ayatNumber
          ? _self.ayatNumber
          : ayatNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      transcription: freezed == transcription
          ? _self.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
