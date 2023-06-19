import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/faq_model_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'prj_info_cubit.freezed.dart';

@singleton
class PrjInfoCubit extends Cubit<PrjInfoState> {
  final HomeRepository _homeRepository;
  PrjInfoCubit(
    this._homeRepository,
  ) : super(const PrjInfoState.initialState());

  Future<void> prjInfo() async {
    final failureOrUser = await _homeRepository.projectInfo();
    failureOrUser.fold(
      (l) {
        emit(PrjInfoState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(PrjInfoState.loaded(res: r));
      },
    );
  }
}

@freezed
class PrjInfoState with _$PrjInfoState {
  const factory PrjInfoState.initialState() = _InitialPage;

  const factory PrjInfoState.loadingState() = _LoadingState;

  const factory PrjInfoState.loaded({
    required List<ResultHomeDTO> res,
  }) = _LoadedState;

  const factory PrjInfoState.errorState({
    required String message,
  }) = _ErrorState;
}
