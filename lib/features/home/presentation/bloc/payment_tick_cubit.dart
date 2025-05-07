import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/models/tus_zhoru_dto.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart';

part 'payment_tick_cubit.freezed.dart';

@singleton
class PaymentTickCubit extends Cubit<PaymentTickState> {
  final HomeRepository _homeRepository;
  final TusZhoruRepository _repository;

  PaymentTickCubit(
    this._homeRepository,
    this._repository,
  ) : super(const PaymentTickState.initial());

  late List<TusZhoruDTO> listTus = [];
  late List<ResultHomeDTO> listHome = [];

  Future<void> tusZhoruT({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
    bool? isPurchased,
  }) async {
    emit(const PaymentTickState.loading());
    final failureOrUser = await _repository.tusZhoru(
        page: page,
        isFirstCall: true,
        search: search,
        isPurchased: isPurchased,
        isSaved: isSaved);

    failureOrUser.fold(
      (l) {
        emit(PaymentTickState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        listTus =
            r.toList().where((element) => element.isPurchased == true).toList();
        emit(PaymentTickState.loaded(
          res: listHome,
          res2: listTus,
        ));
      },
    );
  }

  Future<void> getCustomTusZhoruT({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    emit(const PaymentTickState.loading());
    final result = await _repository.customTusZhoru(
        page: 1, isFirstCall: true, search: search);
    result.fold(
      (l) {
        emit(PaymentTickState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        final purchasedList =
            r.toList().where((element) => element.isPaid == true).toList();

        emit(PaymentTickState.loaded(res: listHome, res2: purchasedList));
      },
    );
  }

  Future<void> seminar({
    String? search,
    bool? isSaved,
    required int page,
    bool? isPurchased,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const PaymentTickState.loadingMore())
        : emit(const PaymentTickState.loading());
    final failureOrUser = await _homeRepository.seminar(
      search: search,
      isSaved: isSaved,
      page: page,
      isPurchased: isPurchased,
      isFirstCall: isFirstCall,
    );
    failureOrUser.fold(
      (l) {
        emit(PaymentTickState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        listHome = r;
        emit(PaymentTickState.loaded(res: listHome, res2: listTus));
      },
    );
  }
}

@freezed
sealed class PaymentTickState with _$PaymentTickState {
  const factory PaymentTickState.initial() = PaymentTickInitialPage;
  const factory PaymentTickState.loading() = PaymentTickLoadingState;
  const factory PaymentTickState.loadingMore() = PaymentTickLoadingMoreState;
  const factory PaymentTickState.loaded({
    required List<ResultHomeDTO> res,
    required List<TusZhoruDTO> res2,
  }) = PaymentTickLoadedState;

  const factory PaymentTickState.error({
    required String message,
  }) = PaymentTickErrorState;
}
