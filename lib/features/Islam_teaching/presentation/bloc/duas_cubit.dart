import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'duas_cubit.freezed.dart';

@singleton
class DuasCubit extends Cubit<DuasState> {
  final IslamTeachingRepository _islamTeachingRepository;
  DuasCubit(
    this._islamTeachingRepository,
  ) : super(const DuasState.initial());

  Future<void> duas({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const DuasState.loadingMore())
        : emit(const DuasState.loading());
    final failureOrUser = await _islamTeachingRepository.duha(
        search: search,
        isSaved: isSaved,
        currentPage: page,
        isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(DuasState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(DuasState.loaded(duha: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class DuasState with _$DuasState {
  const factory DuasState.initial() = DuasInitialPage;
  const factory DuasState.loading() = DuasLoadingState;
  const factory DuasState.loadingMore() = DuasLoadingMoreState;
  const factory DuasState.loaded({
    required List<ResultTeachingDTO> duha,
  }) = DuasLoadedState;
  const factory DuasState.error({
    required String message,
  }) = DuasErrorState;
}
