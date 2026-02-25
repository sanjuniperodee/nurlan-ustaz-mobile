// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_home_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultHomeDTO {
  @JsonKey(name: "is_liked")
  bool? get isLiked;
  @JsonKey(name: "is_saved")
  bool? get isSaved;
  @JsonKey(name: "is_live")
  bool? get isLive;
  @JsonKey(name: "is_free")
  bool? get free;
  @JsonKey(name: "is_purchased")
  bool? get isPurchased;
  @JsonKey(name: "is_top")
  bool? get isTop;
  @JsonKey(name: "likes_count")
  int? get likesCount;
  @JsonKey(name: "comments_count")
  int? get comentCount;
  @JsonKey(name: "ticket_url")
  String? get ticketUrl;
  @JsonKey(name: "available_tickets")
  int? get availableTicket;
  int? get id;
  int? get parent;
  String? get body;
  String? get name;
  String? get logo;
  double? get price;
  String? get title;
  String? get description;
  String? get text;
  String? get cover;
  String? get link;
  String? get url;
  UserCommentDTO? get user;
  @JsonKey(name: "start_time")
  DateTime? get startTime;
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @JsonKey(name: "is_active")
  bool? get isActive;
  List<MediaDTO>? get media;
  List<RequisitesDTO>? get requisites;
  List<ResultHomeDTO>? get children;
  List<StatisticsDTO>? get statistics;
  String? get address;

  /// Create a copy of ResultHomeDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultHomeDTOCopyWith<ResultHomeDTO> get copyWith =>
      _$ResultHomeDTOCopyWithImpl<ResultHomeDTO>(
          this as ResultHomeDTO, _$identity);

  /// Serializes this ResultHomeDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultHomeDTO &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.isTop, isTop) || other.isTop == isTop) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.comentCount, comentCount) ||
                other.comentCount == comentCount) &&
            (identical(other.ticketUrl, ticketUrl) ||
                other.ticketUrl == ticketUrl) &&
            (identical(other.availableTicket, availableTicket) ||
                other.availableTicket == availableTicket) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality()
                .equals(other.requisites, requisites) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            const DeepCollectionEquality()
                .equals(other.statistics, statistics) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLiked,
        isSaved,
        isLive,
        free,
        isPurchased,
        isTop,
        likesCount,
        comentCount,
        ticketUrl,
        availableTicket,
        id,
        parent,
        body,
        name,
        logo,
        price,
        title,
        description,
        text,
        cover,
        link,
        url,
        user,
        startTime,
        createdAt,
        isActive,
        const DeepCollectionEquality().hash(media),
        const DeepCollectionEquality().hash(requisites),
        const DeepCollectionEquality().hash(children),
        const DeepCollectionEquality().hash(statistics),
        address
      ]);

  @override
  String toString() {
    return 'ResultHomeDTO(isLiked: $isLiked, isSaved: $isSaved, isLive: $isLive, free: $free, isPurchased: $isPurchased, isTop: $isTop, likesCount: $likesCount, comentCount: $comentCount, ticketUrl: $ticketUrl, availableTicket: $availableTicket, id: $id, parent: $parent, body: $body, name: $name, logo: $logo, price: $price, title: $title, description: $description, text: $text, cover: $cover, link: $link, url: $url, user: $user, startTime: $startTime, createdAt: $createdAt, isActive: $isActive, media: $media, requisites: $requisites, children: $children, statistics: $statistics, address: $address)';
  }
}

/// @nodoc
abstract mixin class $ResultHomeDTOCopyWith<$Res> {
  factory $ResultHomeDTOCopyWith(
          ResultHomeDTO value, $Res Function(ResultHomeDTO) _then) =
      _$ResultHomeDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "is_liked") bool? isLiked,
      @JsonKey(name: "is_saved") bool? isSaved,
      @JsonKey(name: "is_live") bool? isLive,
      @JsonKey(name: "is_free") bool? free,
      @JsonKey(name: "is_purchased") bool? isPurchased,
      @JsonKey(name: "is_top") bool? isTop,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      @JsonKey(name: "ticket_url") String? ticketUrl,
      @JsonKey(name: "available_tickets") int? availableTicket,
      int? id,
      int? parent,
      String? body,
      String? name,
      String? logo,
      double? price,
      String? title,
      String? description,
      String? text,
      String? cover,
      String? link,
      String? url,
      UserCommentDTO? user,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media,
      List<RequisitesDTO>? requisites,
      List<ResultHomeDTO>? children,
      List<StatisticsDTO>? statistics,
      String? address});

  $UserCommentDTOCopyWith<$Res>? get user;
}

/// @nodoc
class _$ResultHomeDTOCopyWithImpl<$Res>
    implements $ResultHomeDTOCopyWith<$Res> {
  _$ResultHomeDTOCopyWithImpl(this._self, this._then);

  final ResultHomeDTO _self;
  final $Res Function(ResultHomeDTO) _then;

  /// Create a copy of ResultHomeDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = freezed,
    Object? isSaved = freezed,
    Object? isLive = freezed,
    Object? free = freezed,
    Object? isPurchased = freezed,
    Object? isTop = freezed,
    Object? likesCount = freezed,
    Object? comentCount = freezed,
    Object? ticketUrl = freezed,
    Object? availableTicket = freezed,
    Object? id = freezed,
    Object? parent = freezed,
    Object? body = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? price = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? text = freezed,
    Object? cover = freezed,
    Object? link = freezed,
    Object? url = freezed,
    Object? user = freezed,
    Object? startTime = freezed,
    Object? createdAt = freezed,
    Object? isActive = freezed,
    Object? media = freezed,
    Object? requisites = freezed,
    Object? children = freezed,
    Object? statistics = freezed,
    Object? address = freezed,
  }) {
    return _then(_self.copyWith(
      isLiked: freezed == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLive: freezed == isLive
          ? _self.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      free: freezed == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPurchased: freezed == isPurchased
          ? _self.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTop: freezed == isTop
          ? _self.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool?,
      likesCount: freezed == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      comentCount: freezed == comentCount
          ? _self.comentCount
          : comentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketUrl: freezed == ticketUrl
          ? _self.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      availableTicket: freezed == availableTicket
          ? _self.availableTicket
          : availableTicket // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _self.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCommentDTO?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      media: freezed == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      requisites: freezed == requisites
          ? _self.requisites
          : requisites // ignore: cast_nullable_to_non_nullable
              as List<RequisitesDTO>?,
      children: freezed == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>?,
      statistics: freezed == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<StatisticsDTO>?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ResultHomeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCommentDTOCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCommentDTOCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ResultHomeDTO implements ResultHomeDTO {
  const _ResultHomeDTO(
      {@JsonKey(name: "is_liked") this.isLiked = false,
      @JsonKey(name: "is_saved") this.isSaved = false,
      @JsonKey(name: "is_live") this.isLive,
      @JsonKey(name: "is_free") this.free,
      @JsonKey(name: "is_purchased") this.isPurchased,
      @JsonKey(name: "is_top") this.isTop,
      @JsonKey(name: "likes_count") this.likesCount,
      @JsonKey(name: "comments_count") this.comentCount,
      @JsonKey(name: "ticket_url") this.ticketUrl,
      @JsonKey(name: "available_tickets") this.availableTicket,
      this.id,
      this.parent,
      this.body,
      this.name,
      this.logo,
      this.price,
      this.title,
      this.description,
      this.text,
      this.cover,
      this.link,
      this.url,
      this.user,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "is_active") this.isActive,
      final List<MediaDTO>? media,
      final List<RequisitesDTO>? requisites,
      final List<ResultHomeDTO>? children,
      final List<StatisticsDTO>? statistics,
      this.address})
      : _media = media,
        _requisites = requisites,
        _children = children,
        _statistics = statistics;
  factory _ResultHomeDTO.fromJson(Map<String, dynamic> json) =>
      _$ResultHomeDTOFromJson(json);

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
  @JsonKey(name: "is_free")
  final bool? free;
  @override
  @JsonKey(name: "is_purchased")
  final bool? isPurchased;
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
  @JsonKey(name: "ticket_url")
  final String? ticketUrl;
  @override
  @JsonKey(name: "available_tickets")
  final int? availableTicket;
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
  final double? price;
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
  final String? url;
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

  final List<StatisticsDTO>? _statistics;
  @override
  List<StatisticsDTO>? get statistics {
    final value = _statistics;
    if (value == null) return null;
    if (_statistics is EqualUnmodifiableListView) return _statistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? address;

  /// Create a copy of ResultHomeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultHomeDTOCopyWith<_ResultHomeDTO> get copyWith =>
      __$ResultHomeDTOCopyWithImpl<_ResultHomeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResultHomeDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResultHomeDTO &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.isTop, isTop) || other.isTop == isTop) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.comentCount, comentCount) ||
                other.comentCount == comentCount) &&
            (identical(other.ticketUrl, ticketUrl) ||
                other.ticketUrl == ticketUrl) &&
            (identical(other.availableTicket, availableTicket) ||
                other.availableTicket == availableTicket) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.url, url) || other.url == url) &&
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
            const DeepCollectionEquality()
                .equals(other._statistics, _statistics) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLiked,
        isSaved,
        isLive,
        free,
        isPurchased,
        isTop,
        likesCount,
        comentCount,
        ticketUrl,
        availableTicket,
        id,
        parent,
        body,
        name,
        logo,
        price,
        title,
        description,
        text,
        cover,
        link,
        url,
        user,
        startTime,
        createdAt,
        isActive,
        const DeepCollectionEquality().hash(_media),
        const DeepCollectionEquality().hash(_requisites),
        const DeepCollectionEquality().hash(_children),
        const DeepCollectionEquality().hash(_statistics),
        address
      ]);

  @override
  String toString() {
    return 'ResultHomeDTO(isLiked: $isLiked, isSaved: $isSaved, isLive: $isLive, free: $free, isPurchased: $isPurchased, isTop: $isTop, likesCount: $likesCount, comentCount: $comentCount, ticketUrl: $ticketUrl, availableTicket: $availableTicket, id: $id, parent: $parent, body: $body, name: $name, logo: $logo, price: $price, title: $title, description: $description, text: $text, cover: $cover, link: $link, url: $url, user: $user, startTime: $startTime, createdAt: $createdAt, isActive: $isActive, media: $media, requisites: $requisites, children: $children, statistics: $statistics, address: $address)';
  }
}

/// @nodoc
abstract mixin class _$ResultHomeDTOCopyWith<$Res>
    implements $ResultHomeDTOCopyWith<$Res> {
  factory _$ResultHomeDTOCopyWith(
          _ResultHomeDTO value, $Res Function(_ResultHomeDTO) _then) =
      __$ResultHomeDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "is_liked") bool? isLiked,
      @JsonKey(name: "is_saved") bool? isSaved,
      @JsonKey(name: "is_live") bool? isLive,
      @JsonKey(name: "is_free") bool? free,
      @JsonKey(name: "is_purchased") bool? isPurchased,
      @JsonKey(name: "is_top") bool? isTop,
      @JsonKey(name: "likes_count") int? likesCount,
      @JsonKey(name: "comments_count") int? comentCount,
      @JsonKey(name: "ticket_url") String? ticketUrl,
      @JsonKey(name: "available_tickets") int? availableTicket,
      int? id,
      int? parent,
      String? body,
      String? name,
      String? logo,
      double? price,
      String? title,
      String? description,
      String? text,
      String? cover,
      String? link,
      String? url,
      UserCommentDTO? user,
      @JsonKey(name: "start_time") DateTime? startTime,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "is_active") bool? isActive,
      List<MediaDTO>? media,
      List<RequisitesDTO>? requisites,
      List<ResultHomeDTO>? children,
      List<StatisticsDTO>? statistics,
      String? address});

  @override
  $UserCommentDTOCopyWith<$Res>? get user;
}

/// @nodoc
class __$ResultHomeDTOCopyWithImpl<$Res>
    implements _$ResultHomeDTOCopyWith<$Res> {
  __$ResultHomeDTOCopyWithImpl(this._self, this._then);

  final _ResultHomeDTO _self;
  final $Res Function(_ResultHomeDTO) _then;

  /// Create a copy of ResultHomeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLiked = freezed,
    Object? isSaved = freezed,
    Object? isLive = freezed,
    Object? free = freezed,
    Object? isPurchased = freezed,
    Object? isTop = freezed,
    Object? likesCount = freezed,
    Object? comentCount = freezed,
    Object? ticketUrl = freezed,
    Object? availableTicket = freezed,
    Object? id = freezed,
    Object? parent = freezed,
    Object? body = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? price = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? text = freezed,
    Object? cover = freezed,
    Object? link = freezed,
    Object? url = freezed,
    Object? user = freezed,
    Object? startTime = freezed,
    Object? createdAt = freezed,
    Object? isActive = freezed,
    Object? media = freezed,
    Object? requisites = freezed,
    Object? children = freezed,
    Object? statistics = freezed,
    Object? address = freezed,
  }) {
    return _then(_ResultHomeDTO(
      isLiked: freezed == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSaved: freezed == isSaved
          ? _self.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLive: freezed == isLive
          ? _self.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      free: freezed == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPurchased: freezed == isPurchased
          ? _self.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTop: freezed == isTop
          ? _self.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool?,
      likesCount: freezed == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      comentCount: freezed == comentCount
          ? _self.comentCount
          : comentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketUrl: freezed == ticketUrl
          ? _self.ticketUrl
          : ticketUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      availableTicket: freezed == availableTicket
          ? _self.availableTicket
          : availableTicket // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _self.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _self.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserCommentDTO?,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      media: freezed == media
          ? _self._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      requisites: freezed == requisites
          ? _self._requisites
          : requisites // ignore: cast_nullable_to_non_nullable
              as List<RequisitesDTO>?,
      children: freezed == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<ResultHomeDTO>?,
      statistics: freezed == statistics
          ? _self._statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<StatisticsDTO>?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ResultHomeDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCommentDTOCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserCommentDTOCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
