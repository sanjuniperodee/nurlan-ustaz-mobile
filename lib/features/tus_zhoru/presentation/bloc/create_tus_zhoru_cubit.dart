import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart';

import '../../../app/app_dinamic_link.dart';
import '../../data/models/tus_zhoru_dto.dart';

part 'create_tus_zhoru_cubit.freezed.dart';

@singleton
class CreateTusZhoruCubit extends Cubit<CreateTusZhoruState> {
  final TusZhoruRepository _repository;

  CreateTusZhoruCubit(
    this._repository,
  ) : super(const CreateTusZhoruState.initial());

  late List<TusZhoruDTO> tosZhoruList;

  Future<void> createCustomTusZhoruPayment(int id, bool isCustom) async {
    emit(const CreateTusZhoruState.loading());

    String tusZhoruDynamicLink = isCustom
        ? await DynamicLink().createCustomTusZhoruLink(id)
        : await DynamicLink().createTusZhoruLink(id);

    log(tusZhoruDynamicLink);
    final result = isCustom
        ? await _repository.createCustomTusZhoruPayment(
            id: id,
          )
        : await _repository.createTusZhoruPayment(
            id: id, backUrl: tusZhoruDynamicLink);
    result.fold((l) {
      emit(CreateTusZhoruState.error(message: mapFailureToMessage(l)));
    }, (r) {
      emit(const CreateTusZhoruState.success(message: ''));
    });
  }

  Future<void> createTusZhoru(String title, String description) async {
    final result = await _repository.createTusZhoru(
        title: title, description: description);
    return result.fold((l) => {}, (r) {
      emit(CreateTusZhoruState.loaded(tusZhoru: r));
    });
  }
}

@freezed
sealed class CreateTusZhoruState with _$CreateTusZhoruState {
  const factory CreateTusZhoruState.initial() = CreateTusZhoruInitialState;
  const factory CreateTusZhoruState.loading() = CreateTusZhoruLoadingState;
  const factory CreateTusZhoruState.loaded({
    required TusZhoruDTO tusZhoru,
  }) = CreateTusZhoruLoadedState;

  const factory CreateTusZhoruState.error({
    required String message,
  }) = CreateTusZhoruErrorState;
  const factory CreateTusZhoruState.success({
    required String message,
  }) = CreateTusZhoruSuccessState;
}
