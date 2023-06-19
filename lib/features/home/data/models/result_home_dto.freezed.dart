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
  @JsonKey(name: "is_live")
  bool? get isLive => throw _privateConstructorUsedError;
  @JsonKey(name: "is_top")
  bool? get isTop => throw _privateConstructorUsedError;
  @JsonKey(name: "likes_count")
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: "comments_count")
  int? get comentCount => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get parent => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  UserCommentDTO? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  List<MediaDTO>? get media => throw _privateConstructorUsedError;
  List<RequisitesDTO>? get requisites => throw _privateConstructorUsedError;
  List<ResultHomeDTO>? get children => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

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
      @JsonKey(name: "is_live") bool? isLive,
      @JsonKey(name: "is_top") bool? isTop,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      int? id,
      int? parent,
      String? body,
      String? name,
      String? logo,
      String? title,
      String? description,
      String? text,
      String? cover,
      String? link,
      UserCommentDTO? user,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media,
      List<RequisitesDTO>? requisites,
      List<ResultHomeDTO>? children,
      String? address});

  $UserCommentDTOCopyWith<$Res>? get user;
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
    Object? isLive = freezed,
    Object? isTop = freezed,
    Object? likesCount = freezed,
    Object? comentCount = freezed,
    Object? id = freezed,
    Object? parent = freezed,
    Object? body = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? text = freezed,
    Object? cover = freezed,
    Object? link = freezed,
    Object? user = freezed,
    Object? startTime = freezed,
    Object? createdAt = freezed,
    Object? isActive = freezed,
    Object? media = freezed,
    Object? requisites = freezed,
    Object? children = freezed,
    Object? address = freezed,
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
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTop: freezed == isTop
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
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
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCommentDTO?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      requisites: freezed == requisites
          ? _value.requisites
          : requisites // ignore: cast_nullable_to_non_nullable
              as List<RequisitesDTO>?,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCommentDTOCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCommentDTOCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
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
      @JsonKey(name: "is_live") bool? isLive,
      @JsonKey(name: "is_top") bool? isTop,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      int? id,
      int? parent,
      String? body,
      String? name,
      String? logo,
      String? title,
      String? description,
      String? text,
      String? cover,
      String? link,
      UserCommentDTO? user,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media,
      List<RequisitesDTO>? requisites,
      List<ResultHomeDTO>? children,
      String? address});

  @override
  $UserCommentDTOCopyWith<$Res>? get user;
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
    Object? isLive = freezed,
    Object? isTop = freezed,
    Object? likesCount = freezed,
    Object? comentCount = freezed,
    Object? id = freezed,
    Object? parent = freezed,
    Object? body = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? text = freezed,
    Object? cover = freezed,
    Object? link = freezed,
    Object? user = freezed,
    Object? startTime = freezed,
    Object? createdAt = freezed,
    Object? isActive = freezed,
    Object? media = freezed,
    Object? requisites = freezed,
    Object? children = freezed,
    Object? address = freezed,
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
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTop: freezed == isTop
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
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
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCommentDTO?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      media: freezed == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      requisites: freezed == requisites
          ? _value._requisites
          : requisites // ignore: cast_nullable_to_non_nullable
              as List<RequisitesDTO>?,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultHomeDTO implements _ResultHomeDTO {
  const _$_ResultHomeDTO(
      {@JsonKey(name: "is_liked") this.isLiked = false,
      @JsonKey(name: "is_saved") this.isSaved = false,
      @JsonKey(name: "is_live") this.isLive,
      @JsonKey(name: "is_top") this.isTop,
      @JsonKey(name: "likes_count") this.likesCount,
      @JsonKey(name: "comments_count") this.comentCount,
      this.id,
      this.parent,
      this.body,
      this.name,
      this.logo,
      this.title,
      this.description,
      this.text,
      this.cover,
      this.link,
      this.user,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "is_active") this.isActive,
      final List<MediaDTO>? media,
      final List<RequisitesDTO>? requisites,
      final List<ResultHomeDTO>? children,
      this.address})
      : _media = media,
        _requisites = requisites,
        _children = children;

  factory _$_ResultHomeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ResultHomeDTOFromJson(json);

  @override
  @JsonKey(name: "is_liked")
  final bool? isLiked;
  @override
  @JsonKey(name: "is_saved")
  final bool? isSaved;
  @override
  @JsonKey(name: "is_live")
  final bool? isLive;
  @override
  @JsonKey(name: "is_top")
  final bool? isTop;
  @override
  @JsonKey(name: "likes_count")
  final int? likesCount;
  @override
  @JsonKey(name: "comments_count")
  final int? comentCount;
  @override
  final int? id;
  @override
  final int? parent;
  @override
  final String? body;
  @override
  final String? name;
  @override
  final String? logo;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? text;
  @override
  final String? cover;
  @override
  final String? link;
  @override
  final UserCommentDTO? user;
  @override
  @JsonKey(name: "start_time")
  final DateTime? startTime;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
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

  final List<RequisitesDTO>? _requisites;
  @override
  List<RequisitesDTO>? get requisites {
    final value = _requisites;
    if (value == null) return null;
    if (_requisites is EqualUnmodifiableListView) return _requisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ResultHomeDTO>? _children;
  @override
  List<ResultHomeDTO>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? address;

  @override
  String toString() {
    return 'ResultHomeDTO(isLiked: $isLiked, isSaved: $isSaved, isLive: $isLive, isTop: $isTop, likesCount: $likesCount, comentCount: $comentCount, id: $id, parent: $parent, body: $body, name: $name, logo: $logo, title: $title, description: $description, text: $text, cover: $cover, link: $link, user: $user, startTime: $startTime, createdAt: $createdAt, isActive: $isActive, media: $media, requisites: $requisites, children: $children, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultHomeDTO &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.isTop, isTop) || other.isTop == isTop) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.comentCount, comentCount) ||
                other.comentCount == comentCount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            const DeepCollectionEquality()
                .equals(other._requisites, _requisites) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLiked,
        isSaved,
        isLive,
        isTop,
        likesCount,
        comentCount,
        id,
        parent,
        body,
        name,
        logo,
        title,
        description,
        text,
        cover,
        link,
        user,
        startTime,
        createdAt,
        isActive,
        const DeepCollectionEquality().hash(_media),
        const DeepCollectionEquality().hash(_requisites),
        const DeepCollectionEquality().hash(_children),
        address
      ]);

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
      @JsonKey(name: "is_live") final bool? isLive,
      @JsonKey(name: "is_top") final bool? isTop,
      @JsonKey(name: "likes_count") final int? likesCount,
      @JsonKey(name: "comments_count") final int? comentCount,
      final int? id,
      final int? parent,
      final String? body,
      final String? name,
      final String? logo,
      final String? title,
      final String? description,
      final String? text,
      final String? cover,
      final String? link,
      final UserCommentDTO? user,
      @JsonKey(name: "start_time") final DateTime? startTime,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "is_active") final bool? isActive,
      final List<MediaDTO>? media,
      final List<RequisitesDTO>? requisites,
      final List<ResultHomeDTO>? children,
      final String? address}) = _$_ResultHomeDTO;

  factory _ResultHomeDTO.fromJson(Map<String, dynamic> json) =
      _$_ResultHomeDTO.fromJson;

  @override
  @JsonKey(name: "is_liked")
  bool? get isLiked;
  @override
  @JsonKey(name: "is_saved")
  bool? get isSaved;
  @override
  @JsonKey(name: "is_live")
  bool? get isLive;
  @override
  @JsonKey(name: "is_top")
  bool? get isTop;
  @override
  @JsonKey(name: "likes_count")
  int? get likesCount;
  @override
  @JsonKey(name: "comments_count")
  int? get comentCount;
  @override
  int? get id;
  @override
  int? get parent;
  @override
  String? get body;
  @override
  String? get name;
  @override
  String? get logo;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get text;
  @override
  String? get cover;
  @override
  String? get link;
  @override
  UserCommentDTO? get user;
  @override
  @JsonKey(name: "start_time")
  DateTime? get startTime;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  List<MediaDTO>? get media;
  @override
  List<RequisitesDTO>? get requisites;
  @override
  List<ResultHomeDTO>? get children;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$_ResultHomeDTOCopyWith<_$_ResultHomeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
