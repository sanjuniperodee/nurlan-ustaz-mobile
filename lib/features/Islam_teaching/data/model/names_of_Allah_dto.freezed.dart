// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'names_of_Allah_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NamesOfAllahDTO {
  int get id;
  @JsonKey(name: "is_saved")
  bool? get isSaved;
  String? get name;
  String? get arabic;
  String? get translation;
  String? get audio;
  String? get description;
  int? get number;

  /// Create a copy of NamesOfAllahDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NamesOfAllahDTOCopyWith<NamesOfAllahDTO> get copyWith =>
      _$NamesOfAllahDTOCopyWithImpl<NamesOfAllahDTO>(
          this as NamesOfAllahDTO, _$identity);

  /// Serializes this NamesOfAllahDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NamesOfAllahDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isSaved, name, arabic,
      translation, audio, description, number);

  @override
  String toString() {
    return 'NamesOfAllahDTO(id: $id, isSaved: $isSaved, name: $name, arabic: $arabic, translation: $translation, audio: $audio, description: $description, number: $number)';
  }
}

/// @nodoc
abstract mixin class $NamesOfAllahDTOCopyWith<$Res> {
  factory $NamesOfAllahDTOCopyWith(
          NamesOfAllahDTO value, $Res Function(NamesOfAllahDTO) _then) =
      _$NamesOfAllahDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "is_saved") bool? isSaved,
      String? name,
      String? arabic,
      String? translation,
      String? audio,
      String? description,
      int? number});
}

/// @nodoc
class _$NamesOfAllahDTOCopyWithImpl<$Res>
    implements $NamesOfAllahDTOCopyWith<$Res> {
  _$NamesOfAllahDTOCopyWithImpl(this._self, this._then);

  final NamesOfAllahDTO _self;
  final $Res Function(NamesOfAllahDTO) _then;

  /// Create a copy of NamesOfAllahDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isSaved = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? translation = freezed,
    Object? audio = freezed,
    Object? description = freezed,
    Object? number = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NamesOfAllahDTO implements NamesOfAllahDTO {
  const _NamesOfAllahDTO(
      {required this.id,
      @JsonKey(name: "is_saved") this.isSaved,
      this.name,
      this.arabic,
      this.translation,
      this.audio,
      this.description,
      this.number});
  factory _NamesOfAllahDTO.fromJson(Map<String, dynamic> json) =>
      _$NamesOfAllahDTOFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "is_saved")
  final bool? isSaved;
  @override
  final String? name;
  @override
  final String? arabic;
  @override
  final String? translation;
  @override
  final String? audio;
  @override
  final String? description;
  @override
  final int? number;

  /// Create a copy of NamesOfAllahDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NamesOfAllahDTOCopyWith<_NamesOfAllahDTO> get copyWith =>
      __$NamesOfAllahDTOCopyWithImpl<_NamesOfAllahDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NamesOfAllahDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NamesOfAllahDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arabic, arabic) || other.arabic == arabic) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isSaved, name, arabic,
      translation, audio, description, number);

  @override
  String toString() {
    return 'NamesOfAllahDTO(id: $id, isSaved: $isSaved, name: $name, arabic: $arabic, translation: $translation, audio: $audio, description: $description, number: $number)';
  }
}

/// @nodoc
abstract mixin class _$NamesOfAllahDTOCopyWith<$Res>
    implements $NamesOfAllahDTOCopyWith<$Res> {
  factory _$NamesOfAllahDTOCopyWith(
          _NamesOfAllahDTO value, $Res Function(_NamesOfAllahDTO) _then) =
      __$NamesOfAllahDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "is_saved") bool? isSaved,
      String? name,
      String? arabic,
      String? translation,
      String? audio,
      String? description,
      int? number});
}

/// @nodoc
class __$NamesOfAllahDTOCopyWithImpl<$Res>
    implements _$NamesOfAllahDTOCopyWith<$Res> {
  __$NamesOfAllahDTOCopyWithImpl(this._self, this._then);

  final _NamesOfAllahDTO _self;
  final $Res Function(_NamesOfAllahDTO) _then;

  /// Create a copy of NamesOfAllahDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isSaved = freezed,
    Object? name = freezed,
    Object? arabic = freezed,
    Object? translation = freezed,
    Object? audio = freezed,
    Object? description = freezed,
    Object? number = freezed,
  }) {
    return _then(_NamesOfAllahDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      arabic: freezed == arabic
          ? _self.arabic
          : arabic // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _self.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
