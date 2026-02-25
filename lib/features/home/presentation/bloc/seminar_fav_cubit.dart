import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'seminar_fav_cubit.freezed.dart';

@singleton
class SeminarFavCubit extends Cubit<SeminarFavState> {
  final HomeRepository _homeRepository;
  SeminarFavCubit(
    this._homeRepository,
  ) : super(const SeminarFavState.initialState());

  Future<void> seminarFavorite({required int id}) async {
    emit(const SeminarFavState.loadingState());
    final failureOrUser = await _homeRepository.seminarFavorite(id: id);
    failureOrUser.fold(
      (l) {
        emit(SeminarFavState.errorState(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const SeminarFavState.loaded());
      },
    );
  }
}

@freezed
class SeminarFavState with _$SeminarFavState {
  const factory SeminarFavState.initialState() = _InitialPage;

  const factory SeminarFavState.loadingState() = _LoadingState;

  const factory SeminarFavState.loaded() = _LoadedState;

  const factory SeminarFavState.errorState({
    required String message,
  }) = _ErrorState;
}
