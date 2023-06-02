import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'duas_favorite_cubit.freezed.dart';

@singleton
class DuasFavoriteCubit extends Cubit<DuasFavoriteState> {
  final IslamTeachingRepository _islamTeachingRepository;
  DuasFavoriteCubit(
    this._islamTeachingRepository,
  ) : super(const DuasFavoriteState.initialState());

  Future<void> duasFavorite({required int id}) async {
    final failureOrUser = await _islamTeachingRepository.duasFavorite(id: id);

    failureOrUser.fold(
      (l) {
        emit(DuasFavoriteState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const DuasFavoriteState.loaded());
      },
    );
  }
}

@freezed
class DuasFavoriteState with _$DuasFavoriteState {
  const factory DuasFavoriteState.initialState() = _InitialPage;

  const factory DuasFavoriteState.loadingState() = _LoadingState;

  const factory DuasFavoriteState.loaded() = _LoadedState;

  const factory DuasFavoriteState.errorState({
    required String message,
  }) = _ErrorState;
}
