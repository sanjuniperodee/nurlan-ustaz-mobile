
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

import '../../../app/app_dinamic_link.dart';

part 'create_seminar_payment_cubit.freezed.dart';

@singleton
class CreateSeminarPaymentCubit extends Cubit<CreateSeminarPaymentState> {
  final HomeRepository _repository;

  CreateSeminarPaymentCubit(
    this._repository,
  ) : super(const CreateSeminarPaymentState.initial());

  Future<void> createSeminarPayment(
    int id,
    BuildContext context,
  ) async {
    emit(CreateSeminarPaymentState.loading());
    String tusZhoruDynamicLink = await DynamicLink().createSeminarLink(id);
    final result = await _repository.createSeminarPayment(
        id: id, backUrl: tusZhoruDynamicLink);
    result.fold((l) {
      try {
        emit(CreateSeminarPaymentState.error(message: mapFailureToMessage(l)));
      } catch (e) {
        emit(CreateSeminarPaymentState.error(message: l.toString()));
      }
    }, (r) async {
      emit(CreateSeminarPaymentState.successPay());

      // final Uri url = Uri.parse(r.pgRedirectUrl.toString());
      // if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      //   throw Exception('Could not launch');
      // }
    });
  }
}

@freezed
sealed class CreateSeminarPaymentState with _$CreateSeminarPaymentState {
  const factory CreateSeminarPaymentState.initial() =
      CreateSeminarPaymentInitialPage;
  const factory CreateSeminarPaymentState.loading() =
      CreateSeminarPaymentLoadingState;
  const factory CreateSeminarPaymentState.loaded() =
      CreateSeminarPaymentLoadedState;
  const factory CreateSeminarPaymentState.error({
    required String message,
  }) = CreateSeminarPaymentErrorState;
  const factory CreateSeminarPaymentState.successPay() =
      CreateSeminarPaymentSuccessPay;
}
