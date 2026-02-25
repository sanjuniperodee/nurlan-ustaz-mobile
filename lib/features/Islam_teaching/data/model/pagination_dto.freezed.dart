// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationDTO {
  List<ResultTeachingDTO> get results;
  MetaDTO get meta;
  LinksDTO get links;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationDTOCopyWith<PaginationDTO> get copyWith =>
      _$PaginationDTOCopyWithImpl<PaginationDTO>(
          this as PaginationDTO, _$identity);

  /// Serializes this PaginationDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationDTO &&
            const DeepCollectionEquality().equals(other.results, results) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(results), meta, links);

  @override
  String toString() {
    return 'PaginationDTO(results: $results, meta: $meta, links: $links)';
  }
}

/// @nodoc
abstract mixin class $PaginationDTOCopyWith<$Res> {
  factory $PaginationDTOCopyWith(
          PaginationDTO value, $Res Function(PaginationDTO) _then) =
      _$PaginationDTOCopyWithImpl;
  @useResult
  $Res call({List<ResultTeachingDTO> results, MetaDTO meta, LinksDTO links});

  $MetaDTOCopyWith<$Res> get meta;
  $LinksDTOCopyWith<$Res> get links;
}

/// @nodoc
class _$PaginationDTOCopyWithImpl<$Res>
    implements $PaginationDTOCopyWith<$Res> {
  _$PaginationDTOCopyWithImpl(this._self, this._then);

  final PaginationDTO _self;
  final $Res Function(PaginationDTO) _then;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? meta = null,
    Object? links = null,
  }) {
    return _then(_self.copyWith(
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaDTO,
      links: null == links
          ? _self.links
          : links // ignore: cast_nullable_to_non_nullable
              as LinksDTO,
    ));
  }

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaDTOCopyWith<$Res> get meta {
    return $MetaDTOCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LinksDTOCopyWith<$Res> get links {
    return $LinksDTOCopyWith<$Res>(_self.links, (value) {
      return _then(_self.copyWith(links: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PaginationDTO implements PaginationDTO {
  const _PaginationDTO(
      {required final List<ResultTeachingDTO> results,
      required this.meta,
      required this.links})
      : _results = results;
  factory _PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$PaginationDTOFromJson(json);

  final List<ResultTeachingDTO> _results;
  @override
  List<ResultTeachingDTO> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final MetaDTO meta;
  @override
  final LinksDTO links;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationDTOCopyWith<_PaginationDTO> get copyWith =>
      __$PaginationDTOCopyWithImpl<_PaginationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationDTO &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), meta, links);

  @override
  String toString() {
    return 'PaginationDTO(results: $results, meta: $meta, links: $links)';
  }
}

/// @nodoc
abstract mixin class _$PaginationDTOCopyWith<$Res>
    implements $PaginationDTOCopyWith<$Res> {
  factory _$PaginationDTOCopyWith(
          _PaginationDTO value, $Res Function(_PaginationDTO) _then) =
      __$PaginationDTOCopyWithImpl;
  @override
  @useResult
  $Res call({List<ResultTeachingDTO> results, MetaDTO meta, LinksDTO links});

  @override
  $MetaDTOCopyWith<$Res> get meta;
  @override
  $LinksDTOCopyWith<$Res> get links;
}

/// @nodoc
class __$PaginationDTOCopyWithImpl<$Res>
    implements _$PaginationDTOCopyWith<$Res> {
  __$PaginationDTOCopyWithImpl(this._self, this._then);

  final _PaginationDTO _self;
  final $Res Function(_PaginationDTO) _then;

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? results = null,
    Object? meta = null,
    Object? links = null,
  }) {
    return _then(_PaginationDTO(
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaDTO,
      links: null == links
          ? _self.links
          : links // ignore: cast_nullable_to_non_nullable
              as LinksDTO,
    ));
  }

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaDTOCopyWith<$Res> get meta {
    return $MetaDTOCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }

  /// Create a copy of PaginationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LinksDTOCopyWith<$Res> get links {
    return $LinksDTOCopyWith<$Res>(_self.links, (value) {
      return _then(_self.copyWith(links: value));
    });
  }
}

/// @nodoc
mixin _$MetaDTO {
  PaginationMeta get pagination;

  /// Create a copy of MetaDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MetaDTOCopyWith<MetaDTO> get copyWith =>
      _$MetaDTOCopyWithImpl<MetaDTO>(this as MetaDTO, _$identity);

  /// Serializes this MetaDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetaDTO &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @override
  String toString() {
    return 'MetaDTO(pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $MetaDTOCopyWith<$Res> {
  factory $MetaDTOCopyWith(MetaDTO value, $Res Function(MetaDTO) _then) =
      _$MetaDTOCopyWithImpl;
  @useResult
  $Res call({PaginationMeta pagination});

  $PaginationMetaCopyWith<$Res> get pagination;
}

/// @nodoc
class _$MetaDTOCopyWithImpl<$Res> implements $MetaDTOCopyWith<$Res> {
  _$MetaDTOCopyWithImpl(this._self, this._then);

  final MetaDTO _self;
  final $Res Function(MetaDTO) _then;

  /// Create a copy of MetaDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_self.copyWith(
      pagination: null == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }

  /// Create a copy of MetaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get pagination {
    return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
      return _then(_self.copyWith(pagination: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MetaDTO implements MetaDTO {
  const _MetaDTO({required this.pagination});
  factory _MetaDTO.fromJson(Map<String, dynamic> json) =>
      _$MetaDTOFromJson(json);

  @override
  final PaginationMeta pagination;

  /// Create a copy of MetaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MetaDTOCopyWith<_MetaDTO> get copyWith =>
      __$MetaDTOCopyWithImpl<_MetaDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MetaDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MetaDTO &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @override
  String toString() {
    return 'MetaDTO(pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class _$MetaDTOCopyWith<$Res> implements $MetaDTOCopyWith<$Res> {
  factory _$MetaDTOCopyWith(_MetaDTO value, $Res Function(_MetaDTO) _then) =
      __$MetaDTOCopyWithImpl;
  @override
  @useResult
  $Res call({PaginationMeta pagination});

  @override
  $PaginationMetaCopyWith<$Res> get pagination;
}

/// @nodoc
class __$MetaDTOCopyWithImpl<$Res> implements _$MetaDTOCopyWith<$Res> {
  __$MetaDTOCopyWithImpl(this._self, this._then);

  final _MetaDTO _self;
  final $Res Function(_MetaDTO) _then;

  /// Create a copy of MetaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_MetaDTO(
      pagination: null == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }

  /// Create a copy of MetaDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get pagination {
    return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
      return _then(_self.copyWith(pagination: value));
    });
  }
}

/// @nodoc
mixin _$LinksDTO {
  String get first;
  String get last;
  String? get next;
  String? get prev;

  /// Create a copy of LinksDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LinksDTOCopyWith<LinksDTO> get copyWith =>
      _$LinksDTOCopyWithImpl<LinksDTO>(this as LinksDTO, _$identity);

  /// Serializes this LinksDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LinksDTO &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, next, prev);

  @override
  String toString() {
    return 'LinksDTO(first: $first, last: $last, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class $LinksDTOCopyWith<$Res> {
  factory $LinksDTOCopyWith(LinksDTO value, $Res Function(LinksDTO) _then) =
      _$LinksDTOCopyWithImpl;
  @useResult
  $Res call({String first, String last, String? next, String? prev});
}

/// @nodoc
class _$LinksDTOCopyWithImpl<$Res> implements $LinksDTOCopyWith<$Res> {
  _$LinksDTOCopyWithImpl(this._self, this._then);

  final LinksDTO _self;
  final $Res Function(LinksDTO) _then;

  /// Create a copy of LinksDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_self.copyWith(
      first: null == first
          ? _self.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _self.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LinksDTO implements LinksDTO {
  const _LinksDTO(
      {required this.first, required this.last, this.next, this.prev});
  factory _LinksDTO.fromJson(Map<String, dynamic> json) =>
      _$LinksDTOFromJson(json);

  @override
  final String first;
  @override
  final String last;
  @override
  final String? next;
  @override
  final String? prev;

  /// Create a copy of LinksDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LinksDTOCopyWith<_LinksDTO> get copyWith =>
      __$LinksDTOCopyWithImpl<_LinksDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LinksDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LinksDTO &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, next, prev);

  @override
  String toString() {
    return 'LinksDTO(first: $first, last: $last, next: $next, prev: $prev)';
  }
}

/// @nodoc
abstract mixin class _$LinksDTOCopyWith<$Res>
    implements $LinksDTOCopyWith<$Res> {
  factory _$LinksDTOCopyWith(_LinksDTO value, $Res Function(_LinksDTO) _then) =
      __$LinksDTOCopyWithImpl;
  @override
  @useResult
  $Res call({String first, String last, String? next, String? prev});
}

/// @nodoc
class __$LinksDTOCopyWithImpl<$Res> implements _$LinksDTOCopyWith<$Res> {
  __$LinksDTOCopyWithImpl(this._self, this._then);

  final _LinksDTO _self;
  final $Res Function(_LinksDTO) _then;

  /// Create a copy of LinksDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_LinksDTO(
      first: null == first
          ? _self.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _self.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _self.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PaginationMeta {
  int get page;
  int get pages;
  int get count;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      _$PaginationMetaCopyWithImpl<PaginationMeta>(
          this as PaginationMeta, _$identity);

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationMeta &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, pages, count);

  @override
  String toString() {
    return 'PaginationMeta(page: $page, pages: $pages, count: $count)';
  }
}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) _then) =
      _$PaginationMetaCopyWithImpl;
  @useResult
  $Res call({int page, int pages, int count});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._self, this._then);

  final PaginationMeta _self;
  final $Res Function(PaginationMeta) _then;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pages = null,
    Object? count = null,
  }) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaginationMeta implements PaginationMeta {
  const _PaginationMeta(
      {required this.page, required this.pages, required this.count});
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);

  @override
  final int page;
  @override
  final int pages;
  @override
  final int count;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationMetaCopyWith<_PaginationMeta> get copyWith =>
      __$PaginationMetaCopyWithImpl<_PaginationMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationMeta &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, pages, count);

  @override
  String toString() {
    return 'PaginationMeta(page: $page, pages: $pages, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(
          _PaginationMeta value, $Res Function(_PaginationMeta) _then) =
      __$PaginationMetaCopyWithImpl;
  @override
  @useResult
  $Res call({int page, int pages, int count});
}

/// @nodoc
class __$PaginationMetaCopyWithImpl<$Res>
    implements _$PaginationMetaCopyWith<$Res> {
  __$PaginationMetaCopyWithImpl(this._self, this._then);

  final _PaginationMeta _self;
  final $Res Function(_PaginationMeta) _then;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? page = null,
    Object? pages = null,
    Object? count = null,
  }) {
    return _then(_PaginationMeta(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
