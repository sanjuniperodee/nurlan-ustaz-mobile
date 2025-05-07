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
  ) : super(const PrjInfoState.initial());

  Future<void> prjInfo() async {
    final failureOrUser = await _homeRepository.projectInfo();
    failureOrUser.fold(
      (l) {
        emit(PrjInfoState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(PrjInfoState.loaded(res: r));
      },
    );
  }
}

@freezed
sealed class PrjInfoState with _$PrjInfoState {
  const factory PrjInfoState.initial() = PrjInfoInitialPage;

  const factory PrjInfoState.loading() = PrjInfoLoadingState;

  const factory PrjInfoState.loaded({
    required List<ResultHomeDTO> res,
  }) = PrjInfoLoadedState;

  const factory PrjInfoState.error({
    required String message,
  }) = PrjInfoErrorState;
}
