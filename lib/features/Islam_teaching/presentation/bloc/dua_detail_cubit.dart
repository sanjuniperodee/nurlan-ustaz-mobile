import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'dua_detail_cubit.freezed.dart';

@singleton
class DuaDetailCubit extends Cubit<DuaDetailState> {
  final IslamTeachingRepository _islamTeachingRepository;
  DuaDetailCubit(
    this._islamTeachingRepository,
  ) : super(const DuaDetailState.initialState());
  late ResultTeachingDTO res;
  Future<void> duaDetail({
    required int id,
  }) async {
    // emit(const SeminarDetailState.loadingState());
    final failureOrUser = await _islamTeachingRepository.detailDua(
      id: id,
    );
    failureOrUser.fold(
      (l) {
        emit(DuaDetailState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        res = r;
        emit(DuaDetailState.loaded(res: r));
      },
    );
  }

  Future<void> duasFavorite({required int id}) async {
    final failureOrUser = await _islamTeachingRepository.duasFavorite(id: id);
    failureOrUser.fold(
      (l) {
        emit(DuaDetailState.loaded(res: res));
      },
      (r) {
        res = res.copyWith(isSaved: !res.isSaved!);
        emit(DuaDetailState.loaded(res: res));
      },
    );
  }
}

@freezed
class DuaDetailState with _$DuaDetailState {
  const factory DuaDetailState.initialState() = _InitialPage;

  const factory DuaDetailState.loadingState() = _LoadingState;

  const factory DuaDetailState.loaded({required ResultTeachingDTO res}) =
      _LoadedState;

  const factory DuaDetailState.errorState({
    required String message,
  }) = _ErrorState;
}
