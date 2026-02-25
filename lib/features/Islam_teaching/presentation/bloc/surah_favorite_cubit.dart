import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';

part 'surah_favorite_cubit.freezed.dart';

@singleton
class SurahFavoriteCubit extends Cubit<SurahFavoriteState> {
  final IslamTeachingRepository _islamTeachingRepository;
  SurahFavoriteCubit(
    this._islamTeachingRepository,
  ) : super(const SurahFavoriteState.initialState());

  Future<void> surahFavorite({required int id}) async {
    final failureOrUser = await _islamTeachingRepository.surahFavorite(id: id);

    failureOrUser.fold(
      (l) {
        emit(
            SurahFavoriteState.errorState(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const SurahFavoriteState.loaded());
      },
    );
  }
}

@freezed
class SurahFavoriteState with _$SurahFavoriteState {
  const factory SurahFavoriteState.initialState() = _InitialPage;

  const factory SurahFavoriteState.loadingState() = _LoadingState;

  const factory SurahFavoriteState.loaded() = _LoadedState;

  const factory SurahFavoriteState.errorState({
    required String message,
  }) = _ErrorState;
}
