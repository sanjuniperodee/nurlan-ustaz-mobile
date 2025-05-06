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

@singleton
class ProfileNotificationCubit extends Cubit<ProfileNotificationState> {
  final HomeRepository _homeRepository;

  ProfileNotificationCubit(
    this._homeRepository,
  ) : super(const ProfileNotificationState.initialState());
  late NotificationDTO notificationDeviceDTO;
  late List<NotificationItemDTO> notifications;
  late String token;

  Future<void> saveChanges() async {
    final result = await _homeRepository.putNotificationDevice(
        registrationId: token, notification: notificationDeviceDTO);

    result.fold((l) => {emit(_ErrorState(message: mapFailureToMessage(l)))},
        (r) => {getNotificationDto()});
  }

  Future<void> switchNotify(
      NotificationItemDTO notificationItemDTO, bool value) async {
    emit(_LoadingState());

    void handleType(String namazTime) {
      switch (namazTime) {
        case 'custom_dreams':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(customDreams: value);
          // Code for case1
          break;
        case 'prayer_times':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(prayerTimes: value);
          // Code for case2
          break;
        case 'ayat_of_the_day':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(ayatOfTheDay: value);
          // Code for case3
          break;
        case 'live_broadcasts':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(liveBroadcasts: value);
          // Code for case3
          break;
        case 'tell_me_ustaz':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(tellMeUstaz: value);
          // Code for case3
          break;
        case 'checklist_results':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(checklistResults: value);
          // Code for case3
          break;
        case 'seminar_tickets':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(seminarTickets: value);
          // Code for case3
          break;
        case 'new_content':
          notificationDeviceDTO =
              notificationDeviceDTO.copyWith(newContent: value);
          // Code for case3
          break;

        default:
          // Code for default case
          break;
      }
    }

    handleType(notificationItemDTO.title!);

    // final String? deviceToken = await NotificationService().getDeviceToken();

    emit(
      const _InitialPage().copyWith(
        notificationDTO: notificationDeviceDTO,
        items: notificationDeviceDTO
            .toJson()
            .entries
            .toList()
            .sublist(8, 15)
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
      notifications = r
          .toJson()
          .entries
          .toList()
          .sublist(8, 15)
          .map(
              (e) => NotificationItemDTO(title: e.key, status: e.value as bool))
          .toList();
      token = dev ?? '';
      notificationDeviceDTO = r;
      emit(const _InitialPage().copyWith(
          notificationDTO: r,
          items: r
              .toJson()
              .entries
              .toList()
              .sublist(8, 15)
              .map((e) =>
                  NotificationItemDTO(title: e.key, status: e.value as bool))
              .toList()));
    });
  }
}

@freezed
class ProfileNotificationState with _$ProfileNotificationState {
  const factory ProfileNotificationState.initialState(
      {@Default([]) List<NotificationItemDTO> items,
      final NotificationDTO? notificationDTO}) = _InitialPage;

  const factory ProfileNotificationState.loadingState() = _LoadingState;

  const factory ProfileNotificationState.loadingMoreState() = _LoadingMoreState;

  const factory ProfileNotificationState.loaded({
    required List<ResultHomeDTO> news,
  }) = _LoadedState;

  const factory ProfileNotificationState.errorState({
    required String message,
  }) = _ErrorState;
}
