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
  ) : super(const PaymentTickState.initialState());

  Future<void> tusZhoruT({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
    bool? isPurchased,
  }) async {
    final failureOrUser = await _repository.tusZhoruBay(
        page: page,
        isFirstCall: false,
        search: search,
        isPurchased: isPurchased,
        isSaved: isSaved);
    failureOrUser.fold(
      (l) {
        emit(PaymentTickState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(PaymentTickState.loaded(
          res: r,
        ));
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
        ? emit(const PaymentTickState.loadingMoreState())
        : emit(const PaymentTickState.loadingState());
    final failureOrUser = await _homeRepository.seminar(
      search: search,
      isSaved: isSaved,
      page: page,
      isPurchased: isPurchased,
      isFirstCall: isFirstCall,
    );
    failureOrUser.fold(
      (l) {
        emit(PaymentTickState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(PaymentTickState.loaded(res: r));
      },
    );
  }
}

@freezed
class PaymentTickState with _$PaymentTickState {
  const factory PaymentTickState.initialState() = _InitialPage;

  const factory PaymentTickState.loadingState() = _LoadingState;
  const factory PaymentTickState.loadingMoreState() = _LoadingMoreState;

  const factory PaymentTickState.loaded({
    required List<ResultHomeDTO> res,
  }) = _LoadedState;

  const factory PaymentTickState.errorState({
    required String message,
  }) = _ErrorState;
}
