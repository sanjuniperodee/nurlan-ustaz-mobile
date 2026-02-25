// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionDTO {
  @JsonKey(name: "id")
  int? get id;
  @JsonKey(name: "message")
  String? get message;
  @JsonKey(name: "username")
  String? get userName;
  @JsonKey(name: "created_at")
  String? get createdAt;
  @JsonKey(name: "body")
  String? get body;
  @JsonKey(name: "is_allowed")
  bool? get is_allowed;
  @JsonKey(name: "user")
  UserDto? get user;
  @JsonKey(name: "avatar")
  String? get avatar;
  @JsonKey(name: "email")
  String? get email;
  @JsonKey(name: "full_name")
  String? get fullName;

  /// Create a copy of QuestionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionDTOCopyWith<QuestionDTO> get copyWith =>
      _$QuestionDTOCopyWithImpl<QuestionDTO>(this as QuestionDTO, _$identity);

  /// Serializes this QuestionDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.is_allowed, is_allowed) ||
                other.is_allowed == is_allowed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, userName, createdAt,
      body, is_allowed, user, avatar, email, fullName);

  @override
  String toString() {
    return 'QuestionDTO(id: $id, message: $message, userName: $userName, createdAt: $createdAt, body: $body, is_allowed: $is_allowed, user: $user, avatar: $avatar, email: $email, fullName: $fullName)';
  }
}

/// @nodoc
abstract mixin class $QuestionDTOCopyWith<$Res> {
  factory $QuestionDTOCopyWith(
          QuestionDTO value, $Res Function(QuestionDTO) _then) =
      _$QuestionDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "username") String? userName,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "is_allowed") bool? is_allowed,
      @JsonKey(name: "user") UserDto? user,
      @JsonKey(name: "avatar") String? avatar,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "full_name") String? fullName});

  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class _$QuestionDTOCopyWithImpl<$Res> implements $QuestionDTOCopyWith<$Res> {
  _$QuestionDTOCopyWithImpl(this._self, this._then);

  final QuestionDTO _self;
  final $Res Function(QuestionDTO) _then;

  /// Create a copy of QuestionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? userName = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? is_allowed = freezed,
    Object? user = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      is_allowed: freezed == is_allowed
          ? _self.is_allowed
          : is_allowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuestionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _QuestionDTO implements QuestionDTO {
  const _QuestionDTO(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "username") this.userName,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "body") this.body,
      @JsonKey(name: "is_allowed") this.is_allowed,
      @JsonKey(name: "user") this.user,
      @JsonKey(name: "avatar") this.avatar,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "full_name") this.fullName});
  factory _QuestionDTO.fromJson(Map<String, dynamic> json) =>
      _$QuestionDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "username")
  final String? userName;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "body")
  final String? body;
  @override
  @JsonKey(name: "is_allowed")
  final bool? is_allowed;
  @override
  @JsonKey(name: "user")
  final UserDto? user;
  @override
  @JsonKey(name: "avatar")
  final String? avatar;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;

  /// Create a copy of QuestionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionDTOCopyWith<_QuestionDTO> get copyWith =>
      __$QuestionDTOCopyWithImpl<_QuestionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestionDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.is_allowed, is_allowed) ||
                other.is_allowed == is_allowed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, userName, createdAt,
      body, is_allowed, user, avatar, email, fullName);

  @override
  String toString() {
    return 'QuestionDTO(id: $id, message: $message, userName: $userName, createdAt: $createdAt, body: $body, is_allowed: $is_allowed, user: $user, avatar: $avatar, email: $email, fullName: $fullName)';
  }
}

/// @nodoc
abstract mixin class _$QuestionDTOCopyWith<$Res>
    implements $QuestionDTOCopyWith<$Res> {
  factory _$QuestionDTOCopyWith(
          _QuestionDTO value, $Res Function(_QuestionDTO) _then) =
      __$QuestionDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "username") String? userName,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "is_allowed") bool? is_allowed,
      @JsonKey(name: "user") UserDto? user,
      @JsonKey(name: "avatar") String? avatar,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "full_name") String? fullName});

  @override
  $UserDtoCopyWith<$Res>? get user;
}

/// @nodoc
class __$QuestionDTOCopyWithImpl<$Res> implements _$QuestionDTOCopyWith<$Res> {
  __$QuestionDTOCopyWithImpl(this._self, this._then);

  final _QuestionDTO _self;
  final $Res Function(_QuestionDTO) _then;

  /// Create a copy of QuestionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? userName = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? is_allowed = freezed,
    Object? user = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? fullName = freezed,
  }) {
    return _then(_QuestionDTO(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      is_allowed: freezed == is_allowed
          ? _self.is_allowed
          : is_allowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of QuestionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserDtoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
