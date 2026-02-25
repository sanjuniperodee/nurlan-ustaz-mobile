// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationItemDTO {
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "status")
  bool? get status;

  /// Create a copy of NotificationItemDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationItemDTOCopyWith<NotificationItemDTO> get copyWith =>
      _$NotificationItemDTOCopyWithImpl<NotificationItemDTO>(
          this as NotificationItemDTO, _$identity);

  /// Serializes this NotificationItemDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationItemDTO &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, status);

  @override
  String toString() {
    return 'NotificationItemDTO(title: $title, status: $status)';
  }
}

/// @nodoc
abstract mixin class $NotificationItemDTOCopyWith<$Res> {
  factory $NotificationItemDTOCopyWith(
          NotificationItemDTO value, $Res Function(NotificationItemDTO) _then) =
      _$NotificationItemDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "status") bool? status});
}

/// @nodoc
class _$NotificationItemDTOCopyWithImpl<$Res>
    implements $NotificationItemDTOCopyWith<$Res> {
  _$NotificationItemDTOCopyWithImpl(this._self, this._then);

  final NotificationItemDTO _self;
  final $Res Function(NotificationItemDTO) _then;

  /// Create a copy of NotificationItemDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationItemDTO implements NotificationItemDTO {
  const _NotificationItemDTO(
      {@JsonKey(name: "title") this.title,
      @JsonKey(name: "status") this.status});
  factory _NotificationItemDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemDTOFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "status")
  final bool? status;

  /// Create a copy of NotificationItemDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationItemDTOCopyWith<_NotificationItemDTO> get copyWith =>
      __$NotificationItemDTOCopyWithImpl<_NotificationItemDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationItemDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationItemDTO &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, status);

  @override
  String toString() {
    return 'NotificationItemDTO(title: $title, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$NotificationItemDTOCopyWith<$Res>
    implements $NotificationItemDTOCopyWith<$Res> {
  factory _$NotificationItemDTOCopyWith(_NotificationItemDTO value,
          $Res Function(_NotificationItemDTO) _then) =
      __$NotificationItemDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String? title,
      @JsonKey(name: "status") bool? status});
}

/// @nodoc
class __$NotificationItemDTOCopyWithImpl<$Res>
    implements _$NotificationItemDTOCopyWith<$Res> {
  __$NotificationItemDTOCopyWithImpl(this._self, this._then);

  final _NotificationItemDTO _self;
  final $Res Function(_NotificationItemDTO) _then;

  /// Create a copy of NotificationItemDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_NotificationItemDTO(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
