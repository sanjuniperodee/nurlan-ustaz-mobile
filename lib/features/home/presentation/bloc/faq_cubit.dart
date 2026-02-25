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
  ) : super(const FaqState.initial());

  Future<void> faq() async {
    final failureOrUser = await _homeRepository.faq();
    failureOrUser.fold(
      (l) {
        emit(FaqState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(FaqState.loaded(faq: r));
      },
    );
  }
}

@freezed
class FaqState with _$FaqState {
  const factory FaqState.initial() = FaqInitialPage;
  const factory FaqState.loading() = FaqLoadingState;
  const factory FaqState.loaded({
    required List<FaqModelDTO> faq,
  }) = FaqLoadedState;
  const factory FaqState.error({
    required String message,
  }) = FaqErrorState;
}
