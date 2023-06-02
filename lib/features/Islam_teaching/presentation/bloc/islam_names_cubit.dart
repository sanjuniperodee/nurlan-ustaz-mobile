import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'islam_names_cubit.freezed.dart';

@singleton
class IslamNamesCubit extends Cubit<IslamNamesState> {
  final IslamTeachingRepository _islamTeachingRepository;
  IslamNamesCubit(
    this._islamTeachingRepository,
  ) : super(const IslamNamesState.initialState());

  Future<void> islamNames(
      {String? search, bool? isSaved, String? gender}) async {
    final failureOrUser = await _islamTeachingRepository.islamNames(
        search: search, isSaved: isSaved, gender: gender);
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

  const factory IslamNamesState.loaded({
    required List<ResultDTO> islam,
  }) = _LoadedState;

  const factory IslamNamesState.errorState({
    required String message,
  }) = _ErrorState;
}
