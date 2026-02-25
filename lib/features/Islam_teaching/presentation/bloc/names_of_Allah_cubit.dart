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
  ) : super(const NamesOfAllahState.initial());

  Future<void> namesOfAllah({String? search, bool? isSaved}) async {
    final failureOrUser = await _islamTeachingRepository.namesOfAllah(
        search: search, isSaved: isSaved);

    failureOrUser.fold(
      (l) {
        emit(NamesOfAllahState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(NamesOfAllahState.loaded(names: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class NamesOfAllahState with _$NamesOfAllahState {
  const factory NamesOfAllahState.initial() = NamesOfAllahInitialPage;
  const factory NamesOfAllahState.loading() = NamesOfAllahLoadingState;
  const factory NamesOfAllahState.loaded({
    required List<NamesOfAllahDTO> names,
  }) = NamesOfAllahLoadedState;
  const factory NamesOfAllahState.error({
    required String message,
  }) = NamesOfAllahErrorState;
}
