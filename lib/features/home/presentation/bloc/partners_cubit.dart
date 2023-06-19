import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'partners_cubit.freezed.dart';

@singleton
class PartnersCubit extends Cubit<PartnersState> {
  final HomeRepository _homeRepository;
  PartnersCubit(
    this._homeRepository,
  ) : super(const PartnersState.initialState());

  Future<void> partners() async {
    emit(const PartnersState.loadingState());
    final failureOrUser = await _homeRepository.partners();
    failureOrUser.fold(
      (l) {
        emit(PartnersState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(PartnersState.loaded(partners: r));
      },
    );
  }
}

@freezed
class PartnersState with _$PartnersState {
  const factory PartnersState.initialState() = _InitialPage;

  const factory PartnersState.loadingState() = _LoadingState;

  const factory PartnersState.loaded({
    required List<ResultHomeDTO> partners,
  }) = _LoadedState;

  const factory PartnersState.errorState({
    required String message,
  }) = _ErrorState;
}
