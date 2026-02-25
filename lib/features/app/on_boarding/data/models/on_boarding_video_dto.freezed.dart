// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_boarding_video_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnBoardingVideoDTO {
  int get id;
  int get number;
  @JsonKey(name: "is_active")
  bool? get isActive;
  String get file;

  /// Create a copy of OnBoardingVideoDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnBoardingVideoDTOCopyWith<OnBoardingVideoDTO> get copyWith =>
      _$OnBoardingVideoDTOCopyWithImpl<OnBoardingVideoDTO>(
          this as OnBoardingVideoDTO, _$identity);

  /// Serializes this OnBoardingVideoDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnBoardingVideoDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, isActive, file);

  @override
  String toString() {
    return 'OnBoardingVideoDTO(id: $id, number: $number, isActive: $isActive, file: $file)';
  }
}

/// @nodoc
abstract mixin class $OnBoardingVideoDTOCopyWith<$Res> {
  factory $OnBoardingVideoDTOCopyWith(
          OnBoardingVideoDTO value, $Res Function(OnBoardingVideoDTO) _then) =
      _$OnBoardingVideoDTOCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int number,
      @JsonKey(name: "is_active") bool? isActive,
      String file});
}

/// @nodoc
class _$OnBoardingVideoDTOCopyWithImpl<$Res>
    implements $OnBoardingVideoDTOCopyWith<$Res> {
  _$OnBoardingVideoDTOCopyWithImpl(this._self, this._then);

  final OnBoardingVideoDTO _self;
  final $Res Function(OnBoardingVideoDTO) _then;

  /// Create a copy of OnBoardingVideoDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? isActive = freezed,
    Object? file = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OnBoardingVideoDTO implements OnBoardingVideoDTO {
  const _OnBoardingVideoDTO(
      {required this.id,
      required this.number,
      @JsonKey(name: "is_active") this.isActive,
      required this.file});
  factory _OnBoardingVideoDTO.fromJson(Map<String, dynamic> json) =>
      _$OnBoardingVideoDTOFromJson(json);

  @override
  final int id;
  @override
  final int number;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String file;

  /// Create a copy of OnBoardingVideoDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnBoardingVideoDTOCopyWith<_OnBoardingVideoDTO> get copyWith =>
      __$OnBoardingVideoDTOCopyWithImpl<_OnBoardingVideoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OnBoardingVideoDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnBoardingVideoDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, number, isActive, file);

  @override
  String toString() {
    return 'OnBoardingVideoDTO(id: $id, number: $number, isActive: $isActive, file: $file)';
  }
}

/// @nodoc
abstract mixin class _$OnBoardingVideoDTOCopyWith<$Res>
    implements $OnBoardingVideoDTOCopyWith<$Res> {
  factory _$OnBoardingVideoDTOCopyWith(
          _OnBoardingVideoDTO value, $Res Function(_OnBoardingVideoDTO) _then) =
      __$OnBoardingVideoDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int number,
      @JsonKey(name: "is_active") bool? isActive,
      String file});
}

/// @nodoc
class __$OnBoardingVideoDTOCopyWithImpl<$Res>
    implements _$OnBoardingVideoDTOCopyWith<$Res> {
  __$OnBoardingVideoDTOCopyWithImpl(this._self, this._then);

  final _OnBoardingVideoDTO _self;
  final $Res Function(_OnBoardingVideoDTO) _then;

  /// Create a copy of OnBoardingVideoDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? isActive = freezed,
    Object? file = null,
  }) {
    return _then(_OnBoardingVideoDTO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
