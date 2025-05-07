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
  ) : super(const NewsState.initial());

  Future<void> news({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const NewsState.loadingMore())
        : emit(const NewsState.loading());
    final failureOrUser = await _homeRepository.news(
        search: search, isSaved: isSaved, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(NewsState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NewsState.loaded(news: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class NewsState with _$NewsState {
  const factory NewsState.initial() = NewsInitialPage;
  const factory NewsState.loading() = NewsLoadingState;
  const factory NewsState.loadingMore() = NewsLoadingMoreState;
  const factory NewsState.loaded({
    required List<ResultHomeDTO> news,
  }) = NewsLoadedState;
  const factory NewsState.error({
    required String message,
  }) = NewsErrorState;
}
