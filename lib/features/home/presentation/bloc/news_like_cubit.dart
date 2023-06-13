import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'news_like_cubit.freezed.dart';

@singleton
class NewsLikeCubit extends Cubit<NewsLikeState> {
  final HomeRepository _homeRepository;
  NewsLikeCubit(
    this._homeRepository,
  ) : super(const NewsLikeState.initialState());

  Future<void> newsLike({required int id}) async {
    final failureOrUser = await _homeRepository.newsLike(id: id);
    failureOrUser.fold(
      (l) {
        emit(NewsLikeState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const NewsLikeState.loaded());
      },
    );
  }
}

@freezed
class NewsLikeState with _$NewsLikeState {
  const factory NewsLikeState.initialState() = _InitialPage;

  const factory NewsLikeState.loadingState() = _LoadingState;

  const factory NewsLikeState.loaded() = _LoadedState;

  const factory NewsLikeState.errorState({
    required String message,
  }) = _ErrorState;
}
