import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/names_of_Allah_dto.dart';

import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'names_of_Allah_cubit.freezed.dart';

@singleton
class NamesOfAllahCubit extends Cubit<NamesOfAllahState> {
  final IslamTeachingRepository _islamTeachingRepository;
  NamesOfAllahCubit(
    this._islamTeachingRepository,
  ) : super(const NamesOfAllahState.initialState());

  Future<void> namesOfAllah({String? search, bool? isSaved}) async {
    final failureOrUser = await _islamTeachingRepository.namesOfAllah(
        search: search, isSaved: isSaved);

    failureOrUser.fold(
      (l) {
        emit(NamesOfAllahState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NamesOfAllahState.loaded(names: r));
      },
    );
  }
}

@freezed
class NamesOfAllahState with _$NamesOfAllahState {
  const factory NamesOfAllahState.initialState() = _InitialPage;

  const factory NamesOfAllahState.loadingState() = _LoadingState;

  const factory NamesOfAllahState.loaded({
    required List<NamesOfAllahDTO> names,
  }) = _LoadedState;

  const factory NamesOfAllahState.errorState({
    required String message,
  }) = _ErrorState;
}
