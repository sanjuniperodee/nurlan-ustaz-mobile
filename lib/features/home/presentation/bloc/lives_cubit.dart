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
  ) : super(const LivesState.initialState());

  Future<void> lives({
    String? search,
    bool? isSaved,
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const LivesState.loadingMoreState())
        : emit(const LivesState.loadingState());
    final failureOrUser = await _homeRepository.lives(
        search: search, isSaved: isSaved, page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(LivesState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(LivesState.loaded(lives: r.toSet().toList()));
      },
    );
  }
}

@freezed
class LivesState with _$LivesState {
  const factory LivesState.initialState() = _InitialPage;

  const factory LivesState.loadingState() = _LoadingState;
  const factory LivesState.loadingMoreState() = _LoadingMoreState;

  const factory LivesState.loaded({
    required List<ResultHomeDTO> lives,
  }) = _LoadedState;

  const factory LivesState.errorState({
    required String message,
  }) = _ErrorState;
}
