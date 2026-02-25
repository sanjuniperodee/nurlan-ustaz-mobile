// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDTO {
  @JsonKey(name: "id")
  int? get id;
  @JsonKey(name: "name")
  String? get name;
  @JsonKey(name: "registration_id")
  String? get registrationId;
  @JsonKey(name: "device_id")
  String? get deviceId;
  bool? get active;
  String? get type;
  @JsonKey(name: "date_created")
  String? get dateCreated;
  @JsonKey(name: "dreams")
  bool? get customDreams;
  @JsonKey(name: "prayer_times")
  bool? get prayerTimes;
  @JsonKey(name: "ayat_of_the_day")
  bool? get ayatOfTheDay;
  @JsonKey(name: "live_broadcasts")
  bool? get liveBroadcasts;
  @JsonKey(name: "tell_me_ustaz")
  bool? get tellMeUstaz;
  @JsonKey(name: "checklist_results")
  bool? get checklistResults;
  @JsonKey(name: "seminar_tickets")
  bool? get seminarTickets;
  @JsonKey(name: "new_content")
  bool? get newContent;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationDTOCopyWith<NotificationDTO> get copyWith =>
      _$NotificationDTOCopyWithImpl<NotificationDTO>(
          this as NotificationDTO, _$identity);

  /// Serializes this NotificationDTO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.customDreams, customDreams) ||
                other.customDreams == customDreams) &&
            (identical(other.prayerTimes, prayerTimes) ||
                other.prayerTimes == prayerTimes) &&
            (identical(other.ayatOfTheDay, ayatOfTheDay) ||
                other.ayatOfTheDay == ayatOfTheDay) &&
            (identical(other.liveBroadcasts, liveBroadcasts) ||
                other.liveBroadcasts == liveBroadcasts) &&
            (identical(other.tellMeUstaz, tellMeUstaz) ||
                other.tellMeUstaz == tellMeUstaz) &&
            (identical(other.checklistResults, checklistResults) ||
                other.checklistResults == checklistResults) &&
            (identical(other.seminarTickets, seminarTickets) ||
                other.seminarTickets == seminarTickets) &&
            (identical(other.newContent, newContent) ||
                other.newContent == newContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      registrationId,
      deviceId,
      active,
      type,
      dateCreated,
      customDreams,
      prayerTimes,
      ayatOfTheDay,
      liveBroadcasts,
      tellMeUstaz,
      checklistResults,
      seminarTickets,
      newContent);

  @override
  String toString() {
    return 'NotificationDTO(id: $id, name: $name, registrationId: $registrationId, deviceId: $deviceId, active: $active, type: $type, dateCreated: $dateCreated, customDreams: $customDreams, prayerTimes: $prayerTimes, ayatOfTheDay: $ayatOfTheDay, liveBroadcasts: $liveBroadcasts, tellMeUstaz: $tellMeUstaz, checklistResults: $checklistResults, seminarTickets: $seminarTickets, newContent: $newContent)';
  }
}

/// @nodoc
abstract mixin class $NotificationDTOCopyWith<$Res> {
  factory $NotificationDTOCopyWith(
          NotificationDTO value, $Res Function(NotificationDTO) _then) =
      _$NotificationDTOCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "registration_id") String? registrationId,
      @JsonKey(name: "device_id") String? deviceId,
      bool? active,
      String? type,
      @JsonKey(name: "date_created") String? dateCreated,
      @JsonKey(name: "dreams") bool? customDreams,
      @JsonKey(name: "prayer_times") bool? prayerTimes,
      @JsonKey(name: "ayat_of_the_day") bool? ayatOfTheDay,
      @JsonKey(name: "live_broadcasts") bool? liveBroadcasts,
      @JsonKey(name: "tell_me_ustaz") bool? tellMeUstaz,
      @JsonKey(name: "checklist_results") bool? checklistResults,
      @JsonKey(name: "seminar_tickets") bool? seminarTickets,
      @JsonKey(name: "new_content") bool? newContent});
}

/// @nodoc
class _$NotificationDTOCopyWithImpl<$Res>
    implements $NotificationDTOCopyWith<$Res> {
  _$NotificationDTOCopyWithImpl(this._self, this._then);

  final NotificationDTO _self;
  final $Res Function(NotificationDTO) _then;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? registrationId = freezed,
    Object? deviceId = freezed,
    Object? active = freezed,
    Object? type = freezed,
    Object? dateCreated = freezed,
    Object? customDreams = freezed,
    Object? prayerTimes = freezed,
    Object? ayatOfTheDay = freezed,
    Object? liveBroadcasts = freezed,
    Object? tellMeUstaz = freezed,
    Object? checklistResults = freezed,
    Object? seminarTickets = freezed,
    Object? newContent = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      dateCreated: freezed == dateCreated
          ? _self.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      customDreams: freezed == customDreams
          ? _self.customDreams
          : customDreams // ignore: cast_nullable_to_non_nullable
              as bool?,
      prayerTimes: freezed == prayerTimes
          ? _self.prayerTimes
          : prayerTimes // ignore: cast_nullable_to_non_nullable
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
      checklistResults: freezed == checklistResults
          ? _self.checklistResults
          : checklistResults // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
@JsonSerializable()
class _NotificationDTO implements NotificationDTO {
  const _NotificationDTO(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "registration_id") this.registrationId,
      @JsonKey(name: "device_id") this.deviceId,
      this.active,
      this.type,
      @JsonKey(name: "date_created") this.dateCreated,
      @JsonKey(name: "dreams") this.customDreams,
      @JsonKey(name: "prayer_times") this.prayerTimes,
      @JsonKey(name: "ayat_of_the_day") this.ayatOfTheDay,
      @JsonKey(name: "live_broadcasts") this.liveBroadcasts,
      @JsonKey(name: "tell_me_ustaz") this.tellMeUstaz,
      @JsonKey(name: "checklist_results") this.checklistResults,
      @JsonKey(name: "seminar_tickets") this.seminarTickets,
      @JsonKey(name: "new_content") this.newContent});
  factory _NotificationDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationDTOFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
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
  final bool? active;
  @override
  final String? type;
  @override
  @JsonKey(name: "date_created")
  final String? dateCreated;
  @override
  @JsonKey(name: "dreams")
  final bool? customDreams;
  @override
  @JsonKey(name: "prayer_times")
  final bool? prayerTimes;
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
  final bool? checklistResults;
  @override
  @JsonKey(name: "seminar_tickets")
  final bool? seminarTickets;
  @override
  @JsonKey(name: "new_content")
  final bool? newContent;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationDTOCopyWith<_NotificationDTO> get copyWith =>
      __$NotificationDTOCopyWithImpl<_NotificationDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationDTOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.customDreams, customDreams) ||
                other.customDreams == customDreams) &&
            (identical(other.prayerTimes, prayerTimes) ||
                other.prayerTimes == prayerTimes) &&
            (identical(other.ayatOfTheDay, ayatOfTheDay) ||
                other.ayatOfTheDay == ayatOfTheDay) &&
            (identical(other.liveBroadcasts, liveBroadcasts) ||
                other.liveBroadcasts == liveBroadcasts) &&
            (identical(other.tellMeUstaz, tellMeUstaz) ||
                other.tellMeUstaz == tellMeUstaz) &&
            (identical(other.checklistResults, checklistResults) ||
                other.checklistResults == checklistResults) &&
            (identical(other.seminarTickets, seminarTickets) ||
                other.seminarTickets == seminarTickets) &&
            (identical(other.newContent, newContent) ||
                other.newContent == newContent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      registrationId,
      deviceId,
      active,
      type,
      dateCreated,
      customDreams,
      prayerTimes,
      ayatOfTheDay,
      liveBroadcasts,
      tellMeUstaz,
      checklistResults,
      seminarTickets,
      newContent);

  @override
  String toString() {
    return 'NotificationDTO(id: $id, name: $name, registrationId: $registrationId, deviceId: $deviceId, active: $active, type: $type, dateCreated: $dateCreated, customDreams: $customDreams, prayerTimes: $prayerTimes, ayatOfTheDay: $ayatOfTheDay, liveBroadcasts: $liveBroadcasts, tellMeUstaz: $tellMeUstaz, checklistResults: $checklistResults, seminarTickets: $seminarTickets, newContent: $newContent)';
  }
}

/// @nodoc
abstract mixin class _$NotificationDTOCopyWith<$Res>
    implements $NotificationDTOCopyWith<$Res> {
  factory _$NotificationDTOCopyWith(
          _NotificationDTO value, $Res Function(_NotificationDTO) _then) =
      __$NotificationDTOCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "registration_id") String? registrationId,
      @JsonKey(name: "device_id") String? deviceId,
      bool? active,
      String? type,
      @JsonKey(name: "date_created") String? dateCreated,
      @JsonKey(name: "dreams") bool? customDreams,
      @JsonKey(name: "prayer_times") bool? prayerTimes,
      @JsonKey(name: "ayat_of_the_day") bool? ayatOfTheDay,
      @JsonKey(name: "live_broadcasts") bool? liveBroadcasts,
      @JsonKey(name: "tell_me_ustaz") bool? tellMeUstaz,
      @JsonKey(name: "checklist_results") bool? checklistResults,
      @JsonKey(name: "seminar_tickets") bool? seminarTickets,
      @JsonKey(name: "new_content") bool? newContent});
}

/// @nodoc
class __$NotificationDTOCopyWithImpl<$Res>
    implements _$NotificationDTOCopyWith<$Res> {
  __$NotificationDTOCopyWithImpl(this._self, this._then);

  final _NotificationDTO _self;
  final $Res Function(_NotificationDTO) _then;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? registrationId = freezed,
    Object? deviceId = freezed,
    Object? active = freezed,
    Object? type = freezed,
    Object? dateCreated = freezed,
    Object? customDreams = freezed,
    Object? prayerTimes = freezed,
    Object? ayatOfTheDay = freezed,
    Object? liveBroadcasts = freezed,
    Object? tellMeUstaz = freezed,
    Object? checklistResults = freezed,
    Object? seminarTickets = freezed,
    Object? newContent = freezed,
  }) {
    return _then(_NotificationDTO(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      dateCreated: freezed == dateCreated
          ? _self.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      customDreams: freezed == customDreams
          ? _self.customDreams
          : customDreams // ignore: cast_nullable_to_non_nullable
              as bool?,
      prayerTimes: freezed == prayerTimes
          ? _self.prayerTimes
          : prayerTimes // ignore: cast_nullable_to_non_nullable
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
      checklistResults: freezed == checklistResults
          ? _self.checklistResults
          : checklistResults // ignore: cast_nullable_to_non_nullable
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
}

// dart format on
