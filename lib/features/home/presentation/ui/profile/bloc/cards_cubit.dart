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
  ) : super(const CardsState.initial());

  Future<void> getCardList() async {
    emit(const CardsState.loading());
    await homeRepo.getCards().then((value) {
      value.fold((l) {
        emit(CardsState.error(message: mapFailureToMessage(l)));
        emit(const CardsState.loaded(cards: []));
      }, (r) {
        emit(CardsState.loaded(cards: r.toList()));
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
    emit(const CardsState.loading());
    await homeRepo.setDefaultCard(cardId: cardId).whenComplete(() async {
      await homeRepo.getCards().then((value) {
        value.fold((l) {
          emit(CardsState.error(message: mapFailureToMessage(l)));
          emit(const CardsState.loaded(cards: []));
        }, (r) {
          emit(CardsState.loaded(cards: r.toList()));
        });
      });
    });
  }

  Future<void> removeCard({required int cardId}) async {
    emit(const CardsState.loading());
    await homeRepo.removeCard(cardId: cardId).then((value) {
      value.fold((l) {
        emit(CardsState.error(message: mapFailureToMessage(l)));
        homeRepo.getCards().then((v) {
          v.fold((_) {}, (r) => emit(CardsState.loaded(cards: r.toList())));
        });
      }, (_) {
        homeRepo.getCards().then((v) {
          v.fold((l) {
            emit(CardsState.error(message: mapFailureToMessage(l)));
            emit(const CardsState.loaded(cards: []));
          }, (r) {
            emit(CardsState.loaded(cards: r.toList()));
          });
        });
      });
    });
  }
}

@freezed
sealed class CardsState with _$CardsState {
  const factory CardsState.initial() = CardsInitialPage;
  const factory CardsState.loading() = CardsLoadingState;
  const factory CardsState.loaded({
    required List<CardDTO> cards,
  }) = CardsLoadedState;
  const factory CardsState.error({
    required String message,
  }) = CardsErrorState;
}
