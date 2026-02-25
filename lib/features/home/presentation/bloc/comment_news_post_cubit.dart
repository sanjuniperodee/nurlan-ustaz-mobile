import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_news_post_cubit.freezed.dart';

@singleton
class CommentNewsPostCubit extends Cubit<CommentNewsPostState> {
  final HomeRepository _homeRepository;
  CommentNewsPostCubit(
    this._homeRepository,
  ) : super(const CommentNewsPostState.initialState());

  Future<void> newsCommentPost({
    required int id,
    int? commentId,
    required String body,
  }) async {
    emit(const CommentNewsPostState.loadingState());
    final failureOrUser = await _homeRepository.commentNewsPost(
      id: id,
      commentId: commentId,
      body: body,
    );
    failureOrUser.fold(
      (l) {
        emit(CommentNewsPostState.errorState(
            message: mapFailureToMessage(l)));
      },
      (r) {
        log('1');
        emit(const CommentNewsPostState.loaded());
        log('2');
      },
    );
  }
}

@freezed
class CommentNewsPostState with _$CommentNewsPostState {
  const factory CommentNewsPostState.initialState() = _InitialPage;

  const factory CommentNewsPostState.loadingState() = _LoadingState;

  const factory CommentNewsPostState.loaded() = _LoadedState;

  const factory CommentNewsPostState.errorState({
    required String message,
  }) = _ErrorState;
}
