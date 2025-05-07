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
  ) : super(const CustomTusZhoruDetailsState.initial());

  late List<TusZhoruDTO> tosZhoruList;
  late List<TusZhoruDTO> customTusZhoruList;

  Future<TusZhoruDTO?> getCustomTusZhoruById(int id) async {
    emit(const CustomTusZhoruDetailsState.loading());
    final result = await _repository.getCustomTusZhoru(id: id);
    return result.fold((l) {
      return null;
    }, (r) {
      emit(CustomTusZhoruDetailsState.loaded(r));
      return r;
    });
  }
}

@freezed
sealed class CustomTusZhoruDetailsState with _$CustomTusZhoruDetailsState {
  const factory CustomTusZhoruDetailsState.initial({
    @Default([]) List<TusZhoruDTO> tusZhoruList,
    @Default([]) List<TusZhoruDTO> customTusZhoru,
    @Default(0) int currentIndex,
  }) = CustomTusZhoruDetailsInitialPage;
  const factory CustomTusZhoruDetailsState.loading() =
      CustomTusZhoruDetailsLoadingState;
  const factory CustomTusZhoruDetailsState.loaded(
    final TusZhoruDTO? tusZhoru,
  ) = CustomTusZhoruDetailsLoadedState;
  const factory CustomTusZhoruDetailsState.error({
    required String message,
  }) = CustomTusZhoruDetailsErrorState;
}
