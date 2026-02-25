import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_sem_post_cubit.freezed.dart';

@singleton
class CommentSemPostCubit extends Cubit<CommentSemPostState> {
  final HomeRepository _homeRepository;
  CommentSemPostCubit(
    this._homeRepository,
  ) : super(const CommentSemPostState.initial());

  Future<void> seminarCommentPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    emit(const CommentSemPostState.loading());
    final failureOrUser = await _homeRepository.commentSemPost(
      id: id,
      commentId: commentId,
      body: body,
    );
    failureOrUser.fold(
      (l) {
        emit(CommentSemPostState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const CommentSemPostState.loaded());
      },
    );
  }
}

@freezed
sealed class CommentSemPostState with _$CommentSemPostState {
  const factory CommentSemPostState.initial() = CommentSemPostInitialPage;
  const factory CommentSemPostState.loading() = CommentSemPostLoadingState;
  const factory CommentSemPostState.loaded() = CommentSemPostLoadedState;
  const factory CommentSemPostState.error({
    required String message,
  }) = CommentSemPostErrorState;
}
