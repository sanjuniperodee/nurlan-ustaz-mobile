import 'dart:developer';

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
  late List<ResultHomeDTO> lives;

  late List<ResultHomeDTO> news;

  late List<ResultHomeDTO> seminars;

  Future<void> fetchAllData({
    String? search,
    bool isSaved = true,
    required int page,
    bool? isFirstCall,
  }) async {
    emit(const TandaulilarState.loadingState());

    final failureOrLives = await _homeRepository.lives(
      search: search,
      isSaved: isSaved,
      page: page,
      isFirstCall: isFirstCall,
    );

    final failureOrNews = await _homeRepository.news(
      search: search,
      isSaved: isSaved,
      page: page,
      isFirstCall: isFirstCall,
    );

    final failureOrSeminars = await _homeRepository.seminar(
      search: search,
      isSaved: isSaved,
      page: page,
      isFirstCall: isFirstCall,
    );

    failureOrLives.fold(
      (l) {
        emit(TandaulilarState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        lives = r;
      },
    );

    failureOrNews.fold(
      (l) {
        emit(TandaulilarState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        news = r;
      },
    );

    failureOrSeminars.fold(
      (l) {
        emit(TandaulilarState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        seminars = r;
      },
    );
    log('pppp-${lives.map((e) => e.cover).toList().toString() + news.map((e) => e.cover).toList().toString() + seminars.map((e) => e.cover).toList().toString()}');

    emit(TandaulilarState.loaded(lives: lives, news: news, seminars: seminars));
  }

  Future<void> livesT({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    emit(const TandaulilarState.loadingState());
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
    emit(const TandaulilarState.loadingState());
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
    emit(const TandaulilarState.loadingState());
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
    @Default([]) final List<ResultHomeDTO> lives,
    @Default([]) final List<ResultHomeDTO> news,
    @Default([]) final List<ResultHomeDTO> seminars,
  }) = _LoadedState;

  const factory TandaulilarState.errorState({
    required String message,
  }) = _ErrorState;
}
