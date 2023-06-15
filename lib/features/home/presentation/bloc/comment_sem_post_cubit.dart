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
  ) : super(const CommentSemPostState.initialState());

  Future<void> seminarCommentPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    emit(const CommentSemPostState.loadingState());
    final failureOrUser = await _homeRepository.commentSemPost(
      id: id,
      commentId: commentId,
      body: body,
    );
    failureOrUser.fold(
      (l) {
        emit(CommentSemPostState.errorState(
            message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const CommentSemPostState.loaded());
      },
    );
  }
}

@freezed
class CommentSemPostState with _$CommentSemPostState {
  const factory CommentSemPostState.initialState() = _InitialPage;

  const factory CommentSemPostState.loadingState() = _LoadingState;

  const factory CommentSemPostState.loaded() = _LoadedState;

  const factory CommentSemPostState.errorState({
    required String message,
  }) = _ErrorState;
}
