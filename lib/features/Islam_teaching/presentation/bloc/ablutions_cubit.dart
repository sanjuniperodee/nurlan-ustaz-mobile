import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'ablutions_cubit.freezed.dart';

@singleton
class AblutionsCubit extends Cubit<AblutionsState> {
  final IslamTeachingRepository _islamTeachingRepository;
  AblutionsCubit(
    this._islamTeachingRepository,
  ) : super(const AblutionsState.initial());

  List<NamazDTO> abl = [];
  List<PillarsDTO> pre = [];
  Future<void> ablutions({required String gender}) async {
    emit(const AblutionsState.loading());

    final failureOrUser =
        await _islamTeachingRepository.ablutions(gender: gender);

    failureOrUser.fold(
      (l) {
        emit(AblutionsState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        abl = r;
        emit(AblutionsState.loaded(abl: abl, pre: pre));
      },
    );
  }

  Future<void> prayerTimes({required String gender}) async {
    emit(const AblutionsState.loading());

    final failureOrUser =
        await _islamTeachingRepository.prayerTimes(gender: gender);

    failureOrUser.fold(
      (l) {
        emit(AblutionsState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        pre = r;
        emit(AblutionsState.loaded(abl: abl, pre: pre));
      },
    );
  }
}

@freezed
sealed class AblutionsState with _$AblutionsState {
  const factory AblutionsState.initial() = AblutionsInitialPage;
  const factory AblutionsState.loading() = AblutionsLoadingState;
  const factory AblutionsState.loaded({
    required List<NamazDTO> abl,
    required List<PillarsDTO> pre,
  }) = AblutionsLoadedState;
  const factory AblutionsState.error({
    required String message,
  }) = AblutionsErrorState;
}
