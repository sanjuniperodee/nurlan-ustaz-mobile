// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventDto {
  int? get id;
  EventsType? get type;
  String? get title;
  String? get description;
  String? get date;
  String? get time;
  String? get address;
  String? get link;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventDtoCopyWith<EventDto> get copyWith =>
      _$EventDtoCopyWithImpl<EventDto>(this as EventDto, _$identity);

  /// Serializes this EventDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, title, description, date, time, address, link);

  @override
  String toString() {
    return 'EventDto(id: $id, type: $type, title: $title, description: $description, date: $date, time: $time, address: $address, link: $link)';
  }
}

/// @nodoc
abstract mixin class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) _then) =
      _$EventDtoCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      EventsType? type,
      String? title,
      String? description,
      String? date,
      String? time,
      String? address,
      String? link});
}

/// @nodoc
class _$EventDtoCopyWithImpl<$Res> implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._self, this._then);

  final EventDto _self;
  final $Res Function(EventDto) _then;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? address = freezed,
    Object? link = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventsType?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EventDto implements EventDto {
  const _EventDto(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.date,
      this.time,
      this.address,
      this.link});
  factory _EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  @override
  final int? id;
  @override
  final EventsType? type;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? time;
  @override
  final String? address;
  @override
  final String? link;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventDtoCopyWith<_EventDto> get copyWith =>
      __$EventDtoCopyWithImpl<_EventDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, title, description, date, time, address, link);

  @override
  String toString() {
    return 'EventDto(id: $id, type: $type, title: $title, description: $description, date: $date, time: $time, address: $address, link: $link)';
  }
}

/// @nodoc
abstract mixin class _$EventDtoCopyWith<$Res>
    implements $EventDtoCopyWith<$Res> {
  factory _$EventDtoCopyWith(_EventDto value, $Res Function(_EventDto) _then) =
      __$EventDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      EventsType? type,
      String? title,
      String? description,
      String? date,
      String? time,
      String? address,
      String? link});
}

/// @nodoc
class __$EventDtoCopyWithImpl<$Res> implements _$EventDtoCopyWith<$Res> {
  __$EventDtoCopyWithImpl(this._self, this._then);

  final _EventDto _self;
  final $Res Function(_EventDto) _then;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? address = freezed,
    Object? link = freezed,
  }) {
    return _then(_EventDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventsType?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
