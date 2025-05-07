import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'seminar_detail_cubit.freezed.dart';

@singleton
class SeminarDetailCubit extends Cubit<SeminarDetailState> {
  final HomeRepository _homeRepository;
  SeminarDetailCubit(
    this._homeRepository,
  ) : super(const SeminarDetailState.initial());
  late ResultHomeDTO res;
  Future<void> seminarDetail({
    required int id,
  }) async {
    emit(const SeminarDetailState.loading());
    final failureOrUser = await _homeRepository.seminarDetail(
      id: id,
    );
    failureOrUser.fold(
      (l) {
        emit(SeminarDetailState.loaded(res: res));
      },
      (r) {
        res = r;
        emit(SeminarDetailState.loaded(res: r));
      },
    );
  }

  Future<void> seminarLike({required int id}) async {
    //emit(const SeminarDetailState.loadingState());
    final failureOrUser = await _homeRepository.seminarLike(id: id);
    failureOrUser.fold(
      (l) {
        emit(SeminarDetailState.loaded(res: res));
      },
      (r) {
        res = res.copyWith(
            isLiked: !res.isLiked!,
            likesCount: res.isLiked! == false
                ? res.likesCount! + 1
                : res.likesCount! - 1);
        emit(SeminarDetailState.loaded(res: res));
        //seminarDetail(id: id);
      },
    );
  }

  Future<void> seminarFavorite({required int id}) async {
    final failureOrUser = await _homeRepository.seminarFavorite(id: id);
    failureOrUser.fold(
      (l) {
        emit(SeminarDetailState.loaded(res: res));
      },
      (r) {
        res = res.copyWith(isSaved: !res.isSaved!);
        emit(SeminarDetailState.loaded(res: res));
      },
    );
  }
}

@freezed
sealed class SeminarDetailState with _$SeminarDetailState {
  const factory SeminarDetailState.initial() = SeminarDetailInitialPage;
  const factory SeminarDetailState.loading() = SeminarDetailLoadingState;
  const factory SeminarDetailState.loaded({required ResultHomeDTO res}) =
      SeminarDetailLoadedState;
  const factory SeminarDetailState.error({
    required String message,
  }) = SeminarDetailErrorState;
}
