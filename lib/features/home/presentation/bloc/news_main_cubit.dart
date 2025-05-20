import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/core/services/notification_service.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'news_main_cubit.freezed.dart';

@singleton
class NewsMainCubit extends Cubit<NewsMainState> {
  final HomeRepository _homeRepository;
  NewsMainCubit(
    this._homeRepository,
  ) : super(const NewsMainState.initial());

  Future<void> newsMain({
    bool? isSaved,
    int? currentPage,
  }) async {
    final failureOrUser = await _homeRepository.newsMain(
        isSaved: isSaved, currentPage: currentPage);
    failureOrUser.fold(
      (l) {
        emit(NewsMainState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NewsMainState.loaded(res: r));
      },
    );
  }
}

@freezed
sealed class NewsMainState with _$NewsMainState {
  const factory NewsMainState.initial() = NewsMainInitialPage;
  const factory NewsMainState.loading() = NewsMainLoadingState;
  const factory NewsMainState.loaded({
    required List<ResultHomeDTO> res,
  }) = NewsMainLoadedState;
  const factory NewsMainState.error({
    required String message,
  }) = NewsMainErrorState;
}
