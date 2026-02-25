import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';

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
      if (r.pgRedirectUrl != null && r.pgRedirectUrl!.isNotEmpty) {
        final Uri url = Uri.parse(r.pgRedirectUrl!);
        // On web, launchUrl after async gap can trigger engine assertion;
        // defer to next frame and use platformDefault to avoid window assertion.
        void doLaunch() async {
          try {
            if (kIsWeb) {
              await launchUrl(url, mode: LaunchMode.platformDefault);
            } else {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            }
          } catch (_) {
            // Ignore launch errors (e.g. popup blocked)
          }
        }
        SchedulerBinding.instance.addPostFrameCallback((_) => doLaunch());
      }
      emit(CreateSeminarPaymentState.successPay());
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
