import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'faq_cubit.freezed.dart';

@singleton
class FaqCubit extends Cubit<FaqState> {
  final HomeRepository _homeRepository;
  FaqCubit(
    this._homeRepository,
  ) : super(const FaqState.initialState());

  Future<void> faq() async {
    final failureOrUser = await _homeRepository.faq();
    failureOrUser.fold(
      (l) {
        emit(FaqState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(FaqState.loaded(faq: r));
      },
    );
  }
}

@freezed
class FaqState with _$FaqState {
  const factory FaqState.initialState() = _InitialPage;

  const factory FaqState.loadingState() = _LoadingState;

  const factory FaqState.loaded({
    required List<FaqModelDTO> faq,
  }) = _LoadedState;

  const factory FaqState.errorState({
    required String message,
  }) = _ErrorState;
}
