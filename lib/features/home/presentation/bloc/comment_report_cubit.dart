import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'comment_report_cubit.freezed.dart';

@singleton
class CommentReportCubit extends Cubit<CommentReportState> {
  final HomeRepository _homeRepository;
  CommentReportCubit(
    this._homeRepository,
  ) : super(const CommentReportState.initialState());

  Future<void> commentReport({required int id, required String reason}) async {
    final failureOrUser =
        await _homeRepository.commentReport(id: id, reason: reason);
    failureOrUser.fold(
      (l) {
        emit(
            CommentReportState.errorState(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const CommentReportState.loaded());
      },
    );
  }
}

@freezed
class CommentReportState with _$CommentReportState {
  const factory CommentReportState.initialState() = _InitialPage;

  const factory CommentReportState.loadingState() = _LoadingState;

  const factory CommentReportState.loaded() = _LoadedState;

  const factory CommentReportState.errorState({
    required String message,
  }) = _ErrorState;
}
