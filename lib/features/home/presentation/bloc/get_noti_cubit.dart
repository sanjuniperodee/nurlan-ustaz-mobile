import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/get_noti_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'get_noti_cubit.freezed.dart';

@singleton
class GetNotiCubit extends Cubit<GetNotiState> {
  final HomeRepository _homeRepository;
  GetNotiCubit(
    this._homeRepository,
  ) : super(const GetNotiState.initialState());

  Future<void> getNoti() async {
    emit(const GetNotiState.loadingState());
    final failureOrUser = await _homeRepository.getNotifications();
    failureOrUser.fold(
      (l) {
        emit(GetNotiState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(GetNotiState.loaded(res: r));
      },
    );
  }
}

@freezed
class GetNotiState with _$GetNotiState {
  const factory GetNotiState.initialState() = _InitialPage;

  const factory GetNotiState.loadingState() = _LoadingState;

  const factory GetNotiState.loaded({
    required GetNotiDTO res,
  }) = _LoadedState;

  const factory GetNotiState.errorState({
    required String message,
  }) = _ErrorState;
}
