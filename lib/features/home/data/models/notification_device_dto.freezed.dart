// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_device_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDeviceDTO {
  @JsonKey(name: "name")
  String? get name;
  @JsonKey(name: "registration_id")
  String? get registrationId;
  @JsonKey(name: "device_id")
  String? get deviceId;
  @JsonKey(name: "active")
  bool? get active;
  @JsonKey(name: "type")
  String? get type;
  @JsonKey(name: "dreams")
  bool? get dreams;
  @JsonKey(name: "city")
  CityDTO? get city;
  @JsonKey(name: "prayer_times")
  bool? get prayerTime;
  @JsonKey(name: "ayat_of_the_day")
  bool? get ayatOfTheDay;
  @JsonKey(name: "live_broadcasts")
  bool? get liveBroadcasts;
  @JsonKey(name: "tell_me_ustaz")
  bool? get tellMeUstaz;
  @JsonKey(name: "checklist_results")
  bool? get checkListResult;
  @JsonKey(name: "seminar_tickets")
  bool? get seminarTickets;
  @JsonKey(name: "new_content")
  bool? get newContent;

  /// Create a copy of NotificationDeviceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationDeviceDTOCopyWith<NotificationDeviceDTO> get copyWith =>
      _$NotificationDeviceDTOCopyWithImpl<NotificationDeviceDTO>(
          this as NotificationDeviceDTO, _$identity);

  /// Serializes this NotificationDeviceDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationDeviceDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dreams, dreams) || other.dreams == dreams) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.prayerTime, prayerTime) ||
                other.prayerTime == prayerTime) &&
            (identical(other.ayatOfTheDay, ayatOfTheDay) ||
                other.ayatOfTheDay == ayatOfTheDay) &&
            (identical(other.liveBroadcasts, liveBroadcasts) ||
                other.liveBroadcasts == liveBroadcasts) &&
            (identical(other.tellMeUstaz, tellMeUstaz) ||
                other.tellMeUstaz == tellMeUstaz) &&
            (identical(other.checkListResult, checkListResult) ||
                other.checkListResult == checkListResult) &&
            (identical(other.seminarTickets, seminarTickets) ||
                other.seminarTickets == seminarTickets) &&
            (identical(other.newContent, newContent) ||
                other.newContent == newContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      registrationId,
      deviceId,
      active,
      type,
      dreams,
      city,
      prayerTime,
      ayatOfTheDay,
      liveBroadcasts,
      tellMeUstaz,
      checkListResult,
      seminarTickets,
      newContent);

  @override
  String toString() {
    return 'NotificationDeviceDTO(name: $name, registrationId: $registrationId, deviceId: $deviceId, active: $active, type: $type, dreams: $dreams, city: $city, prayerTime: $prayerTime, ayatOfTheDay: $ayatOfTheDay, liveBroadcasts: $liveBroadcasts, tellMeUstaz: $tellMeUstaz, checkListResult: $checkListResult, seminarTickets: $seminarTickets, newContent: $newContent)';
  }
}

/// @nodoc
abstract mixin class $NotificationDeviceDTOCopyWith<$Res> {
  factory $NotificationDeviceDTOCopyWith(NotificationDeviceDTO value,
          $Res Function(NotificationDeviceDTO) _then) =
      _$NotificationDeviceDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "registration_id") String? registrationId,
      @JsonKey(name: "device_id") String? deviceId,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "dreams") bool? dreams,
      @JsonKey(name: "city") CityDTO? city,
      @JsonKey(name: "prayer_times") bool? prayerTime,
      @JsonKey(name: "ayat_of_the_day") bool? ayatOfTheDay,
      @JsonKey(name: "live_broadcasts") bool? liveBroadcasts,
      @JsonKey(name: "tell_me_ustaz") bool? tellMeUstaz,
      @JsonKey(name: "checklist_results") bool? checkListResult,
      @JsonKey(name: "seminar_tickets") bool? seminarTickets,
      @JsonKey(name: "new_content") bool? newContent});

  $CityDTOCopyWith<$Res>? get city;
}

/// @nodoc
class _$NotificationDeviceDTOCopyWithImpl<$Res>
    implements $NotificationDeviceDTOCopyWith<$Res> {
  _$NotificationDeviceDTOCopyWithImpl(this._self, this._then);

  final NotificationDeviceDTO _self;
  final $Res Function(NotificationDeviceDTO) _then;

  /// Create a copy of NotificationDeviceDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? registrationId = freezed,
    Object? deviceId = freezed,
    Object? active = freezed,
    Object? type = freezed,
    Object? dreams = freezed,
    Object? city = freezed,
    Object? prayerTime = freezed,
    Object? ayatOfTheDay = freezed,
    Object? liveBroadcasts = freezed,
    Object? tellMeUstaz = freezed,
    Object? checkListResult = freezed,
    Object? seminarTickets = freezed,
    Object? newContent = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationId: freezed == registrationId
          ? _self.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dreams: freezed == dreams
          ? _self.dreams
          : dreams // ignore: cast_nullable_to_non_nullable
              as bool?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityDTO?,
      prayerTime: freezed == prayerTime
          ? _self.prayerTime
          : prayerTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      ayatOfTheDay: freezed == ayatOfTheDay
          ? _self.ayatOfTheDay
          : ayatOfTheDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      liveBroadcasts: freezed == liveBroadcasts
          ? _self.liveBroadcasts
          : liveBroadcasts // ignore: cast_nullable_to_non_nullable
              as bool?,
      tellMeUstaz: freezed == tellMeUstaz
          ? _self.tellMeUstaz
          : tellMeUstaz // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkListResult: freezed == checkListResult
          ? _self.checkListResult
          : checkListResult // ignore: cast_nullable_to_non_nullable
              as bool?,
      seminarTickets: freezed == seminarTickets
          ? _self.seminarTickets
          : seminarTickets // ignore: cast_nullable_to_non_nullable
              as bool?,
      newContent: freezed == newContent
          ? _self.newContent
          : newContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of NotificationDeviceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityDTOCopyWith<$Res>? get city {
    if (_self.city == null) {
      return null;
    }

    return $CityDTOCopyWith<$Res>(_self.city!, (value) {
      return _then(_self.copyWith(city: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationDeviceDTO implements NotificationDeviceDTO {
  const _NotificationDeviceDTO(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "registration_id") this.registrationId,
      @JsonKey(name: "device_id") this.deviceId,
      @JsonKey(name: "active") this.active = true,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "dreams") this.dreams = true,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "prayer_times") this.prayerTime = true,
      @JsonKey(name: "ayat_of_the_day") this.ayatOfTheDay = true,
      @JsonKey(name: "live_broadcasts") this.liveBroadcasts = true,
      @JsonKey(name: "tell_me_ustaz") this.tellMeUstaz = true,
      @JsonKey(name: "checklist_results") this.checkListResult = true,
      @JsonKey(name: "seminar_tickets") this.seminarTickets = true,
      @JsonKey(name: "new_content") this.newContent = true});
  factory _NotificationDeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationDeviceDTOFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "registration_id")
  final String? registrationId;
  @override
  @JsonKey(name: "device_id")
  final String? deviceId;
  @override
  @JsonKey(name: "active")
  final bool? active;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "dreams")
  final bool? dreams;
  @override
  @JsonKey(name: "city")
  final CityDTO? city;
  @override
  @JsonKey(name: "prayer_times")
  final bool? prayerTime;
  @override
  @JsonKey(name: "ayat_of_the_day")
  final bool? ayatOfTheDay;
  @override
  @JsonKey(name: "live_broadcasts")
  final bool? liveBroadcasts;
  @override
  @JsonKey(name: "tell_me_ustaz")
  final bool? tellMeUstaz;
  @override
  @JsonKey(name: "checklist_results")
  final bool? checkListResult;
  @override
  @JsonKey(name: "seminar_tickets")
  final bool? seminarTickets;
  @override
  @JsonKey(name: "new_content")
  final bool? newContent;

  /// Create a copy of NotificationDeviceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationDeviceDTOCopyWith<_NotificationDeviceDTO> get copyWith =>
      __$NotificationDeviceDTOCopyWithImpl<_NotificationDeviceDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationDeviceDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationDeviceDTO &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dreams, dreams) || other.dreams == dreams) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.prayerTime, prayerTime) ||
                other.prayerTime == prayerTime) &&
            (identical(other.ayatOfTheDay, ayatOfTheDay) ||
                other.ayatOfTheDay == ayatOfTheDay) &&
            (identical(other.liveBroadcasts, liveBroadcasts) ||
                other.liveBroadcasts == liveBroadcasts) &&
            (identical(other.tellMeUstaz, tellMeUstaz) ||
                other.tellMeUstaz == tellMeUstaz) &&
            (identical(other.checkListResult, checkListResult) ||
                other.checkListResult == checkListResult) &&
            (identical(other.seminarTickets, seminarTickets) ||
                other.seminarTickets == seminarTickets) &&
            (identical(other.newContent, newContent) ||
                other.newContent == newContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      registrationId,
      deviceId,
      active,
      type,
      dreams,
      city,
      prayerTime,
      ayatOfTheDay,
      liveBroadcasts,
      tellMeUstaz,
      checkListResult,
      seminarTickets,
      newContent);

  @override
  String toString() {
    return 'NotificationDeviceDTO(name: $name, registrationId: $registrationId, deviceId: $deviceId, active: $active, type: $type, dreams: $dreams, city: $city, prayerTime: $prayerTime, ayatOfTheDay: $ayatOfTheDay, liveBroadcasts: $liveBroadcasts, tellMeUstaz: $tellMeUstaz, checkListResult: $checkListResult, seminarTickets: $seminarTickets, newContent: $newContent)';
  }
}

/// @nodoc
abstract mixin class _$NotificationDeviceDTOCopyWith<$Res>
    implements $NotificationDeviceDTOCopyWith<$Res> {
  factory _$NotificationDeviceDTOCopyWith(_NotificationDeviceDTO value,
          $Res Function(_NotificationDeviceDTO) _then) =
      __$NotificationDeviceDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "registration_id") String? registrationId,
      @JsonKey(name: "device_id") String? deviceId,
      @JsonKey(name: "active") bool? active,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "dreams") bool? dreams,
      @JsonKey(name: "city") CityDTO? city,
      @JsonKey(name: "prayer_times") bool? prayerTime,
      @JsonKey(name: "ayat_of_the_day") bool? ayatOfTheDay,
      @JsonKey(name: "live_broadcasts") bool? liveBroadcasts,
      @JsonKey(name: "tell_me_ustaz") bool? tellMeUstaz,
      @JsonKey(name: "checklist_results") bool? checkListResult,
      @JsonKey(name: "seminar_tickets") bool? seminarTickets,
      @JsonKey(name: "new_content") bool? newContent});

  @override
  $CityDTOCopyWith<$Res>? get city;
}

/// @nodoc
class __$NotificationDeviceDTOCopyWithImpl<$Res>
    implements _$NotificationDeviceDTOCopyWith<$Res> {
  __$NotificationDeviceDTOCopyWithImpl(this._self, this._then);

  final _NotificationDeviceDTO _self;
  final $Res Function(_NotificationDeviceDTO) _then;

  /// Create a copy of NotificationDeviceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? registrationId = freezed,
    Object? deviceId = freezed,
    Object? active = freezed,
    Object? type = freezed,
    Object? dreams = freezed,
    Object? city = freezed,
    Object? prayerTime = freezed,
    Object? ayatOfTheDay = freezed,
    Object? liveBroadcasts = freezed,
    Object? tellMeUstaz = freezed,
    Object? checkListResult = freezed,
    Object? seminarTickets = freezed,
    Object? newContent = freezed,
  }) {
    return _then(_NotificationDeviceDTO(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationId: freezed == registrationId
          ? _self.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dreams: freezed == dreams
          ? _self.dreams
          : dreams // ignore: cast_nullable_to_non_nullable
              as bool?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityDTO?,
      prayerTime: freezed == prayerTime
          ? _self.prayerTime
          : prayerTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      ayatOfTheDay: freezed == ayatOfTheDay
          ? _self.ayatOfTheDay
          : ayatOfTheDay // ignore: cast_nullable_to_non_nullable
              as bool?,
      liveBroadcasts: freezed == liveBroadcasts
          ? _self.liveBroadcasts
          : liveBroadcasts // ignore: cast_nullable_to_non_nullable
              as bool?,
      tellMeUstaz: freezed == tellMeUstaz
          ? _self.tellMeUstaz
          : tellMeUstaz // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkListResult: freezed == checkListResult
          ? _self.checkListResult
          : checkListResult // ignore: cast_nullable_to_non_nullable
              as bool?,
      seminarTickets: freezed == seminarTickets
          ? _self.seminarTickets
          : seminarTickets // ignore: cast_nullable_to_non_nullable
              as bool?,
      newContent: freezed == newContent
          ? _self.newContent
          : newContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of NotificationDeviceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityDTOCopyWith<$Res>? get city {
    if (_self.city == null) {
      return null;
    }

    return $CityDTOCopyWith<$Res>(_self.city!, (value) {
      return _then(_self.copyWith(city: value));
    });
  }
}

// dart format on
