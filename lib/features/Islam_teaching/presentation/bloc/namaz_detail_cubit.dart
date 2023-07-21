import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'namaz_detail_cubit.freezed.dart';

@singleton
class NamazDetailCubit extends Cubit<NamazDetailState> {
  final IslamTeachingRepository _islamTeachingRepository;
  NamazDetailCubit(
    this._islamTeachingRepository,
  ) : super(const NamazDetailState.initialState());

  Future<void> namazDetail({required String gender, required int id}) async {
    emit(const NamazDetailState.loadingState());

    final failureOrUser =
        await _islamTeachingRepository.namazDetail(gender: gender, id: id);

    failureOrUser.fold(
      (l) {
        emit(NamazDetailState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NamazDetailState.loaded(namaz: r));
      },
    );
  }
}

@freezed
class NamazDetailState with _$NamazDetailState {
  const factory NamazDetailState.initialState() = _InitialPage;

  const factory NamazDetailState.loadingState() = _LoadingState;

  const factory NamazDetailState.loaded({
    required List<NamazDTO> namaz,
  }) = _LoadedState;

  const factory NamazDetailState.errorState({
    required String message,
  }) = _ErrorState;
}
