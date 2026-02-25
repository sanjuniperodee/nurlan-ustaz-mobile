import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'lives_fav_cubit.freezed.dart';

@singleton
class LivesFavCubit extends Cubit<LivesFavState> {
  final HomeRepository _homeRepository;
  LivesFavCubit(
    this._homeRepository,
  ) : super(const LivesFavState.initialState());

  Future<void> livesFav({required int id}) async {
    final failureOrUser = await _homeRepository.livesFavorite(id: id);
    failureOrUser.fold(
      (l) {
        emit(LivesFavState.errorState(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(const LivesFavState.loaded());
      },
    );
  }
}

@freezed
class LivesFavState with _$LivesFavState {
  const factory LivesFavState.initialState() = _InitialPage;

  const factory LivesFavState.loadingState() = _LoadingState;

  const factory LivesFavState.loaded() = _LoadedState;

  const factory LivesFavState.errorState({
    required String message,
  }) = _ErrorState;
}
