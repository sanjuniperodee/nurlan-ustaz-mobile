import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_sem_like_cubit.freezed.dart';

@singleton
class CommentSemLikeCubit extends Cubit<CommentSemLikeState> {
  final HomeRepository _homeRepository;
  CommentSemLikeCubit(
    this._homeRepository,
  ) : super(const CommentSemLikeState.initialState());

  Future<void> seminarCommentLike({
    required int id,
    required int commentId,
  }) async {
    final failureOrUser =
        await _homeRepository.commentSemLike(id: id, commentId: commentId);
    failureOrUser.fold(
      (l) {
        emit(CommentSemLikeState.errorState(
            message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const CommentSemLikeState.loaded());
      },
    );
  }
}

@freezed
class CommentSemLikeState with _$CommentSemLikeState {
  const factory CommentSemLikeState.initialState() = _InitialPage;

  const factory CommentSemLikeState.loadingState() = _LoadingState;

  const factory CommentSemLikeState.loaded() = _LoadedState;

  const factory CommentSemLikeState.errorState({
    required String message,
  }) = _ErrorState;
}
