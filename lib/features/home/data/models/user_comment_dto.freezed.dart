// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCommentDTO {
  int get id;
  @JsonKey(name: "full_name")
  String? get fullName;
  String? get email;
  String? get avatar;

  /// Create a copy of UserCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCommentDTOCopyWith<UserCommentDTO> get copyWith =>
      _$UserCommentDTOCopyWithImpl<UserCommentDTO>(
          this as UserCommentDTO, _$identity);

  /// Serializes this UserCommentDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCommentDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, avatar);

  @override
  String toString() {
    return 'UserCommentDTO(id: $id, fullName: $fullName, email: $email, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $UserCommentDTOCopyWith<$Res> {
  factory $UserCommentDTOCopyWith(
          UserCommentDTO value, $Res Function(UserCommentDTO) _then) =
      _$UserCommentDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "full_name") String? fullName,
      String? email,
      String? avatar});
}

/// @nodoc
class _$UserCommentDTOCopyWithImpl<$Res>
    implements $UserCommentDTOCopyWith<$Res> {
  _$UserCommentDTOCopyWithImpl(this._self, this._then);

  final UserCommentDTO _self;
  final $Res Function(UserCommentDTO) _then;

  /// Create a copy of UserCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserCommentDTO implements UserCommentDTO {
  const _UserCommentDTO(
      {required this.id,
      @JsonKey(name: "full_name") this.fullName,
      this.email,
      this.avatar});
  factory _UserCommentDTO.fromJson(Map<String, dynamic> json) =>
      _$UserCommentDTOFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  final String? email;
  @override
  final String? avatar;

  /// Create a copy of UserCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCommentDTOCopyWith<_UserCommentDTO> get copyWith =>
      __$UserCommentDTOCopyWithImpl<_UserCommentDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserCommentDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCommentDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, avatar);

  @override
  String toString() {
    return 'UserCommentDTO(id: $id, fullName: $fullName, email: $email, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$UserCommentDTOCopyWith<$Res>
    implements $UserCommentDTOCopyWith<$Res> {
  factory _$UserCommentDTOCopyWith(
          _UserCommentDTO value, $Res Function(_UserCommentDTO) _then) =
      __$UserCommentDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "full_name") String? fullName,
      String? email,
      String? avatar});
}

/// @nodoc
class __$UserCommentDTOCopyWithImpl<$Res>
    implements _$UserCommentDTOCopyWith<$Res> {
  __$UserCommentDTOCopyWithImpl(this._self, this._then);

  final _UserCommentDTO _self;
  final $Res Function(_UserCommentDTO) _then;

  /// Create a copy of UserCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_UserCommentDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
