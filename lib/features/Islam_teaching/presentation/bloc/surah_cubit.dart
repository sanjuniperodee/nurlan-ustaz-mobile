import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'surah_cubit.freezed.dart';

@singleton
class SurahCubit extends Cubit<SurahState> {
  final IslamTeachingRepository _islamTeachingRepository;
  SurahCubit(
    this._islamTeachingRepository,
  ) : super(const SurahState.initialState());

  Future<void> sura({String? search, bool? isSaved}) async {
    final failureOrUser =
        await _islamTeachingRepository.sura(search: search, isSaved: isSaved);
    failureOrUser.fold(
      (l) {
        emit(SurahState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(SurahState.loaded(sura: r));
      },
    );
  }
}

@freezed
class SurahState with _$SurahState {
  const factory SurahState.initialState() = _InitialPage;

  const factory SurahState.loadingState() = _LoadingState;

  const factory SurahState.loaded({
    required List<ResultDTO> sura,
  }) = _LoadedState;

  const factory SurahState.errorState({
    required String message,
  }) = _ErrorState;
}
