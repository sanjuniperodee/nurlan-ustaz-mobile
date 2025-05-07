import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'ayat_of_day_cubit.freezed.dart';

@singleton
class AyatOfDayCubit extends Cubit<AyatOfDayState> {
  final IslamTeachingRepository _islamTeachingRepository;
  AyatOfDayCubit(
    this._islamTeachingRepository,
  ) : super(const AyatOfDayState.initial());

  late AyatDTO ayat;
  List<PillarsDTO> fatyas = [];
  Future<void> auatOfDay() async {
    emit(const AyatOfDayState.loading());

    final failureOrUser = await _islamTeachingRepository.ayatOfDay();

    failureOrUser.fold(
      (l) {
        emit(AyatOfDayState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        ayat = r;
        emit(AyatOfDayState.loaded(ayat: ayat, pillars: fatyas));
      },
    );
  }

  Future<void> fatya() async {
    emit(const AyatOfDayState.loading());

    final failureOrUser = await _islamTeachingRepository.fatwas();

    failureOrUser.fold(
      (l) {
        emit(AyatOfDayState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        fatyas = r;
        emit(AyatOfDayState.loaded(ayat: ayat, pillars: fatyas));
      },
    );
  }
}

@freezed
sealed class AyatOfDayState with _$AyatOfDayState {
  const factory AyatOfDayState.initial() = AyatOfDayInitialPage;
  const factory AyatOfDayState.loading() = AyatOfDayLoadingState;
  const factory AyatOfDayState.loaded({
    required AyatDTO ayat,
    required List<PillarsDTO> pillars,
  }) = AyatOfDayLoadedState;
  const factory AyatOfDayState.error({
    required String message,
  }) = AyatOfDayErrorState;
}
