import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_sem_cubit.freezed.dart';

@singleton
class CommentSemCubit extends Cubit<CommentSemState> {
  final HomeRepository _homeRepository;
  CommentSemCubit(
    this._homeRepository,
  ) : super(const CommentSemState.initial());

  Future<void> commentsSem({
    required int page,
    bool? isFirstCall,
    int? id,
  }) async {
    page > 1
        ? emit(const CommentSemState.loadingMore())
        : emit(const CommentSemState.loading());
    final failureOrUser = await _homeRepository.commentSem(
        page: page, isFirstCall: isFirstCall, id: id);
    failureOrUser.fold(
      (l) {
        emit(CommentSemState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(CommentSemState.loaded(comments: r));
      },
    );
  }
}

@freezed
sealed class CommentSemState with _$CommentSemState {
  const factory CommentSemState.initial() = CommentSemInitialPage;
  const factory CommentSemState.loading() = CommentSemLoadingState;
  const factory CommentSemState.loadingMore() = CommentSemLoadingMoreState;
  const factory CommentSemState.loaded({
    required List<ResultHomeDTO> comments,
  }) = CommentSemLoadedState;
  const factory CommentSemState.error({
    required String message,
  }) = CommentSemErrorState;
}
