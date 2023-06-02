import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'dhikrs_cubit.freezed.dart';

@singleton
class DhikrsCubit extends Cubit<DhikrsState> {
  final IslamTeachingRepository _islamTeachingRepository;
  DhikrsCubit(
    this._islamTeachingRepository,
  ) : super(const DhikrsState.initialState());

  Future<void> dhikrs({String? search, bool? isSaved}) async {
    final failureOrUser =
        await _islamTeachingRepository.dhikrs(search: search, isSaved: isSaved);
    failureOrUser.fold(
      (l) {
        emit(DhikrsState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(DhikrsState.loaded(dhikrs: r));
      },
    );
  }
}

@freezed
class DhikrsState with _$DhikrsState {
  const factory DhikrsState.initialState() = _InitialPage;

  const factory DhikrsState.loadingState() = _LoadingState;

  const factory DhikrsState.loaded({
    required List<ResultDTO> dhikrs,
  }) = _LoadedState;

  const factory DhikrsState.errorState({
    required String message,
  }) = _ErrorState;
}
