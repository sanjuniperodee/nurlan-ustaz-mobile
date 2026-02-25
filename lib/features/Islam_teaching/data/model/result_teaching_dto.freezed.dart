// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_teaching_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultTeachingDTO {
  @JsonKey(name: "is_saved")
  bool? get isSaved;
  int? get id;
  String? get name;
  String? get arabic;
  String? get transcription;
  String? get translation;
  String? get audio;
  int? get number;
  String? get description;
  String? get gender;
  List<AyatDTO>? get ayats;

  /// Create a copy of ResultTeachingDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultTeachingDTOCopyWith<ResultTeachingDTO> get copyWith =>
      _$ResultTeachingDTOCopyWithImpl<ResultTeachingDTO>(
          this as ResultTeachingDTO, _$identity);

  /// Serializes this ResultTeachingDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultTeachingDTO &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(other.ayats, ayats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSaved,
      id,
      name,
      arabic,
      transcription,
      translation,
      audio,
      number,
      description,
      gender,
      const DeepCollectionEquality().hash(ayats));

  @override
  String toString() {
    return 'ResultTeachingDTO(isSaved: $isSaved, id: $id, name: $name, arabic: $arabic, transcription: $transcription, translation: $translation, audio: $audio, number: $number, description: $description, gender: $gender, ayats: $ayats)';
  }
}

/// @nodoc
abstract mixin class $ResultTeachingDTOCopyWith<$Res> {
  factory $ResultTeachingDTOCopyWith(
          ResultTeachingDTO value, $Res Function(ResultTeachingDTO) _then) =
      _$ResultTeachingDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "is_saved") bool? isSaved,
      int? id,
      String? name,
      String? arabic,
      String? transcription,
      String? translation,
      String? audio,
      int? number,
      String? description,
      String? gender,
      List<AyatDTO>? ayats});
}

/// @nodoc
class _$ResultTeachingDTOCopyWithImpl<$Res>
    implements $ResultTeachingDTOCopyWith<$Res> {
  _$ResultTeachingDTOCopyWithImpl(this._self, this._then);

  final ResultTeachingDTO _self;
  final $Res Function(ResultTeachingDTO) _then;

  /// Create a copy of ResultTeachingDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSaved = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? transcription = freezed,
    Object? translation = freezed,
    Object? audio = freezed,
    Object? number = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? ayats = freezed,
  }) {
    return _then(_self.copyWith(
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
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
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      ayats: freezed == ayats
          ? _self.ayats
          : ayats // ignore: cast_nullable_to_non_nullable
              as List<AyatDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ResultTeachingDTO implements ResultTeachingDTO {
  const _ResultTeachingDTO(
      {@JsonKey(name: "is_saved") this.isSaved = false,
      this.id,
      this.name,
      this.arabic,
      this.transcription,
      this.translation,
      this.audio,
      this.number,
      this.description,
      this.gender,
      final List<AyatDTO>? ayats})
      : _ayats = ayats;
  factory _ResultTeachingDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultTeachingDTOFromJson(json);

  @override
  @JsonKey(name: "is_saved")
  final bool? isSaved;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? arabic;
  @override
  final String? transcription;
  @override
  final String? translation;
  @override
  final String? audio;
  @override
  final int? number;
  @override
  final String? description;
  @override
  final String? gender;
  final List<AyatDTO>? _ayats;
  @override
  List<AyatDTO>? get ayats {
    final value = _ayats;
    if (value == null) return null;
    if (_ayats is EqualUnmodifiableListView) return _ayats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ResultTeachingDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultTeachingDTOCopyWith<_ResultTeachingDTO> get copyWith =>
      __$ResultTeachingDTOCopyWithImpl<_ResultTeachingDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResultTeachingDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResultTeachingDTO &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(other._ayats, _ayats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSaved,
      id,
      name,
      arabic,
      transcription,
      translation,
      audio,
      number,
      description,
      gender,
      const DeepCollectionEquality().hash(_ayats));

  @override
  String toString() {
    return 'ResultTeachingDTO(isSaved: $isSaved, id: $id, name: $name, arabic: $arabic, transcription: $transcription, translation: $translation, audio: $audio, number: $number, description: $description, gender: $gender, ayats: $ayats)';
  }
}

/// @nodoc
abstract mixin class _$ResultTeachingDTOCopyWith<$Res>
    implements $ResultTeachingDTOCopyWith<$Res> {
  factory _$ResultTeachingDTOCopyWith(
          _ResultTeachingDTO value, $Res Function(_ResultTeachingDTO) _then) =
      __$ResultTeachingDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "is_saved") bool? isSaved,
      int? id,
      String? name,
      String? arabic,
      String? transcription,
      String? translation,
      String? audio,
      int? number,
      String? description,
      String? gender,
      List<AyatDTO>? ayats});
}

/// @nodoc
class __$ResultTeachingDTOCopyWithImpl<$Res>
    implements _$ResultTeachingDTOCopyWith<$Res> {
  __$ResultTeachingDTOCopyWithImpl(this._self, this._then);

  final _ResultTeachingDTO _self;
  final $Res Function(_ResultTeachingDTO) _then;

  /// Create a copy of ResultTeachingDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isSaved = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? transcription = freezed,
    Object? translation = freezed,
    Object? audio = freezed,
    Object? number = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? ayats = freezed,
  }) {
    return _then(_ResultTeachingDTO(
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
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
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      ayats: freezed == ayats
          ? _self._ayats
          : ayats // ignore: cast_nullable_to_non_nullable
              as List<AyatDTO>?,
    ));
  }
}

// dart format on
