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
  ) : super(const NewsMainState.initialState());

  Future<void> newsMain({
    bool? isSaved,
    int? currentPage,
  }) async {
    final deviceToken = await NotificationService().getDeviceToken();
    print('DEVICE TOKEN----${deviceToken}');

    final failureOrUser = await _homeRepository.newsMain(
        isSaved: isSaved, currentPage: currentPage);
    failureOrUser.fold(
      (l) {
        emit(NewsMainState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(NewsMainState.loaded(res: r));
      },
    );
  }
}

@freezed
class NewsMainState with _$NewsMainState {
  const factory NewsMainState.initialState() = _InitialPage;

  const factory NewsMainState.loadingState() = _LoadingState;

  const factory NewsMainState.loaded({
    required List<ResultHomeDTO> res,
  }) = _LoadedState;

  const factory NewsMainState.errorState({
    required String message,
  }) = _ErrorState;
}
