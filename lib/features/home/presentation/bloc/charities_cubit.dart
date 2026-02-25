import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'charities_cubit.freezed.dart';

@singleton
class CharitiesCubit extends Cubit<CharitiesState> {
  final HomeRepository _homeRepository;
  CharitiesCubit(
    this._homeRepository,
  ) : super(const CharitiesState.initial());

  Future<void> charities({
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const CharitiesState.loadingMore())
        : emit(const CharitiesState.loading());
    final failureOrUser =
        await _homeRepository.charities(page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(CharitiesState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(CharitiesState.loaded(charities: r));
      },
    );
  }
}

@freezed
sealed class CharitiesState with _$CharitiesState {
  const factory CharitiesState.initial() = CharitiesInitialPage;
  const factory CharitiesState.loading() = CharitiesLoadingState;
  const factory CharitiesState.loadingMore() = CharitiesLoadingMoreState;
  const factory CharitiesState.loaded({
    required List<ResultHomeDTO> charities,
  }) = CharitiesLoadedState;
  const factory CharitiesState.error({
    required String message,
  }) = CharitiesErrorState;
}
