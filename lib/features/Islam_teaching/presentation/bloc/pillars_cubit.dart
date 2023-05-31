import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'pillars_cubit.freezed.dart';

@singleton
class PillarsCubit extends Cubit<PillarsState> {
  final IslamTeachingRepository _islamTeachingRepository;
  PillarsCubit(
    this._islamTeachingRepository,
  ) : super(const PillarsState.initialState());

  Future<void> pillars() async {
    emit(const PillarsState.loadingState());

    final failureOrUser = await _islamTeachingRepository.pillars();

    failureOrUser.fold(
      (l) {
        emit(PillarsState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(PillarsState.loaded(pillars: r));
      },
    );
  }
}

@freezed
class PillarsState with _$PillarsState {
  const factory PillarsState.initialState() = _InitialPage;

  const factory PillarsState.loadingState() = _LoadingState;

  const factory PillarsState.loaded({
    required List<PillarsDTO> pillars,
  }) = _LoadedState;

  const factory PillarsState.errorState({
    required String message,
  }) = _ErrorState;
}
