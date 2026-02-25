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
  ) : super(const GeonamesState.initial());

  Future<void> geoNames({required String name}) async {
    // emit(const GeonamesState.loadingState());
    final failureOrUser = await _homeRepository.geoNames(name: name);
    failureOrUser.fold(
      (l) {
        emit(GeonamesState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(GeonamesState.loaded(geo: r));
      },
    );
  }
}

@freezed
sealed class GeonamesState with _$GeonamesState {
  const factory GeonamesState.initial() = GeonamesInitialPage;
  const factory GeonamesState.loading() = GeonamesLoadingState;
  const factory GeonamesState.loaded({
    required List<GeonamesDTO> geo,
  }) = GeonamesLoadedState;
  const factory GeonamesState.error({
    required String message,
  }) = GeonamesErrorState;
}
