import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'dhikrs_favorite_cubit.freezed.dart';

@singleton
class DhikrsFavoriteCubit extends Cubit<DhikrsFavoriteState> {
  final IslamTeachingRepository _islamTeachingRepository;
  DhikrsFavoriteCubit(
    this._islamTeachingRepository,
  ) : super(const DhikrsFavoriteState.initialState());

  Future<void> dhikrsFavorite({required int id}) async {
    final failureOrUser = await _islamTeachingRepository.dhikrsFavorite(id: id);

    failureOrUser.fold(
      (l) {
        emit(DhikrsFavoriteState.errorState(
            message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const DhikrsFavoriteState.loaded());
      },
    );
  }
}

@freezed
class DhikrsFavoriteState with _$DhikrsFavoriteState {
  const factory DhikrsFavoriteState.initialState() = _InitialPage;

  const factory DhikrsFavoriteState.loadingState() = _LoadingState;

  const factory DhikrsFavoriteState.loaded() = _LoadedState;

  const factory DhikrsFavoriteState.errorState({
    required String message,
  }) = _ErrorState;
}
