import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_news_like_cubit.freezed.dart';

@singleton
class CommentNewsLikeCubit extends Cubit<CommentNewsLikeState> {
  final HomeRepository _homeRepository;
  CommentNewsLikeCubit(
    this._homeRepository,
  ) : super(const CommentNewsLikeState.initialState());

  Future<void> newsCommentLike({
    required int id,
    required int commentId,
  }) async {
    final failureOrUser =
        await _homeRepository.commentNewsLike(id: id, commentId: commentId);
    failureOrUser.fold(
      (l) {
        emit(CommentNewsLikeState.errorState(
            message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const CommentNewsLikeState.loaded());
      },
    );
  }
}

@freezed
class CommentNewsLikeState with _$CommentNewsLikeState {
  const factory CommentNewsLikeState.initialState() = _InitialPage;

  const factory CommentNewsLikeState.loadingState() = _LoadingState;

  const factory CommentNewsLikeState.loaded() = _LoadedState;

  const factory CommentNewsLikeState.errorState({
    required String message,
  }) = _ErrorState;
}
