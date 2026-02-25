import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'news_detail_cubit.freezed.dart';

@singleton
class NewsDetailCubit extends Cubit<NewsDetailState> {
  final HomeRepository _homeRepository;
  NewsDetailCubit(
    this._homeRepository,
  ) : super(const NewsDetailState.initial());
  late ResultHomeDTO res;
  Future<void> newsDetail({
    required int id,
  }) async {
    emit(const NewsDetailState.loading());
    final failureOrUser = await _homeRepository.newsDetail(
      id: id,
    );
    failureOrUser.fold(
      (l) {
        emit(NewsDetailState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        res = r;
        emit(NewsDetailState.loaded(res: r));
      },
    );
  }

  Future<void> newsLike({required int id}) async {
    //emit(const SeminarDetailState.loadingState());
    final failureOrUser = await _homeRepository.newsLike(id: id);
    failureOrUser.fold(
      (l) {
        emit(NewsDetailState.loaded(res: res));
      },
      (r) {
        res = res.copyWith(
            isLiked: !res.isLiked!,
            likesCount: res.isLiked! == false
                ? res.likesCount! + 1
                : res.likesCount! - 1);
        emit(NewsDetailState.loaded(res: res));
        //seminarDetail(id: id);
      },
    );
  }

  Future<void> newsFavorite({required int id}) async {
    final failureOrUser = await _homeRepository.newsFavorite(id: id);
    failureOrUser.fold(
      (l) {
        emit(NewsDetailState.loaded(res: res));
      },
      (r) {
        res = res.copyWith(isSaved: !res.isSaved!);
        emit(NewsDetailState.loaded(res: res));
      },
    );
  }
}

@freezed
sealed class NewsDetailState with _$NewsDetailState {
  const factory NewsDetailState.initial() = NewsDetailInitialPage;
  const factory NewsDetailState.loading() = NewsDetailLoadingState;
  const factory NewsDetailState.loaded({required ResultHomeDTO res}) =
      NewsDetailLoadedState;
  const factory NewsDetailState.error({
    required String message,
  }) = NewsDetailErrorState;
}
