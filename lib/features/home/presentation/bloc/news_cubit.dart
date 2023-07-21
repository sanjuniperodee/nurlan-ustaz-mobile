import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'news_cubit.freezed.dart';

@singleton
class NewsCubit extends Cubit<NewsState> {
  final HomeRepository _homeRepository;
  NewsCubit(
    this._homeRepository,
  ) : super(const NewsState.initialState());

  Future<void> news({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const NewsState.loadingMoreState())
        : emit(const NewsState.loadingState());
    final failureOrUser = await _homeRepository.news(
        search: search, isSaved: isSaved, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(NewsState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NewsState.loaded(news: r.toSet().toList()));
      },
    );
  }

  
}

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initialState() = _InitialPage;

  const factory NewsState.loadingState() = _LoadingState;
  const factory NewsState.loadingMoreState() = _LoadingMoreState;

  const factory NewsState.loaded({
    required List<ResultHomeDTO> news,
  }) = _LoadedState;

  const factory NewsState.errorState({
    required String message,
  }) = _ErrorState;
}
