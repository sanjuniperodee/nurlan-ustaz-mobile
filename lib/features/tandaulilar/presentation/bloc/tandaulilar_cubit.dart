import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'tandaulilar_cubit.freezed.dart';

@singleton
class TandaulilarCubit extends Cubit<TandaulilarState> {
  final HomeRepository _homeRepository;
  TandaulilarCubit(
    this._homeRepository,
  ) : super(const TandaulilarState.initialState());
  List<ResultHomeDTO> lives = [];
  List<ResultHomeDTO> news = [];
  List<ResultHomeDTO> seminars = [];

  Future<void> livesT({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    final failureOrUser = await _homeRepository.lives(
        search: search, isSaved: true, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(TandaulilarState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        lives = r;
        emit(TandaulilarState.loaded(
            lives: lives, news: news, seminars: seminars));
      },
    );
  }

  Future<void> newsT({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    final failureOrUser = await _homeRepository.news(
        search: search, isSaved: true, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(TandaulilarState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        news = r;
        emit(TandaulilarState.loaded(
            lives: lives, news: news, seminars: seminars));
      },
    );
  }

  Future<void> seminarT({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    final failureOrUser = await _homeRepository.seminar(
      search: search,
      isSaved: true,
      page: page,
      isFirstCall: isFirstCall,
    );
    failureOrUser.fold(
      (l) {
        emit(TandaulilarState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        seminars = r;
        emit(TandaulilarState.loaded(
            lives: lives, news: news, seminars: seminars));
      },
    );
  }
}

@freezed
class TandaulilarState with _$TandaulilarState {
  const factory TandaulilarState.initialState() = _InitialPage;

  const factory TandaulilarState.loadingState() = _LoadingState;

  const factory TandaulilarState.loaded({
    required List<ResultHomeDTO> lives,
    required List<ResultHomeDTO> news,
    required List<ResultHomeDTO> seminars,
  }) = _LoadedState;

  const factory TandaulilarState.errorState({
    required String message,
  }) = _ErrorState;
}
