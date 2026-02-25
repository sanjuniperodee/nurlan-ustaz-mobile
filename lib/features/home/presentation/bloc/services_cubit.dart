import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'services_cubit.freezed.dart';

@singleton
class ServicesCubit extends Cubit<ServicesState> {
  final HomeRepository _homeRepository;
  ServicesCubit(
    this._homeRepository,
  ) : super(const ServicesState.initial());

  Future<void> services({
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const ServicesState.loadingMore())
        : emit(const ServicesState.loading());
    final failureOrUser =
        await _homeRepository.services(page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(ServicesState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(ServicesState.loaded(media: r.toSet().toList()));
      },
    );
  }
}

@freezed
sealed class ServicesState with _$ServicesState {
  const factory ServicesState.initial() = ServicesInitialPage;
  const factory ServicesState.loading() = ServicesLoadingState;
  const factory ServicesState.loadingMore() = ServicesLoadingMoreState;
  const factory ServicesState.loaded({
    required List<MediaDTO> media,
  }) = ServicesLoadedState;
  const factory ServicesState.error({
    required String message,
  }) = ServicesErrorState;
}
