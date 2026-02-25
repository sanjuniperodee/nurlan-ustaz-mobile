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
  ) : super(const PartnersState.initial());

  Future<void> partners() async {
    emit(const PartnersState.loading());
    final failureOrUser = await _homeRepository.partners();
    failureOrUser.fold(
      (l) {
        emit(PartnersState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(PartnersState.loaded(partners: r));
      },
    );
  }
}

@freezed
sealed class PartnersState with _$PartnersState {
  const factory PartnersState.initial() = PartnersInitialPage;
  const factory PartnersState.loading() = PartnersLoadingState;
  const factory PartnersState.loaded({
    required List<ResultHomeDTO> partners,
  }) = PartnersLoadedState;
  const factory PartnersState.error({
    required String message,
  }) = PartnersErrorState;
}
