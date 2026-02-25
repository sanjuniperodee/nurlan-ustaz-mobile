import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/home_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

import '../../../../core/platform/cache_helper/prefs.dart';
import '../../../../core/services/notification_service.dart';
import '../../data/models/notification_dto.dart';

part 'timings_cubit.freezed.dart';

@singleton
class TimingsCubit extends Cubit<TimingsState> {
  final HomeRepository _homeRepository;
  final HomeLocalDs _homeLocalDs;
  late NotificationDTO notification;

  TimingsCubit(
    this._homeRepository,
    this._homeLocalDs,
  ) : super(const TimingsState.initial());
  List<String> namasNames = [
    'Fajr'.tr(),
    'Күн',
    'Zukhr'.tr(),
    'Asr'.tr(),
    'Maghrib'.tr(),
    'Isha'.tr()
  ];

  Future<void> timings(double? lat, double? long) async {
    // debug log
    // ignore: avoid_print
    print('TimingsCubit: timings() called with lat=$lat, long=$long');
    emit(const TimingsState.loading());
    final GeonamesDTO? geo = _homeLocalDs.getGeoFromCacheNull();

    if (geo != null) {
      // ignore: avoid_print
      print('TimingsCubit: using geo from cache ${geo.lat}, ${geo.lng}');
      await fetchTimingsAndHandleNotifications(
        lat: double.parse(geo.lat ?? lat.toString()),
        long: double.parse(geo.lng ?? long.toString()),
        geo: geo,
      );
    } else {
      await fetchTimingsAndHandleNotifications(
        lat: double.parse(geo?.lat ?? lat.toString()),
        long: double.parse(geo?.lng ?? long.toString()),
        geo: null,
      );
    }
  }

  Future<void> fetchTimingsAndHandleNotifications({
    required double lat,
    required double long,
    GeonamesDTO? geo,
  }) async {
    // ignore: avoid_print
    print('TimingsCubit: fetchTimingsAndHandleNotifications lat=$lat long=$long');
    try {
      final failureOrUser = await _homeRepository.timings(lat: lat, long: long);

      failureOrUser.fold(
        (l) {
          // ignore: avoid_print
          print('TimingsCubit: timings failure -> ${mapFailureToMessage(l)}');
          emit(TimingsState.error(message: mapFailureToMessage(l)));
        },
        (r) {
          // ignore: avoid_print
          print('TimingsCubit: timings success, emitting loaded');
          final geoData = geo ??
              const GeonamesDTO(
                name: 'Алматы',
                lat: '43.25',
                lng: '76.91667',
              );
          emit(TimingsState.loaded(not: r, geo: geoData));

          // Настройка уведомлений — не блокируем UI
          // ignore: avoid_print
          print('TimingsCubit: starting async notification fetch');
          Prefs().getDeviceToken().then((dev) {
            _homeRepository
                .getNotificationDevice(registrationId: dev ?? '')
                .then((result) {
              result.fold((_) {}, (notification) {
                handlePrayerTimesNotification(notification, r);
              });
            });
          });
        },
      );
    } catch (_) {
      emit(const TimingsState.error(
          message: 'Не удалось загрузить время намаза'));
    }
  }

  void handlePrayerTimesNotification(
      NotificationDTO notification, TimingsDTO r) {
    if (notification.prayerTimes != null && notification.prayerTimes == true) {
      final List<String> time =
          r.toJson().values.map((e) => e.toString()).toList();
      final now = DateTime.now();

      for (String item in r.toJson().values) {
        final parts = item.split(':');
        final hour = int.parse(parts.first);
        final minute = int.parse(parts.last);

        final prayerTime = now.copyWith(hour: hour, minute: minute);

        if (prayerTime.isAfter(now)) {
          final index = time.indexOf(item);
          scheduledNotification('Nurlan Ustaz', namasNames[index], item, index);
        }
      }
    }
  }
}

@freezed
sealed class TimingsState with _$TimingsState {
  const factory TimingsState.initial() = TimingsInitialPage;
  const factory TimingsState.loading() = TimingsLoadingState;
  const factory TimingsState.loaded({
    required TimingsDTO not,
    required GeonamesDTO geo,
  }) = TimingsLoadedState;
  const factory TimingsState.error({
    required String message,
  }) = TimingsErrorState;
}
