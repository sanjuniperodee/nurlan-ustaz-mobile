// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationDTO _$PaginationDTOFromJson(Map<String, dynamic> json) {
  return _PaginationDTO.fromJson(json);
}

/// @nodoc
mixin _$PaginationDTO {
  List<ResultTeachingDTO> get results => throw _privateConstructorUsedError;
  MetaDTO get meta => throw _privateConstructorUsedError;
  LinksDTO get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationDTOCopyWith<PaginationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDTOCopyWith<$Res> {
  factory $PaginationDTOCopyWith(
          PaginationDTO value, $Res Function(PaginationDTO) then) =
      _$PaginationDTOCopyWithImpl<$Res, PaginationDTO>;
  @useResult
  $Res call({List<ResultTeachingDTO> results, MetaDTO meta, LinksDTO links});

  $MetaDTOCopyWith<$Res> get meta;
  $LinksDTOCopyWith<$Res> get links;
}

/// @nodoc
class _$PaginationDTOCopyWithImpl<$Res, $Val extends PaginationDTO>
    implements $PaginationDTOCopyWith<$Res> {
  _$PaginationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? meta = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaDTO,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as LinksDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaDTOCopyWith<$Res> get meta {
    return $MetaDTOCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksDTOCopyWith<$Res> get links {
    return $LinksDTOCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaginationDTOCopyWith<$Res>
    implements $PaginationDTOCopyWith<$Res> {
  factory _$$_PaginationDTOCopyWith(
          _$_PaginationDTO value, $Res Function(_$_PaginationDTO) then) =
      __$$_PaginationDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ResultTeachingDTO> results, MetaDTO meta, LinksDTO links});

  @override
  $MetaDTOCopyWith<$Res> get meta;
  @override
  $LinksDTOCopyWith<$Res> get links;
}

/// @nodoc
class __$$_PaginationDTOCopyWithImpl<$Res>
    extends _$PaginationDTOCopyWithImpl<$Res, _$_PaginationDTO>
    implements _$$_PaginationDTOCopyWith<$Res> {
  __$$_PaginationDTOCopyWithImpl(
      _$_PaginationDTO _value, $Res Function(_$_PaginationDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? meta = null,
    Object? links = null,
  }) {
    return _then(_$_PaginationDTO(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTeachingDTO>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as MetaDTO,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as LinksDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationDTO implements _PaginationDTO {
  const _$_PaginationDTO(
      {required final List<ResultTeachingDTO> results,
      required this.meta,
      required this.links})
      : _results = results;

  factory _$_PaginationDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationDTOFromJson(json);

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

  @override
  String toString() {
    return 'PaginationDTO(results: $results, meta: $meta, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationDTO &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), meta, links);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationDTOCopyWith<_$_PaginationDTO> get copyWith =>
      __$$_PaginationDTOCopyWithImpl<_$_PaginationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationDTOToJson(
      this,
    );
  }
}

abstract class _PaginationDTO implements PaginationDTO {
  const factory _PaginationDTO(
      {required final List<ResultTeachingDTO> results,
      required final MetaDTO meta,
      required final LinksDTO links}) = _$_PaginationDTO;

  factory _PaginationDTO.fromJson(Map<String, dynamic> json) =
      _$_PaginationDTO.fromJson;

  @override
  List<ResultTeachingDTO> get results;
  @override
  MetaDTO get meta;
  @override
  LinksDTO get links;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationDTOCopyWith<_$_PaginationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

MetaDTO _$MetaDTOFromJson(Map<String, dynamic> json) {
  return _MetaDTO.fromJson(json);
}

/// @nodoc
mixin _$MetaDTO {
  PaginationMeta get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaDTOCopyWith<MetaDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaDTOCopyWith<$Res> {
  factory $MetaDTOCopyWith(MetaDTO value, $Res Function(MetaDTO) then) =
      _$MetaDTOCopyWithImpl<$Res, MetaDTO>;
  @useResult
  $Res call({PaginationMeta pagination});

  $PaginationMetaCopyWith<$Res> get pagination;
}

/// @nodoc
class _$MetaDTOCopyWithImpl<$Res, $Val extends MetaDTO>
    implements $MetaDTOCopyWith<$Res> {
  _$MetaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get pagination {
    return $PaginationMetaCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MetaDTOCopyWith<$Res> implements $MetaDTOCopyWith<$Res> {
  factory _$$_MetaDTOCopyWith(
          _$_MetaDTO value, $Res Function(_$_MetaDTO) then) =
      __$$_MetaDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationMeta pagination});

  @override
  $PaginationMetaCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$_MetaDTOCopyWithImpl<$Res>
    extends _$MetaDTOCopyWithImpl<$Res, _$_MetaDTO>
    implements _$$_MetaDTOCopyWith<$Res> {
  __$$_MetaDTOCopyWithImpl(_$_MetaDTO _value, $Res Function(_$_MetaDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_$_MetaDTO(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MetaDTO implements _MetaDTO {
  const _$_MetaDTO({required this.pagination});

  factory _$_MetaDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MetaDTOFromJson(json);

  @override
  final PaginationMeta pagination;

  @override
  String toString() {
    return 'MetaDTO(pagination: $pagination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MetaDTO &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaDTOCopyWith<_$_MetaDTO> get copyWith =>
      __$$_MetaDTOCopyWithImpl<_$_MetaDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaDTOToJson(
      this,
    );
  }
}

abstract class _MetaDTO implements MetaDTO {
  const factory _MetaDTO({required final PaginationMeta pagination}) =
      _$_MetaDTO;

  factory _MetaDTO.fromJson(Map<String, dynamic> json) = _$_MetaDTO.fromJson;

  @override
  PaginationMeta get pagination;
  @override
  @JsonKey(ignore: true)
  _$$_MetaDTOCopyWith<_$_MetaDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

LinksDTO _$LinksDTOFromJson(Map<String, dynamic> json) {
  return _LinksDTO.fromJson(json);
}

/// @nodoc
mixin _$LinksDTO {
  String get first => throw _privateConstructorUsedError;
  String get last => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get prev => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksDTOCopyWith<LinksDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksDTOCopyWith<$Res> {
  factory $LinksDTOCopyWith(LinksDTO value, $Res Function(LinksDTO) then) =
      _$LinksDTOCopyWithImpl<$Res, LinksDTO>;
  @useResult
  $Res call({String first, String last, String? next, String? prev});
}

/// @nodoc
class _$LinksDTOCopyWithImpl<$Res, $Val extends LinksDTO>
    implements $LinksDTOCopyWith<$Res> {
  _$LinksDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_value.copyWith(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinksDTOCopyWith<$Res> implements $LinksDTOCopyWith<$Res> {
  factory _$$_LinksDTOCopyWith(
          _$_LinksDTO value, $Res Function(_$_LinksDTO) then) =
      __$$_LinksDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String first, String last, String? next, String? prev});
}

/// @nodoc
class __$$_LinksDTOCopyWithImpl<$Res>
    extends _$LinksDTOCopyWithImpl<$Res, _$_LinksDTO>
    implements _$$_LinksDTOCopyWith<$Res> {
  __$$_LinksDTOCopyWithImpl(
      _$_LinksDTO _value, $Res Function(_$_LinksDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = null,
    Object? last = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_$_LinksDTO(
      first: null == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as String,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LinksDTO implements _LinksDTO {
  const _$_LinksDTO(
      {required this.first, required this.last, this.next, this.prev});

  factory _$_LinksDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LinksDTOFromJson(json);

  @override
  final String first;
  @override
  final String last;
  @override
  final String? next;
  @override
  final String? prev;

  @override
  String toString() {
    return 'LinksDTO(first: $first, last: $last, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinksDTO &&
            (identical(other.first, first) || other.first == first) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, first, last, next, prev);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinksDTOCopyWith<_$_LinksDTO> get copyWith =>
      __$$_LinksDTOCopyWithImpl<_$_LinksDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinksDTOToJson(
      this,
    );
  }
}

abstract class _LinksDTO implements LinksDTO {
  const factory _LinksDTO(
      {required final String first,
      required final String last,
      final String? next,
      final String? prev}) = _$_LinksDTO;

  factory _LinksDTO.fromJson(Map<String, dynamic> json) = _$_LinksDTO.fromJson;

  @override
  String get first;
  @override
  String get last;
  @override
  String? get next;
  @override
  String? get prev;
  @override
  @JsonKey(ignore: true)
  _$$_LinksDTOCopyWith<_$_LinksDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call({int page, int pages, int count});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pages = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationMetaCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$_PaginationMetaCopyWith(
          _$_PaginationMeta value, $Res Function(_$_PaginationMeta) then) =
      __$$_PaginationMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int pages, int count});
}

/// @nodoc
class __$$_PaginationMetaCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$_PaginationMeta>
    implements _$$_PaginationMetaCopyWith<$Res> {
  __$$_PaginationMetaCopyWithImpl(
      _$_PaginationMeta _value, $Res Function(_$_PaginationMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pages = null,
    Object? count = null,
  }) {
    return _then(_$_PaginationMeta(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationMeta implements _PaginationMeta {
  const _$_PaginationMeta(
      {required this.page, required this.pages, required this.count});

  factory _$_PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationMetaFromJson(json);

  @override
  final int page;
  @override
  final int pages;
  @override
  final int count;

  @override
  String toString() {
    return 'PaginationMeta(page: $page, pages: $pages, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationMeta &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, pages, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationMetaCopyWith<_$_PaginationMeta> get copyWith =>
      __$$_PaginationMetaCopyWithImpl<_$_PaginationMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationMetaToJson(
      this,
    );
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta(
      {required final int page,
      required final int pages,
      required final int count}) = _$_PaginationMeta;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$_PaginationMeta.fromJson;

  @override
  int get page;
  @override
  int get pages;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationMetaCopyWith<_$_PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
