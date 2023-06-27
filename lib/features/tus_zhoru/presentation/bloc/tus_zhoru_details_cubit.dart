import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart';

import '../../data/models/tus_zhoru_dto.dart';

part 'tus_zhoru_details_cubit.freezed.dart';

@singleton
class TusZhoruDetailsCubit extends Cubit<TusZhoruDetailsState> {
  final TusZhoruRepository _repository;

  TusZhoruDetailsCubit(
      this._repository,
      ) : super(const TusZhoruDetailsState.initialState());

  late List<TusZhoruDTO> tosZhoruList;
  late List<TusZhoruDTO> customTusZhoruList;




  Future<TusZhoruDTO?> getTusZhoruById(int id) async {
    emit(_LoadingState());

    final result = await _repository.getTusZhoruById(id: id);
    return result.fold((l) {
      return null;
    }, (r) {
      emit( _LoadedState(r));
    });
  }




}

@freezed
class TusZhoruDetailsState with _$TusZhoruDetailsState {
  const factory TusZhoruDetailsState.initialState({
    @Default([]) List<TusZhoruDTO> tusZhoruList,
    @Default([]) List<TusZhoruDTO> customTusZhoru,
    @Default(0) int currentIndex,
  }) = _InitialPage;

  const factory TusZhoruDetailsState.loadingState() = _LoadingState;

  const factory TusZhoruDetailsState.loaded(
      final TusZhoruDTO? tusZhoru,
      ) = _LoadedState;

  const factory TusZhoruDetailsState.errorState({
    required String message,
  }) = _ErrorState;
}
