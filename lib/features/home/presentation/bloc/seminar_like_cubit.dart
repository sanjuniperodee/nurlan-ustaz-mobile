import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'seminar_like_cubit.freezed.dart';

@singleton
class SeminarLikeCubit extends Cubit<SeminarLikeState> {
  final HomeRepository _homeRepository;
  SeminarLikeCubit(
    this._homeRepository,
  ) : super(const SeminarLikeState.initialState());

  Future<void> seminarLike({required int id}) async {
    final failureOrUser = await _homeRepository.seminarLike(id: id);
    failureOrUser.fold(
      (l) {
        emit(SeminarLikeState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const SeminarLikeState.loaded());
      },
    );
  }
}

@freezed
class SeminarLikeState with _$SeminarLikeState {
  const factory SeminarLikeState.initialState() = _InitialPage;

  const factory SeminarLikeState.loadingState() = _LoadingState;

  const factory SeminarLikeState.loaded() = _LoadedState;

  const factory SeminarLikeState.errorState({
    required String message,
  }) = _ErrorState;
}
