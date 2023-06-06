// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_home_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResultHomeDTO _$ResultHomeDTOFromJson(Map<String, dynamic> json) {
  return _ResultHomeDTO.fromJson(json);
}

/// @nodoc
mixin _$ResultHomeDTO {
  @JsonKey(name: "is_liked")
  bool? get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: "is_saved")
  bool? get isSaved => throw _privateConstructorUsedError;
  @JsonKey(name: "likes_count")
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: "comments_count")
  int? get comentCount => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  List<MediaDTO>? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultHomeDTOCopyWith<ResultHomeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultHomeDTOCopyWith<$Res> {
  factory $ResultHomeDTOCopyWith(
          ResultHomeDTO value, $Res Function(ResultHomeDTO) then) =
      _$ResultHomeDTOCopyWithImpl<$Res, ResultHomeDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: "is_liked") bool? isLiked,
      @JsonKey(name: "is_saved") bool? isSaved,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      int? id,
      String? title,
      String? text,
      String? cover,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media});
}

/// @nodoc
class _$ResultHomeDTOCopyWithImpl<$Res, $Val extends ResultHomeDTO>
    implements $ResultHomeDTOCopyWith<$Res> {
  _$ResultHomeDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = freezed,
    Object? isSaved = freezed,
    Object? likesCount = freezed,
    Object? comentCount = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? cover = freezed,
    Object? isActive = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      comentCount: freezed == comentCount
          ? _value.comentCount
          : comentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultHomeDTOCopyWith<$Res>
    implements $ResultHomeDTOCopyWith<$Res> {
  factory _$$_ResultHomeDTOCopyWith(
          _$_ResultHomeDTO value, $Res Function(_$_ResultHomeDTO) then) =
      __$$_ResultHomeDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "is_liked") bool? isLiked,
      @JsonKey(name: "is_saved") bool? isSaved,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      int? id,
      String? title,
      String? text,
      String? cover,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media});
}

/// @nodoc
class __$$_ResultHomeDTOCopyWithImpl<$Res>
    extends _$ResultHomeDTOCopyWithImpl<$Res, _$_ResultHomeDTO>
    implements _$$_ResultHomeDTOCopyWith<$Res> {
  __$$_ResultHomeDTOCopyWithImpl(
      _$_ResultHomeDTO _value, $Res Function(_$_ResultHomeDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = freezed,
    Object? isSaved = freezed,
    Object? likesCount = freezed,
    Object? comentCount = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? cover = freezed,
    Object? isActive = freezed,
    Object? media = freezed,
  }) {
    return _then(_$_ResultHomeDTO(
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      comentCount: freezed == comentCount
          ? _value.comentCount
          : comentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      media: freezed == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultHomeDTO implements _ResultHomeDTO {
  const _$_ResultHomeDTO(
      {@JsonKey(name: "is_liked") this.isLiked = false,
      @JsonKey(name: "is_saved") this.isSaved = false,
      @JsonKey(name: "likes_count") this.likesCount,
      @JsonKey(name: "comments_count") this.comentCount,
      this.id,
      this.title,
      this.text,
      this.cover,
      @JsonKey(name: "is_active") this.isActive,
      final List<MediaDTO>? media})
      : _media = media;

  factory _$_ResultHomeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ResultHomeDTOFromJson(json);

  @override
  @JsonKey(name: "is_liked")
  final bool? isLiked;
  @override
  @JsonKey(name: "is_saved")
  final bool? isSaved;
  @override
  @JsonKey(name: "likes_count")
  final int? likesCount;
  @override
  @JsonKey(name: "comments_count")
  final int? comentCount;
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? text;
  @override
  final String? cover;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  final List<MediaDTO>? _media;
  @override
  List<MediaDTO>? get media {
    final value = _media;
    if (value == null) return null;
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultHomeDTO(isLiked: $isLiked, isSaved: $isSaved, likesCount: $likesCount, comentCount: $comentCount, id: $id, title: $title, text: $text, cover: $cover, isActive: $isActive, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultHomeDTO &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.comentCount, comentCount) ||
                other.comentCount == comentCount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._media, _media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLiked,
      isSaved,
      likesCount,
      comentCount,
      id,
      title,
      text,
      cover,
      isActive,
      const DeepCollectionEquality().hash(_media));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultHomeDTOCopyWith<_$_ResultHomeDTO> get copyWith =>
      __$$_ResultHomeDTOCopyWithImpl<_$_ResultHomeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultHomeDTOToJson(
      this,
    );
  }
}

abstract class _ResultHomeDTO implements ResultHomeDTO {
  const factory _ResultHomeDTO(
      {@JsonKey(name: "is_liked") final bool? isLiked,
      @JsonKey(name: "is_saved") final bool? isSaved,
      @JsonKey(name: "likes_count") final int? likesCount,
      @JsonKey(name: "comments_count") final int? comentCount,
      final int? id,
      final String? title,
      final String? text,
      final String? cover,
      @JsonKey(name: "is_active") final bool? isActive,
      final List<MediaDTO>? media}) = _$_ResultHomeDTO;

  factory _ResultHomeDTO.fromJson(Map<String, dynamic> json) =
      _$_ResultHomeDTO.fromJson;

  @override
  @JsonKey(name: "is_liked")
  bool? get isLiked;
  @override
  @JsonKey(name: "is_saved")
  bool? get isSaved;
  @override
  @JsonKey(name: "likes_count")
  int? get likesCount;
  @override
  @JsonKey(name: "comments_count")
  int? get comentCount;
  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get text;
  @override
  String? get cover;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  List<MediaDTO>? get media;
  @override
  @JsonKey(ignore: true)
  _$$_ResultHomeDTOCopyWith<_$_ResultHomeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
