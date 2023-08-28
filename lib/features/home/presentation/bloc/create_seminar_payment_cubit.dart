import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app_dinamic_link.dart';

part 'create_seminar_payment_cubit.freezed.dart';

@singleton
class CreateSeminarPaymentCubit extends Cubit<CreateSeminarPaymentState> {
  final HomeRepository _repository;

  CreateSeminarPaymentCubit(
    this._repository,
  ) : super(const CreateSeminarPaymentState.initialState());

  Future<void> createSeminarPayment(
    int id,
    BuildContext context,
  ) async {
    emit(_LoadingState());
    String tusZhoruDynamicLink = await DynamicLink().createSeminarLink(id);
    final result = await _repository.createSeminarPayment(
        id: id, backUrl: tusZhoruDynamicLink);
    result.fold((l) {
      emit(_ErrorState(message: mapFailureToMessageBack(l)));
    }, (r) async {
      final Uri url = Uri.parse(r.pgRedirectUrl.toString());
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch');
      }
    });
  }
}

@freezed
class CreateSeminarPaymentState with _$CreateSeminarPaymentState {
  const factory CreateSeminarPaymentState.initialState() = _InitialPage;

  const factory CreateSeminarPaymentState.loadingState() = _LoadingState;

  const factory CreateSeminarPaymentState.loaded() = _LoadedState;

  const factory CreateSeminarPaymentState.errorState({
    required String message,
  }) = _ErrorState;
}
