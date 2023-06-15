import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'seminar_detail_cubit.freezed.dart';

@singleton
class SeminarDetailCubit extends Cubit<SeminarDetailState> {
  final HomeRepository _homeRepository;
  SeminarDetailCubit(
    this._homeRepository,
  ) : super(const SeminarDetailState.initialState());

  Future<void> seminarDetail({
    required int id,
  }) async {
    final failureOrUser = await _homeRepository.seminarDetail(
      id: id,
    );
    failureOrUser.fold(
      (l) {
        emit(
            SeminarDetailState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(SeminarDetailState.loaded(res: r));
      },
    );
  }
}

@freezed
class SeminarDetailState with _$SeminarDetailState {
  const factory SeminarDetailState.initialState() = _InitialPage;

  const factory SeminarDetailState.loadingState() = _LoadingState;

  const factory SeminarDetailState.loaded({required ResultHomeDTO res}) =
      _LoadedState;

  const factory SeminarDetailState.errorState({
    required String message,
  }) = _ErrorState;
}
