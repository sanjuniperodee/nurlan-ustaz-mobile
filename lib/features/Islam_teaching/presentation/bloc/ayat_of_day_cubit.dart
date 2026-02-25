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

  AyatDTO? _ayat;
  List<PillarsDTO> fatyas = [];

  /// Loads both ayat of the day and fatwas sequentially to avoid race conditions.
  Future<void> loadData() async {
    emit(const AyatOfDayState.loading());

    final ayatResult = await _islamTeachingRepository.ayatOfDay();
    final ayat = ayatResult.fold(
      (l) {
        emit(AyatOfDayState.error(message: mapFailureToMessage(l)));
        return null;
      },
      (r) => r,
    );
    if (ayat == null) return;

    _ayat = ayat;

    final fatwasResult = await _islamTeachingRepository.fatwas();
    fatwasResult.fold(
      (l) {
        emit(AyatOfDayState.error(message: mapFailureToMessage(l)));
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
