import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

import '../../data/models/notification_dto.dart';
import '../../data/models/notification_item_dto.dart';

part 'profile_notification_cubit.freezed.dart';

/// Maps notification key to copyWith. Explicit switch avoids fragile dynamic key.
NotificationDTO _applyNotificationToggle(
    NotificationDTO dto, String key, bool value) {
  switch (key) {
    case 'dreams':
      return dto.copyWith(customDreams: value);
    case 'prayer_times':
      return dto.copyWith(prayerTimes: value);
    case 'ayat_of_the_day':
      return dto.copyWith(ayatOfTheDay: value);
    case 'live_broadcasts':
      return dto.copyWith(liveBroadcasts: value);
    case 'tell_me_ustaz':
      return dto.copyWith(tellMeUstaz: value);
    case 'checklist_results':
      return dto.copyWith(checklistResults: value);
    case 'seminar_tickets':
      return dto.copyWith(seminarTickets: value);
    case 'new_content':
      return dto.copyWith(newContent: value);
    default:
      return dto;
  }
}

@singleton
class ProfileNotificationCubit extends Cubit<ProfileNotificationState> {
  final HomeRepository _homeRepository;

  ProfileNotificationCubit(
    this._homeRepository,
  ) : super(const ProfileNotificationState.initial());
  late NotificationDTO serverNotifications;
  late NotificationDTO notificationDeviceDTO;
  late List<NotificationItemDTO> notifications;
  late String token;

  Future<void> saveChanges() async {
    final result = await _homeRepository.putNotificationDevice(
        registrationId: token, notification: notificationDeviceDTO);

    result.fold(
        (l) => {
              emit(ProfileNotificationState.error(
                  message: mapFailureToMessage(l)))
            },
        (r) => {getNotificationDto()});
  }

  Future<void> switchNotify(
      NotificationItemDTO notificationItemDTO, bool value) async {
    emit(const ProfileNotificationState.loading());
    final key = notificationItemDTO.title;
    if (key == null || key.isEmpty) return;

    notificationDeviceDTO = _applyNotificationToggle(
        notificationDeviceDTO, key, value);

    emit(
      ProfileNotificationState.initial(
        serverNotificationDto: serverNotifications,
        notificationDTO: notificationDeviceDTO,
        items: notificationDeviceDTO
            .toJson()
            .entries
            .toList()
            .sublist(7, 15)
            .map((e) =>
                NotificationItemDTO(title: e.key, status: e.value as bool))
            .toList(),
      ),
    );
  }

  Future<void> getNotificationDto() async {
    Prefs prefs = Prefs();
    final String? dev = await prefs.getDeviceToken();
    final result =
        await _homeRepository.getNotificationDevice(registrationId: dev ?? '');
    result.fold((l) => {}, (r) {
      notificationDeviceDTO = r;

      serverNotifications = r;
      log(serverNotifications
          .toJson()
          .entries
          .toList()
          .map((e) => e.key.toString())
          .toList()
          .toString());

      notifications = r
          .toJson()
          .entries
          .toList()
          .sublist(7, 15)
          .map(
              (e) => NotificationItemDTO(title: e.key, status: e.value as bool))
          .toList();
      token = dev ?? '';
      emit(ProfileNotificationState.initial(
          notificationDTO: r,
          serverNotificationDto: serverNotifications,
          items: r
              .toJson()
              .entries
              .toList()
              .sublist(7, 15)
              .map((e) =>
                  NotificationItemDTO(title: e.key, status: e.value as bool))
              .toList()));
    });
  }
}

@freezed
sealed class ProfileNotificationState with _$ProfileNotificationState {
  const factory ProfileNotificationState.initial(
          {@Default([]) List<NotificationItemDTO> items,
          final NotificationDTO? notificationDTO,
          final NotificationDTO? serverNotificationDto}) =
      ProfileNotificationInitialPage;
  const factory ProfileNotificationState.loading() =
      ProfileNotificationLoadingState;
  const factory ProfileNotificationState.loadingMore() =
      ProfileNotificationLoadingMoreState;
  const factory ProfileNotificationState.loaded({
    required List<ResultHomeDTO> news,
  }) = ProfileNotificationLoadedState;
  const factory ProfileNotificationState.error({
    required String message,
  }) = ProfileNotificationErrorState;
}
