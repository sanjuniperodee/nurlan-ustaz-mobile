import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'islam_names_cubit.freezed.dart';

@singleton
class IslamNamesCubit extends Cubit<IslamNamesState> {
  final IslamTeachingRepository _islamTeachingRepository;
  IslamNamesCubit(
    this._islamTeachingRepository,
  ) : super(const IslamNamesState.initialState());

  Future<void> islamNamesMan({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const IslamNamesState.loadingMoreState())
        : emit(const IslamNamesState.loadingState());
    final failureOrUser = await _islamTeachingRepository.islamNamesMan(
        search: search, isSaved: isSaved, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(IslamNamesState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(IslamNamesState.loaded(islam: r.toSet().toList()));
      },
    );
  }

  Future<void> islamWoman({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const IslamNamesState.loadingMoreState())
        : emit(const IslamNamesState.loadingState());
    final failureOrUser = await _islamTeachingRepository.islamWoman(
        search: search, isSaved: isSaved, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(IslamNamesState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(IslamNamesState.loaded(islam: r));
      },
    );
  }
}

@freezed
class IslamNamesState with _$IslamNamesState {
  const factory IslamNamesState.initialState() = _InitialPage;

  const factory IslamNamesState.loadingState() = _LoadingState;
  const factory IslamNamesState.loadingMoreState() = _LoadingMoreState;

  const factory IslamNamesState.loaded({
    required List<ResultTeachingDTO> islam,
  }) = _LoadedState;

  const factory IslamNamesState.errorState({
    required String message,
  }) = _ErrorState;
}
