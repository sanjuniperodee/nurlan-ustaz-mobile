// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCommentDTO _$UserCommentDTOFromJson(Map<String, dynamic> json) {
  return _UserCommentDTO.fromJson(json);
}

/// @nodoc
mixin _$UserCommentDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCommentDTOCopyWith<UserCommentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCommentDTOCopyWith<$Res> {
  factory $UserCommentDTOCopyWith(
          UserCommentDTO value, $Res Function(UserCommentDTO) then) =
      _$UserCommentDTOCopyWithImpl<$Res, UserCommentDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "full_name") String? fullName,
      String? email,
      String? avatar});
}

/// @nodoc
class _$UserCommentDTOCopyWithImpl<$Res, $Val extends UserCommentDTO>
    implements $UserCommentDTOCopyWith<$Res> {
  _$UserCommentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCommentDTOImplCopyWith<$Res>
    implements $UserCommentDTOCopyWith<$Res> {
  factory _$$UserCommentDTOImplCopyWith(_$UserCommentDTOImpl value,
          $Res Function(_$UserCommentDTOImpl) then) =
      __$$UserCommentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "full_name") String? fullName,
      String? email,
      String? avatar});
}

/// @nodoc
class __$$UserCommentDTOImplCopyWithImpl<$Res>
    extends _$UserCommentDTOCopyWithImpl<$Res, _$UserCommentDTOImpl>
    implements _$$UserCommentDTOImplCopyWith<$Res> {
  __$$UserCommentDTOImplCopyWithImpl(
      _$UserCommentDTOImpl _value, $Res Function(_$UserCommentDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$UserCommentDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCommentDTOImpl implements _UserCommentDTO {
  const _$UserCommentDTOImpl(
      {required this.id,
      @JsonKey(name: "full_name") this.fullName,
      this.email,
      this.avatar});

  factory _$UserCommentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCommentDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  final String? email;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'UserCommentDTO(id: $id, fullName: $fullName, email: $email, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCommentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCommentDTOImplCopyWith<_$UserCommentDTOImpl> get copyWith =>
      __$$UserCommentDTOImplCopyWithImpl<_$UserCommentDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCommentDTOImplToJson(
      this,
    );
  }
}

abstract class _UserCommentDTO implements UserCommentDTO {
  const factory _UserCommentDTO(
      {required final int id,
      @JsonKey(name: "full_name") final String? fullName,
      final String? email,
      final String? avatar}) = _$UserCommentDTOImpl;

  factory _UserCommentDTO.fromJson(Map<String, dynamic> json) =
      _$UserCommentDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$UserCommentDTOImplCopyWith<_$UserCommentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
