import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'set_city_cubit.freezed.dart';

@singleton
class SetCityCubit extends Cubit<SetCityState> {
  final HomeRepository _homeRepository;
  SetCityCubit(
    this._homeRepository,
  ) : super(const SetCityState.initial());

  Future<void> setCity({required GeonamesDTO geo}) async {
    emit(const SetCityState.loading());
    final failureOrUser = await _homeRepository.setCity(geo: geo);
    failureOrUser.fold(
      (l) {
        emit(SetCityState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(SetCityState.loaded(not: r));
      },
    );
  }
}

@freezed
sealed class SetCityState with _$SetCityState {
  const factory SetCityState.initial() = SetCityInitialPage;
  const factory SetCityState.loading() = SetCityLoadingState;
  const factory SetCityState.loaded({
    required NotificationDTO not,
  }) = SetCityLoadedState;
  const factory SetCityState.error({
    required String message,
  }) = SetCityErrorState;
}
