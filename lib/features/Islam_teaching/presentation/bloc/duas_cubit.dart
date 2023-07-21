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
  ) : super(const DuasState.initialState());

  Future<void> duas({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const DuasState.loadingMoreState())
        : emit(const DuasState.loadingState());
    final failureOrUser = await _islamTeachingRepository.duha(
        search: search,
        isSaved: isSaved,
        currentPage: page,
        isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(DuasState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(DuasState.loaded(duha: r.toSet().toList()));
      },
    );
  }
}

@freezed
class DuasState with _$DuasState {
  const factory DuasState.initialState() = _InitialPage;

  const factory DuasState.loadingState() = _LoadingState;
  const factory DuasState.loadingMoreState() = _LoadingMoreState;
  const factory DuasState.loaded({
    required List<ResultTeachingDTO> duha,
  }) = _LoadedState;

  const factory DuasState.errorState({
    required String message,
  }) = _ErrorState;
}
