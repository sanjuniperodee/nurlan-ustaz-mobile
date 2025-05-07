import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_news_cubit.freezed.dart';

@singleton
class CommentNewsCubit extends Cubit<CommentNewsState> {
  final HomeRepository _homeRepository;
  CommentNewsCubit(
    this._homeRepository,
  ) : super(const CommentNewsState.initial());

  Future<void> commentsNews({
    required int page,
    bool? isFirstCall,
    int? id,
  }) async {
    page > 1
        ? emit(const CommentNewsState.loadingMore())
        : emit(const CommentNewsState.loading());
    final failureOrUser = await _homeRepository.commentNews(
        page: page, isFirstCall: isFirstCall, id: id);
    failureOrUser.fold(
      (l) {
        emit(CommentNewsState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(CommentNewsState.loaded(comments: r));
      },
    );
  }
}

@freezed
sealed class CommentNewsState with _$CommentNewsState {
  const factory CommentNewsState.initial() = CommentNewsInitialPage;
  const factory CommentNewsState.loading() = CommentNewsLoadingState;
  const factory CommentNewsState.loadingMore() = CommentNewsLoadingMoreState;
  const factory CommentNewsState.loaded({
    required List<ResultHomeDTO> comments,
  }) = CommentNewsLoadedState;
  const factory CommentNewsState.error({
    required String message,
  }) = CommentNewsErrorState;
}
