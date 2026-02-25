// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenDTO {
  @JsonKey(name: "refresh")
  String get refresh;
  @JsonKey(name: "access")
  String get access;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TokenDTOCopyWith<TokenDTO> get copyWith =>
      _$TokenDTOCopyWithImpl<TokenDTO>(this as TokenDTO, _$identity);

  /// Serializes this TokenDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenDTO &&
            (identical(other.refresh, refresh) || other.refresh == refresh) &&
            (identical(other.access, access) || other.access == access));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refresh, access);

  @override
  String toString() {
    return 'TokenDTO(refresh: $refresh, access: $access)';
  }
}

/// @nodoc
abstract mixin class $TokenDTOCopyWith<$Res> {
  factory $TokenDTOCopyWith(TokenDTO value, $Res Function(TokenDTO) _then) =
      _$TokenDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "refresh") String refresh,
      @JsonKey(name: "access") String access});
}

/// @nodoc
class _$TokenDTOCopyWithImpl<$Res> implements $TokenDTOCopyWith<$Res> {
  _$TokenDTOCopyWithImpl(this._self, this._then);

  final TokenDTO _self;
  final $Res Function(TokenDTO) _then;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh = null,
    Object? access = null,
  }) {
    return _then(_self.copyWith(
      refresh: null == refresh
          ? _self.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      access: null == access
          ? _self.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TokenDTO implements TokenDTO {
  const _TokenDTO(
      {@JsonKey(name: "refresh") required this.refresh,
      @JsonKey(name: "access") required this.access});
  factory _TokenDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenDTOFromJson(json);

  @override
  @JsonKey(name: "refresh")
  final String refresh;
  @override
  @JsonKey(name: "access")
  final String access;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TokenDTOCopyWith<_TokenDTO> get copyWith =>
      __$TokenDTOCopyWithImpl<_TokenDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TokenDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenDTO &&
            (identical(other.refresh, refresh) || other.refresh == refresh) &&
            (identical(other.access, access) || other.access == access));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refresh, access);

  @override
  String toString() {
    return 'TokenDTO(refresh: $refresh, access: $access)';
  }
}

/// @nodoc
abstract mixin class _$TokenDTOCopyWith<$Res>
    implements $TokenDTOCopyWith<$Res> {
  factory _$TokenDTOCopyWith(_TokenDTO value, $Res Function(_TokenDTO) _then) =
      __$TokenDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "refresh") String refresh,
      @JsonKey(name: "access") String access});
}

/// @nodoc
class __$TokenDTOCopyWithImpl<$Res> implements _$TokenDTOCopyWith<$Res> {
  __$TokenDTOCopyWithImpl(this._self, this._then);

  final _TokenDTO _self;
  final $Res Function(_TokenDTO) _then;

  /// Create a copy of TokenDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? refresh = null,
    Object? access = null,
  }) {
    return _then(_TokenDTO(
      refresh: null == refresh
          ? _self.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      access: null == access
          ? _self.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TokenCreateDTO {
  @JsonKey(name: "email")
  String? get email;
  @JsonKey(name: "password")
  String? get password;

  /// Create a copy of TokenCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TokenCreateDTOCopyWith<TokenCreateDTO> get copyWith =>
      _$TokenCreateDTOCopyWithImpl<TokenCreateDTO>(
          this as TokenCreateDTO, _$identity);

  /// Serializes this TokenCreateDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenCreateDTO &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'TokenCreateDTO(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $TokenCreateDTOCopyWith<$Res> {
  factory $TokenCreateDTOCopyWith(
          TokenCreateDTO value, $Res Function(TokenCreateDTO) _then) =
      _$TokenCreateDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class _$TokenCreateDTOCopyWithImpl<$Res>
    implements $TokenCreateDTOCopyWith<$Res> {
  _$TokenCreateDTOCopyWithImpl(this._self, this._then);

  final TokenCreateDTO _self;
  final $Res Function(TokenCreateDTO) _then;

  /// Create a copy of TokenCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_self.copyWith(
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TokenCreateDTO implements TokenCreateDTO {
  const _TokenCreateDTO(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "password") this.password});
  factory _TokenCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenCreateDTOFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;

  /// Create a copy of TokenCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TokenCreateDTOCopyWith<_TokenCreateDTO> get copyWith =>
      __$TokenCreateDTOCopyWithImpl<_TokenCreateDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TokenCreateDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenCreateDTO &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'TokenCreateDTO(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$TokenCreateDTOCopyWith<$Res>
    implements $TokenCreateDTOCopyWith<$Res> {
  factory _$TokenCreateDTOCopyWith(
          _TokenCreateDTO value, $Res Function(_TokenCreateDTO) _then) =
      __$TokenCreateDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class __$TokenCreateDTOCopyWithImpl<$Res>
    implements _$TokenCreateDTOCopyWith<$Res> {
  __$TokenCreateDTOCopyWithImpl(this._self, this._then);

  final _TokenCreateDTO _self;
  final $Res Function(_TokenCreateDTO) _then;

  /// Create a copy of TokenCreateDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_TokenCreateDTO(
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ActivateUserDTO {
  @JsonKey(name: "user_id")
  int? get userId;
  @JsonKey(name: "code")
  String? get code;

  /// Create a copy of ActivateUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivateUserDTOCopyWith<ActivateUserDTO> get copyWith =>
      _$ActivateUserDTOCopyWithImpl<ActivateUserDTO>(
          this as ActivateUserDTO, _$identity);

  /// Serializes this ActivateUserDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivateUserDTO &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, code);

  @override
  String toString() {
    return 'ActivateUserDTO(userId: $userId, code: $code)';
  }
}

/// @nodoc
abstract mixin class $ActivateUserDTOCopyWith<$Res> {
  factory $ActivateUserDTOCopyWith(
          ActivateUserDTO value, $Res Function(ActivateUserDTO) _then) =
      _$ActivateUserDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "code") String? code});
}

/// @nodoc
class _$ActivateUserDTOCopyWithImpl<$Res>
    implements $ActivateUserDTOCopyWith<$Res> {
  _$ActivateUserDTOCopyWithImpl(this._self, this._then);

  final ActivateUserDTO _self;
  final $Res Function(ActivateUserDTO) _then;

  /// Create a copy of ActivateUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? code = freezed,
  }) {
    return _then(_self.copyWith(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ActivateUserDTO implements ActivateUserDTO {
  const _ActivateUserDTO(
      {@JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "code") this.code});
  factory _ActivateUserDTO.fromJson(Map<String, dynamic> json) =>
      _$ActivateUserDTOFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "code")
  final String? code;

  /// Create a copy of ActivateUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ActivateUserDTOCopyWith<_ActivateUserDTO> get copyWith =>
      __$ActivateUserDTOCopyWithImpl<_ActivateUserDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ActivateUserDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActivateUserDTO &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, code);

  @override
  String toString() {
    return 'ActivateUserDTO(userId: $userId, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$ActivateUserDTOCopyWith<$Res>
    implements $ActivateUserDTOCopyWith<$Res> {
  factory _$ActivateUserDTOCopyWith(
          _ActivateUserDTO value, $Res Function(_ActivateUserDTO) _then) =
      __$ActivateUserDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "code") String? code});
}

/// @nodoc
class __$ActivateUserDTOCopyWithImpl<$Res>
    implements _$ActivateUserDTOCopyWith<$Res> {
  __$ActivateUserDTOCopyWithImpl(this._self, this._then);

  final _ActivateUserDTO _self;
  final $Res Function(_ActivateUserDTO) _then;

  /// Create a copy of ActivateUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = freezed,
    Object? code = freezed,
  }) {
    return _then(_ActivateUserDTO(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
