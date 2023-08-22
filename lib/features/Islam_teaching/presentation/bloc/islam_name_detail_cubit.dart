import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'islam_name_detail_cubit.freezed.dart';

@singleton
class IslamNameDetailCubit extends Cubit<IslamNameDetailState> {
  final IslamTeachingRepository _islamTeachingRepository;
  IslamNameDetailCubit(
    this._islamTeachingRepository,
  ) : super(const IslamNameDetailState.initialState());
  late ResultTeachingDTO res;
  Future<void> islamNameDetail({
    required int id,
  }) async {
    // emit(const SeminarDetailState.loadingState());
    final failureOrUser = await _islamTeachingRepository.detailIslamName(
      id: id,
    );
    failureOrUser.fold(
      (l) {
        emit(IslamNameDetailState.errorState(
            message: mapFailureToMessageBack(l)));
      },
      (r) {
        res = r;
        emit(IslamNameDetailState.loaded(res: r));
      },
    );
  }

  Future<void> islamNameFavorite({required int id}) async {
    final failureOrUser =
        await _islamTeachingRepository.islamNamesFavorite(id: id);
    failureOrUser.fold(
      (l) {
      emit(IslamNameDetailState.loaded(res: res));
      },
      (r) {
        res = res.copyWith(isSaved: !res.isSaved!);
        emit(IslamNameDetailState.loaded(res: res));
      },
    );
  }
}

@freezed
class IslamNameDetailState with _$IslamNameDetailState {
  const factory IslamNameDetailState.initialState() = _InitialPage;

  const factory IslamNameDetailState.loadingState() = _LoadingState;

  const factory IslamNameDetailState.loaded({required ResultTeachingDTO res}) =
      _LoadedState;

  const factory IslamNameDetailState.errorState({
    required String message,
  }) = _ErrorState;
}
