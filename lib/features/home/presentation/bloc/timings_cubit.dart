import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/home_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';

import 'package:nurlan_ustaz_flutter/features/home/data/models/timings_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'timings_cubit.freezed.dart';

@singleton
class TimingsCubit extends Cubit<TimingsState> {
  final HomeRepository _homeRepository;
  final HomeLocalDs _homeLocalDs;
  TimingsCubit(
    this._homeRepository,
    this._homeLocalDs,
  ) : super(const TimingsState.initialState());

  Future<void> timings(double? lat, double? long) async {
    emit(const TimingsState.loadingState());
    // final geo = _homeLocalDs.getGeoFromCache();
    final GeonamesDTO? geo = _homeLocalDs.getGeoFromCacheNull();
    if (geo != null) {
      final failureOrUser = await _homeRepository.timings(
          lat: double.parse(geo.lat ?? lat.toString()),
          long: double.parse(geo.lng ?? long.toString()));
      failureOrUser.fold(
        (l) {
          emit(TimingsState.errorState(message: mapFailureToMessageBack(l)));
        },
        (r) {
          emit(TimingsState.loaded(not: r, geo: geo));
        },
      );
    } else {
      final failureOrUser = await _homeRepository.timings(
          lat: double.parse(geo?.lat ?? lat.toString()),
          long: double.parse(geo?.lng ?? long.toString()));
      failureOrUser.fold(
        (l) {
          emit(TimingsState.errorState(message: mapFailureToMessageBack(l)));
        },
        (r) {
          emit(TimingsState.loaded(
              not: r,
              geo: geo ??
                  const GeonamesDTO(
                      name: 'Алматы', lat: '43.25', lng: '76.91667')));
        },
      );
    }
  }
}

@freezed
class TimingsState with _$TimingsState {
  const factory TimingsState.initialState() = _InitialPage;

  const factory TimingsState.loadingState() = _LoadingState;

  const factory TimingsState.loaded({
    required TimingsDTO not,
    required GeonamesDTO geo,
  }) = _LoadedState;

  const factory TimingsState.errorState({
    required String message,
  }) = _ErrorState;
}
