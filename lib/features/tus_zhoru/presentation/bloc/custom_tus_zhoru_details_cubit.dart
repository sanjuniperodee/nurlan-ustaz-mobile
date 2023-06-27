import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart';

import '../../data/models/tus_zhoru_dto.dart';

part 'custom_tus_zhoru_details_cubit.freezed.dart';

@singleton
class CustomTusZhoruDetailsCubit extends Cubit<CustomTusZhoruDetailsState> {
  final TusZhoruRepository _repository;

  CustomTusZhoruDetailsCubit(
      this._repository,
      ) : super(const CustomTusZhoruDetailsState.initialState());

  late List<TusZhoruDTO> tosZhoruList;
  late List<TusZhoruDTO> customTusZhoruList;




  Future<TusZhoruDTO?> getCustomTusZhoruById(int id) async {
    emit(_LoadingState());
    final result = await _repository.getCustomTusZhoru(id: id);
    return result.fold((l) {
      return null;
    }, (r) {
      emit(_LoadedState(r));
      return r;
    });
  }




}

@freezed
class CustomTusZhoruDetailsState with _$CustomTusZhoruDetailsState {
  const factory CustomTusZhoruDetailsState.initialState({
    @Default([]) List<TusZhoruDTO> tusZhoruList,
    @Default([]) List<TusZhoruDTO> customTusZhoru,
    @Default(0) int currentIndex,
  }) = _InitialPage;

  const factory CustomTusZhoruDetailsState.loadingState() = _LoadingState;

  const factory CustomTusZhoruDetailsState.loaded(
      final TusZhoruDTO? tusZhoru,
      ) = _LoadedState;

  const factory CustomTusZhoruDetailsState.errorState({
    required String message,
  }) = _ErrorState;
}
