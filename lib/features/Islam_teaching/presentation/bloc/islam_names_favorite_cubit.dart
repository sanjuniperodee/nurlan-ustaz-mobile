import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'islam_names_favorite_cubit.freezed.dart';

@singleton
class IslamNamesFavoriteCubit extends Cubit<IslamNamesFavoriteState> {
  final IslamTeachingRepository _islamTeachingRepository;
  IslamNamesFavoriteCubit(
    this._islamTeachingRepository,
  ) : super(const IslamNamesFavoriteState.initialState());

  Future<void> islamNamesFavorite({required int id}) async {
    final failureOrUser =
        await _islamTeachingRepository.islamNamesFavorite(id: id);

    failureOrUser.fold(
      (l) {
        emit(IslamNamesFavoriteState.errorState(
            message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const IslamNamesFavoriteState.loaded());
      },
    );
  }
}

@freezed
class IslamNamesFavoriteState with _$IslamNamesFavoriteState {
  const factory IslamNamesFavoriteState.initialState() = _InitialPage;

  const factory IslamNamesFavoriteState.loadingState() = _LoadingState;

  const factory IslamNamesFavoriteState.loaded() = _LoadedState;

  const factory IslamNamesFavoriteState.errorState({
    required String message,
  }) = _ErrorState;
}
