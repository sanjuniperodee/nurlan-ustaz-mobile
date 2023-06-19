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
  ) : super(const CharitiesState.initialState());

  Future<void> charities({
    required int page,
     bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const CharitiesState.loadingMoreState())
        : emit(const CharitiesState.loadingState());
    final failureOrUser = await _homeRepository.charities(page: page,isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(CharitiesState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(CharitiesState.loaded(charities: r));
      },
    );
  }
}

@freezed
class CharitiesState with _$CharitiesState {
  const factory CharitiesState.initialState() = _InitialPage;

  const factory CharitiesState.loadingState() = _LoadingState;
  const factory CharitiesState.loadingMoreState() = _LoadingMoreState;

  const factory CharitiesState.loaded({
    required List<ResultHomeDTO> charities,
  }) = _LoadedState;

  const factory CharitiesState.errorState({
    required String message,
  }) = _ErrorState;
}
