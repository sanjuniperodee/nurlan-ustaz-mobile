import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'cards_cubit.freezed.dart';

@singleton
class CardsCubit extends Cubit<CardsState> {
  final HomeRepository homeRepo;
  CardsCubit(
    this.homeRepo,
  ) : super(const CardsState.initialState());

  Future<void> getCardList() async {
    emit(const _LoadingState());
    await homeRepo.getCards().then((value) {
      value.fold((l) {
        emit(_ErrorState(message: mapFailureToMessage(l)));
        emit(const _LoadedState(cards: []));
      }, (r) {
        emit(_LoadedState(cards: r.toList()));
      });
    });
  }

  Future<String?> getAddCardUrl() async {
    try {
      final result = await homeRepo.getAddCArdUrl();
      return result.fold((left) => null, (right) {
        return right;
      });
    } catch (e) {
      return null;
    }
  }

  Future<void> setDefaultCard({required int cardId}) async {
    emit(const _LoadingState());
    await homeRepo.setDefaultCard(cardId: cardId).whenComplete(() async {
       await homeRepo.getCards().then((value) {
      value.fold((l) {
        emit(_ErrorState(message: mapFailureToMessage(l)));
        emit(const _LoadedState(cards: []));
      }, (r) {
        emit(_LoadedState(cards: r.toList()));
      });
    });
    });
   
  }
}

@freezed
class CardsState with _$CardsState {
  const factory CardsState.initialState() = _InitialPage;

  const factory CardsState.loadingState() = _LoadingState;

  const factory CardsState.loaded({
    required List<CardDTO> cards,
  }) = _LoadedState;

  const factory CardsState.errorState({
    required String message,
  }) = _ErrorState;
}
