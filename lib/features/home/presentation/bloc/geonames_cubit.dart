import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'geonames_cubit.freezed.dart';

@singleton
class GeonamesCubit extends Cubit<GeonamesState> {
  final HomeRepository _homeRepository;
  GeonamesCubit(
    this._homeRepository,
  ) : super(const GeonamesState.initialState());

  Future<void> geoNames({required String name}) async {
    // emit(const GeonamesState.loadingState());
    final failureOrUser = await _homeRepository.geoNames(name: name);
    failureOrUser.fold(
      (l) {
        emit(GeonamesState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(GeonamesState.loaded(geo: r));
      },
    );
  }
}

@freezed
class GeonamesState with _$GeonamesState {
  const factory GeonamesState.initialState() = _InitialPage;

  const factory GeonamesState.loadingState() = _LoadingState;

  const factory GeonamesState.loaded({
    required List<GeonamesDTO> geo,
  }) = _LoadedState;

  const factory GeonamesState.errorState({
    required String message,
  }) = _ErrorState;
}
