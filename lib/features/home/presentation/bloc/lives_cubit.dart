import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'lives_cubit.freezed.dart';

@singleton
class LivesCubit extends Cubit<LivesState> {
  final HomeRepository _homeRepository;
  LivesCubit(
    this._homeRepository,
  ) : super(const LivesState.initial());

  Future<void> lives({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const LivesState.loadingMore())
        : emit(const LivesState.loading());
    final failureOrUser = await _homeRepository.lives(
        search: search, isSaved: isSaved, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(LivesState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(LivesState.loaded(lives: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class LivesState with _$LivesState {
  const factory LivesState.initial() = LivesInitialPage;
  const factory LivesState.loading() = LivesLoadingState;
  const factory LivesState.loadingMore() = LivesLoadingMoreState;
  const factory LivesState.loaded({
    required List<ResultHomeDTO> lives,
  }) = LivesLoadedState;
  const factory LivesState.error({
    required String message,
  }) = LivesErrorState;
}
