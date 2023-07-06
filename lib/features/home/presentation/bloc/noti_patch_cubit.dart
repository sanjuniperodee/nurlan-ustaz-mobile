import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_device_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'noti_patch_cubit.freezed.dart';

@singleton
class NotiPatchCubit extends Cubit<NotiPatchState> {
  final HomeRepository _homeRepository;
  NotiPatchCubit(
    this._homeRepository,
  ) : super(const NotiPatchState.initialState());

  Future<void> notiPatch({ NotificationDeviceDTO? noti}) async {
    final failureOrUser =
        await _homeRepository.notificationDevicePatch(notificationDTO: noti);
    failureOrUser.fold(
      (l) {
        emit(NotiPatchState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NotiPatchState.loaded(noti: r));
      },
    );
  }
}

@freezed
class NotiPatchState with _$NotiPatchState {
  const factory NotiPatchState.initialState() = _InitialPage;

  const factory NotiPatchState.loadingState() = _LoadingState;

  const factory NotiPatchState.loaded({required NotificationDeviceDTO noti}) =
      _LoadedState;

  const factory NotiPatchState.errorState({
    required String message,
  }) = _ErrorState;
}
