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
  ) : super(const SetCityState.initialState());

  Future<void> setCity({required GeonamesDTO geo}) async {
    final failureOrUser = await _homeRepository.setCity(geo: geo);
    failureOrUser.fold(
      (l) {
        emit(SetCityState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(SetCityState.loaded(not: r));
      },
    );
  }
}

@freezed
class SetCityState with _$SetCityState {
  const factory SetCityState.initialState() = _InitialPage;

  const factory SetCityState.loadingState() = _LoadingState;

  const factory SetCityState.loaded({
    required NotificationDTO not,
  }) = _LoadedState;

  const factory SetCityState.errorState({
    required String message,
  }) = _ErrorState;
}
