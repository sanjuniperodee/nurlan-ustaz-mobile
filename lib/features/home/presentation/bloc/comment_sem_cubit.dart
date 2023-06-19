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
  ) : super(const CommentSemState.initialState());

  Future<void> commentsSem({
    required int page,
    bool? isFirstCall,
    int? id,
  }) async {
    page > 1
        ? emit(const CommentSemState.loadingMoreState())
        : emit(const CommentSemState.loadingState());
    final failureOrUser =
        await _homeRepository.commentSem(page: page, isFirstCall: isFirstCall,id: id);
    failureOrUser.fold(
      (l) {
        emit(CommentSemState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(CommentSemState.loaded(comments: r));
      },
    );
  }
}

@freezed
class CommentSemState with _$CommentSemState {
  const factory CommentSemState.initialState() = _InitialPage;

  const factory CommentSemState.loadingState() = _LoadingState;
  const factory CommentSemState.loadingMoreState() = _LoadingMoreState;

  const factory CommentSemState.loaded({
    required List<ResultHomeDTO> comments,
  }) = _LoadedState;

  const factory CommentSemState.errorState({
    required String message,
  }) = _ErrorState;
}
