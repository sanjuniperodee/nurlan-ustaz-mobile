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
  ) : super(const DhikrsState.initial());

  Future<void> dhikrs({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const DhikrsState.loadingMore())
        : emit(const DhikrsState.loading());
    final failureOrUser = await _islamTeachingRepository.dhikrs(
        search: search,
        isSaved: isSaved,
        currentPage: page,
        isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(DhikrsState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(DhikrsState.loaded(dhikrs: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class DhikrsState with _$DhikrsState {
  const factory DhikrsState.initial() = DhikrsInitialPage;
  const factory DhikrsState.loading() = DhikrsLoadingState;
  const factory DhikrsState.loadingMore() = DhikrsLoadingMoreState;
  const factory DhikrsState.loaded({
    required List<ResultTeachingDTO> dhikrs,
  }) = DhikrsLoadedState;
  const factory DhikrsState.error({
    required String message,
  }) = DhikrsErrorState;
}
