import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/home_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';

part 'get_profile_cubit.freezed.dart';

@singleton
class GetProfileCubit extends Cubit<GetProfileState> {
  final AuthRepository _authRepository;
  final HomeLocalDs _homeLocalDs;
  GetProfileCubit(
    this._authRepository,
    this._homeLocalDs,
  ) : super(const GetProfileState.initialState());

  Future<void> getUser() async {
    final GeonamesDTO? geo = _homeLocalDs.getGeoFromCacheNull();
    Prefs prefs = Prefs();
    final String? dev = await prefs.getDeviceToken();
    if (geo != null) {
      final failureOrUser = await _authRepository.getUser();
      failureOrUser.fold(
        (l) {
          emit(GetProfileState.errorState(message: mapFailureToMessageBack(l)));
        },
        (r) {
          emit(GetProfileState.loaded(user: r, geo: geo));
        },
      );
    } else {
      final failureOrUser = await _authRepository.getUser();
      failureOrUser.fold(
        (l) {
          emit(GetProfileState.errorState(message: mapFailureToMessageBack(l)));
        },
        (r) {
          emit(GetProfileState.loaded(
              user: r,
              dev: dev,
              geo: geo ??
                  const GeonamesDTO(
                      name: 'Алматы', lat: '43.25', lng: '76.91667')));
        },
      );
    }
  }
}

@freezed
class GetProfileState with _$GetProfileState {
  const factory GetProfileState.initialState() = _InitialPage;

  const factory GetProfileState.loadingState() = _LoadingState;

  const factory GetProfileState.loaded({
    required UserDto user,
    required GeonamesDTO geo,
    String? dev,
  }) = _LoadedState;

  const factory GetProfileState.errorState({
    required String message,
  }) = _ErrorState;
}
