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
  ) : super(const GetNotiState.initial());

  Future<void> getNoti() async {
    emit(const GetNotiState.loading());
    final failureOrUser = await _homeRepository.getNotifications();
    failureOrUser.fold(
      (l) {
        emit(GetNotiState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(GetNotiState.loaded(res: r));
      },
    );
  }
}

@freezed
sealed class GetNotiState with _$GetNotiState {
  const factory GetNotiState.initial() = GetNotiInitialPage;
  const factory GetNotiState.loading() = GetNotiLoadingState;
  const factory GetNotiState.loaded({
    required GetNotiDTO res,
  }) = GetNotiLoadedState;
  const factory GetNotiState.error({
    required String message,
  }) = GetNotiErrorState;
}
