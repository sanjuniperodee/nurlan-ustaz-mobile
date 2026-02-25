// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_noti_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GetNotiDTO _$GetNotiDTOFromJson(Map<String, dynamic> json) {
  return _MediaDTO.fromJson(json);
}

/// @nodoc
mixin _$GetNotiDTO {
  List<MediaDTO>? get news;
  List<MediaDTO>? get live;
  @JsonKey(name: "dream_interpretation")
  List<MediaDTO>? get dream;
  @JsonKey(name: "muslim_name")
  List<MediaDTO>? get muslimName;
  @JsonKey(name: "tell_me_ustaz")
  List<MediaDTO>? get tellMe;

  /// Create a copy of GetNotiDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetNotiDTOCopyWith<GetNotiDTO> get copyWith =>
      _$GetNotiDTOCopyWithImpl<GetNotiDTO>(this as GetNotiDTO, _$identity);

  /// Serializes this GetNotiDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetNotiDTO &&
            const DeepCollectionEquality().equals(other.news, news) &&
            const DeepCollectionEquality().equals(other.live, live) &&
            const DeepCollectionEquality().equals(other.dream, dream) &&
            const DeepCollectionEquality()
                .equals(other.muslimName, muslimName) &&
            const DeepCollectionEquality().equals(other.tellMe, tellMe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(news),
      const DeepCollectionEquality().hash(live),
      const DeepCollectionEquality().hash(dream),
      const DeepCollectionEquality().hash(muslimName),
      const DeepCollectionEquality().hash(tellMe));

  @override
  String toString() {
    return 'GetNotiDTO(news: $news, live: $live, dream: $dream, muslimName: $muslimName, tellMe: $tellMe)';
  }
}

/// @nodoc
abstract mixin class $GetNotiDTOCopyWith<$Res> {
  factory $GetNotiDTOCopyWith(
          GetNotiDTO value, $Res Function(GetNotiDTO) _then) =
      _$GetNotiDTOCopyWithImpl;
  @useResult
  $Res call(
      {List<MediaDTO>? news,
      List<MediaDTO>? live,
      @JsonKey(name: "dream_interpretation") List<MediaDTO>? dream,
      @JsonKey(name: "muslim_name") List<MediaDTO>? muslimName,
      @JsonKey(name: "tell_me_ustaz") List<MediaDTO>? tellMe});
}

/// @nodoc
class _$GetNotiDTOCopyWithImpl<$Res> implements $GetNotiDTOCopyWith<$Res> {
  _$GetNotiDTOCopyWithImpl(this._self, this._then);

  final GetNotiDTO _self;
  final $Res Function(GetNotiDTO) _then;

  /// Create a copy of GetNotiDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = freezed,
    Object? live = freezed,
    Object? dream = freezed,
    Object? muslimName = freezed,
    Object? tellMe = freezed,
  }) {
    return _then(_self.copyWith(
      news: freezed == news
          ? _self.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      live: freezed == live
          ? _self.live
          : live // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      dream: freezed == dream
          ? _self.dream
          : dream // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      muslimName: freezed == muslimName
          ? _self.muslimName
          : muslimName // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      tellMe: freezed == tellMe
          ? _self.tellMe
          : tellMe // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MediaDTO implements GetNotiDTO {
  const _MediaDTO(
      {final List<MediaDTO>? news,
      final List<MediaDTO>? live,
      @JsonKey(name: "dream_interpretation") final List<MediaDTO>? dream,
      @JsonKey(name: "muslim_name") final List<MediaDTO>? muslimName,
      @JsonKey(name: "tell_me_ustaz") final List<MediaDTO>? tellMe})
      : _news = news,
        _live = live,
        _dream = dream,
        _muslimName = muslimName,
        _tellMe = tellMe;
  factory _MediaDTO.fromJson(Map<String, dynamic> json) =>
      _$MediaDTOFromJson(json);

  final List<MediaDTO>? _news;
  @override
  List<MediaDTO>? get news {
    final value = _news;
    if (value == null) return null;
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaDTO>? _live;
  @override
  List<MediaDTO>? get live {
    final value = _live;
    if (value == null) return null;
    if (_live is EqualUnmodifiableListView) return _live;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaDTO>? _dream;
  @override
  @JsonKey(name: "dream_interpretation")
  List<MediaDTO>? get dream {
    final value = _dream;
    if (value == null) return null;
    if (_dream is EqualUnmodifiableListView) return _dream;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaDTO>? _muslimName;
  @override
  @JsonKey(name: "muslim_name")
  List<MediaDTO>? get muslimName {
    final value = _muslimName;
    if (value == null) return null;
    if (_muslimName is EqualUnmodifiableListView) return _muslimName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaDTO>? _tellMe;
  @override
  @JsonKey(name: "tell_me_ustaz")
  List<MediaDTO>? get tellMe {
    final value = _tellMe;
    if (value == null) return null;
    if (_tellMe is EqualUnmodifiableListView) return _tellMe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of GetNotiDTO
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
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality().equals(other._live, _live) &&
            const DeepCollectionEquality().equals(other._dream, _dream) &&
            const DeepCollectionEquality()
                .equals(other._muslimName, _muslimName) &&
            const DeepCollectionEquality().equals(other._tellMe, _tellMe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_live),
      const DeepCollectionEquality().hash(_dream),
      const DeepCollectionEquality().hash(_muslimName),
      const DeepCollectionEquality().hash(_tellMe));

  @override
  String toString() {
    return 'GetNotiDTO(news: $news, live: $live, dream: $dream, muslimName: $muslimName, tellMe: $tellMe)';
  }
}

/// @nodoc
abstract mixin class _$MediaDTOCopyWith<$Res>
    implements $GetNotiDTOCopyWith<$Res> {
  factory _$MediaDTOCopyWith(_MediaDTO value, $Res Function(_MediaDTO) _then) =
      __$MediaDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<MediaDTO>? news,
      List<MediaDTO>? live,
      @JsonKey(name: "dream_interpretation") List<MediaDTO>? dream,
      @JsonKey(name: "muslim_name") List<MediaDTO>? muslimName,
      @JsonKey(name: "tell_me_ustaz") List<MediaDTO>? tellMe});
}

/// @nodoc
class __$MediaDTOCopyWithImpl<$Res> implements _$MediaDTOCopyWith<$Res> {
  __$MediaDTOCopyWithImpl(this._self, this._then);

  final _MediaDTO _self;
  final $Res Function(_MediaDTO) _then;

  /// Create a copy of GetNotiDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? news = freezed,
    Object? live = freezed,
    Object? dream = freezed,
    Object? muslimName = freezed,
    Object? tellMe = freezed,
  }) {
    return _then(_MediaDTO(
      news: freezed == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      live: freezed == live
          ? _self._live
          : live // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      dream: freezed == dream
          ? _self._dream
          : dream // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      muslimName: freezed == muslimName
          ? _self._muslimName
          : muslimName // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
      tellMe: freezed == tellMe
          ? _self._tellMe
          : tellMe // ignore: cast_nullable_to_non_nullable
              as List<MediaDTO>?,
    ));
  }
}

// dart format on
