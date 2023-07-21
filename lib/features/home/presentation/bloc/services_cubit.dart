import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'services_cubit.freezed.dart';

@singleton
class ServicesCubit extends Cubit<ServicesState> {
  final HomeRepository _homeRepository;
  ServicesCubit(
    this._homeRepository,
  ) : super(const ServicesState.initialState());

  Future<void> services({
    required int page,
    bool? isFirstCall,
  }) async {
    page > 1
        ? emit(const ServicesState.loadingMoreState())
        : emit(const ServicesState.loadingState());
    final failureOrUser =
        await _homeRepository.services(page: page, isFirstCall: isFirstCall);
    failureOrUser.fold(
      (l) {
        emit(ServicesState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(ServicesState.loaded(media: r.toSet().toList()));
      },
    );
  }
}

@freezed
class ServicesState with _$ServicesState {
  const factory ServicesState.initialState() = _InitialPage;

  const factory ServicesState.loadingState() = _LoadingState;
  const factory ServicesState.loadingMoreState() = _LoadingMoreState;

  const factory ServicesState.loaded({
    required List<MediaDTO> media,
  }) = _LoadedState;

  const factory ServicesState.errorState({
    required String message,
  }) = _ErrorState;
}
