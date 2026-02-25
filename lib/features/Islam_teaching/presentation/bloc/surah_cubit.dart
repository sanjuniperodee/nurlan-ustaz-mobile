import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'surah_cubit.freezed.dart';

@singleton
class SurahCubit extends Cubit<SurahState> {
  final IslamTeachingRepository _islamTeachingRepository;
  SurahCubit(
    this._islamTeachingRepository,
  ) : super(const SurahState.initial());

  Future<void> sura({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const SurahState.loadingMore())
        : emit(const SurahState.loading());
    final failureOrUser = await _islamTeachingRepository.sura(
        search: search,
        isSaved: isSaved,
        currentPage: page,
        isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(SurahState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(SurahState.loaded(sura: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class SurahState with _$SurahState {
  const factory SurahState.initial() = SurahInitialPage;
  const factory SurahState.loading() = SurahLoadingState;
  const factory SurahState.loadingMore() = SurahLoadingMoreState;
  const factory SurahState.loaded({
    required List<ResultTeachingDTO> sura,
  }) = SurahLoadedState;
  const factory SurahState.error({
    required String message,
  }) = SurahErrorState;
}
