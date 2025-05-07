import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';

import '../../../auth/data/repositories/auth_repository.dart';

part 'change_pass_cubit.freezed.dart';

@singleton
class ChangePassCubit extends Cubit<ChangePassState> {
  final AuthRepository _authRepository;
  ChangePassCubit(
    this._authRepository,
  ) : super(const ChangePassState.initial());

  Future<void> changePass(
      {required String curPass,
      required String newPass,
      required String pass}) async {
    final failureOrUser = await _authRepository.newPass(
        curPass: curPass, newPass: newPass, pass: pass);
    failureOrUser.fold(
      (l) {
        emit(ChangePassState.error(message: mapFailureToMessageBack(l)));
        emit(ChangePassState.initial());
      },
      (r) {
        emit(ChangePassState.loaded(status: r));
      },
    );
  }
}

@freezed
sealed class ChangePassState with _$ChangePassState {
  const factory ChangePassState.initial() = ChangePassInitialPage;
  const factory ChangePassState.loading() = ChangePassLoadingState;
  const factory ChangePassState.loaded({required bool status}) =
      ChangePassLoadedState;
  const factory ChangePassState.error({
    required String message,
  }) = ChangePassErrorState;
}
