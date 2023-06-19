import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/repositories/Islam_teaching_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'news_fav_cubit.freezed.dart';

@singleton
class NewsFavCubit extends Cubit<NewsFavState> {
  final HomeRepository _homeRepository;
  NewsFavCubit(
    this._homeRepository,
  ) : super(const NewsFavState.initialState());

  Future<void> newsFav({required int id}) async {
    final failureOrUser = await _homeRepository.newsFavorite(id: id);
    failureOrUser.fold(
      (l) {
        emit(NewsFavState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const NewsFavState.loaded());
      },
    );
  }
}

@freezed
class NewsFavState with _$NewsFavState {
  const factory NewsFavState.initialState() = _InitialPage;

  const factory NewsFavState.loadingState() = _LoadingState;

  const factory NewsFavState.loaded() = _LoadedState;

  const factory NewsFavState.errorState({
    required String message,
  }) = _ErrorState;
}
