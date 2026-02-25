// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: "full_name")
  String? get fullName;
  @JsonKey()
  String? get email;
  @JsonKey()
  String? get password;
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @JsonKey()
  Gender? get gender;
  @FormatDateTimeConverter()
  DateTime? get birthday;
  @JsonKey(name: "re_password")
  String? get rePassword;
  @JsonKey(name: "is_staff")
  bool? get isStaff;
  @JsonKey()
  String? get avatar;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<UserDto> get copyWith =>
      _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.rePassword, rePassword) ||
                other.rePassword == rePassword) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, password,
      phoneNumber, gender, birthday, rePassword, isStaff, avatar);

  @override
  String toString() {
    return 'UserDto(id: $id, fullName: $fullName, email: $email, password: $password, phoneNumber: $phoneNumber, gender: $gender, birthday: $birthday, rePassword: $rePassword, isStaff: $isStaff, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) =
      _$UserDtoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey() String? email,
      @JsonKey() String? password,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey() Gender? gender,
      @FormatDateTimeConverter() DateTime? birthday,
      @JsonKey(name: "re_password") String? rePassword,
      @JsonKey(name: "is_staff") bool? isStaff,
      @JsonKey() String? avatar});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? rePassword = freezed,
    Object? isStaff = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      birthday: freezed == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rePassword: freezed == rePassword
          ? _self.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      isStaff: freezed == isStaff
          ? _self.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDto implements UserDto {
  const _UserDto(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey() this.email,
      @JsonKey() this.password,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey() this.gender,
      @FormatDateTimeConverter() this.birthday,
      @JsonKey(name: "re_password") this.rePassword,
      @JsonKey(name: "is_staff") this.isStaff,
      @JsonKey() this.avatar});
  factory _UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey()
  final String? email;
  @override
  @JsonKey()
  final String? password;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey()
  final Gender? gender;
  @override
  @FormatDateTimeConverter()
  final DateTime? birthday;
  @override
  @JsonKey(name: "re_password")
  final String? rePassword;
  @override
  @JsonKey(name: "is_staff")
  final bool? isStaff;
  @override
  @JsonKey()
  final String? avatar;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.rePassword, rePassword) ||
                other.rePassword == rePassword) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, email, password,
      phoneNumber, gender, birthday, rePassword, isStaff, avatar);

  @override
  String toString() {
    return 'UserDto(id: $id, fullName: $fullName, email: $email, password: $password, phoneNumber: $phoneNumber, gender: $gender, birthday: $birthday, rePassword: $rePassword, isStaff: $isStaff, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) =
      __$UserDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey() String? email,
      @JsonKey() String? password,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey() Gender? gender,
      @FormatDateTimeConverter() DateTime? birthday,
      @JsonKey(name: "re_password") String? rePassword,
      @JsonKey(name: "is_staff") bool? isStaff,
      @JsonKey() String? avatar});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

  /// Create a copy of UserDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? rePassword = freezed,
    Object? isStaff = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_UserDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      birthday: freezed == birthday
          ? _self.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rePassword: freezed == rePassword
          ? _self.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String?,
      isStaff: freezed == isStaff
          ? _self.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
