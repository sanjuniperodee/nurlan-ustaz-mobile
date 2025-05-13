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
  ) : super(const TusZhoruDetailsState.initial());

  late List<TusZhoruDTO> tosZhoruList;
  late List<TusZhoruDTO> customTusZhoruList;
  late TusZhoruDTO tusZhoru;

  Future<TusZhoruDTO?> likeTusZhoru(int id) async {
    final result = await _repository.tusZhoruFavorite(id: id);
    return result.fold((l) {
      return null;
    }, (r) {
      tusZhoru = tusZhoru.copyWith(isSaved: !(tusZhoru.isSaved!));
      emit(TusZhoruDetailsState.loaded(tusZhoru));
      return null;
    });
  }

  Future<TusZhoruDTO?> getTusZhoruById(int id) async {
    emit(const TusZhoruDetailsState.loading());

    final result = await _repository.getTusZhoruById(id: id);
    return result.fold((l) {
      return null;
    }, (r) {
      tusZhoru = r;
      emit(TusZhoruDetailsState.loaded(r));
      return null;
    });
  }
}

@freezed
sealed class TusZhoruDetailsState with _$TusZhoruDetailsState {
  const factory TusZhoruDetailsState.initial({
    @Default([]) List<TusZhoruDTO> tusZhoruList,
    @Default([]) List<TusZhoruDTO> customTusZhoru,
    @Default(0) int currentIndex,
  }) = TusZhoruDetailsInitialPage;
  const factory TusZhoruDetailsState.loading() = TusZhoruDetailsLoadingState;
  const factory TusZhoruDetailsState.loaded(
    final TusZhoruDTO? tusZhoru,
  ) = TusZhoruDetailsLoadedState;
  const factory TusZhoruDetailsState.error({
    required String message,
  }) = TusZhoruDetailsErrorState;
}
