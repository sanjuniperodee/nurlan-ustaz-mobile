import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'dhikrs_cubit.freezed.dart';

@singleton
class DhikrsCubit extends Cubit<DhikrsState> {
  final IslamTeachingRepository _islamTeachingRepository;
  DhikrsCubit(
    this._islamTeachingRepository,
  ) : super(const DhikrsState.initialState());

  Future<void> dhikrs({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const DhikrsState.loadingMoreState())
        : emit(const DhikrsState.loadingState());
    final failureOrUser = await _islamTeachingRepository.dhikrs(
        search: search,
        isSaved: isSaved,
        currentPage: page,
        isFirstCall: isFirstCall);
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
  const factory DhikrsState.loadingMoreState() = _LoadingMoreState;
  const factory DhikrsState.loaded({
    required List<ResultTeachingDTO> dhikrs,
  }) = _LoadedState;

  const factory DhikrsState.errorState({
    required String message,
  }) = _ErrorState;
}
