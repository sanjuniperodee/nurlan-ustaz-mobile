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
  ) : super(const CommentNewsState.initialState());

  Future<void> commentsNews({
    required int page,
    bool? isFirstCall,
    int? id,
  }) async {
    page > 1
        ? emit(const CommentNewsState.loadingMoreState())
        : emit(const CommentNewsState.loadingState());
    final failureOrUser = await _homeRepository.commentNews(
        page: page, isFirstCall: isFirstCall, id: id);
    failureOrUser.fold(
      (l) {
        emit(CommentNewsState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(CommentNewsState.loaded(comments: r));
      },
    );
  }
}

@freezed
class CommentNewsState with _$CommentNewsState {
  const factory CommentNewsState.initialState() = _InitialPage;

  const factory CommentNewsState.loadingState() = _LoadingState;
  const factory CommentNewsState.loadingMoreState() = _LoadingMoreState;

  const factory CommentNewsState.loaded({
    required List<ResultHomeDTO> comments,
  }) = _LoadedState;

  const factory CommentNewsState.errorState({
    required String message,
  }) = _ErrorState;
}
