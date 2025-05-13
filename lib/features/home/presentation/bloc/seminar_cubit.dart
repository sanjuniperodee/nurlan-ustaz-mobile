
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'seminar_cubit.freezed.dart';

@singleton
class SeminarCubit extends Cubit<SeminarState> {
  final HomeRepository _homeRepository;
  SeminarCubit(
    this._homeRepository,
  ) : super(const SeminarState.initial());

  Future<void> seminar({
    String? search,
    bool? isSaved,
    required int page,
    bool? isPurchased,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const SeminarState.loadingMore())
        : emit(const SeminarState.loading());
    final failureOrUser = await _homeRepository.seminar(
      search: search,
      isSaved: isSaved,
      page: page,
      isPurchased: isPurchased,
      isFirstCall: isFirstCall,
    );
    failureOrUser.fold(
      (l) {
        emit(SeminarState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(SeminarState.loaded(news: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class SeminarState with _$SeminarState {
  const factory SeminarState.initial() = SeminarInitialPage;
  const factory SeminarState.loading() = SeminarLoadingState;
  const factory SeminarState.loadingMore() = SeminarLoadingMoreState;
  const factory SeminarState.loaded({
    required List<ResultHomeDTO> news,
  }) = SeminarLoadedState;
  const factory SeminarState.error({
    required String message,
  }) = SeminarErrorState;
}
