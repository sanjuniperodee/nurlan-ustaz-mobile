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
  ) : super(const IslamNameDetailState.initial());
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
        emit(IslamNameDetailState.error(message: mapFailureToMessage(l)));
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
sealed class IslamNameDetailState with _$IslamNameDetailState {
  const factory IslamNameDetailState.initial() = IslamNameDetailInitialPage;
  const factory IslamNameDetailState.loading() = IslamNameDetailLoadingState;
  const factory IslamNameDetailState.loaded({required ResultTeachingDTO res}) =
      IslamNameDetailLoadedState;
  const factory IslamNameDetailState.error({
    required String message,
  }) = IslamNameDetailErrorState;
}
