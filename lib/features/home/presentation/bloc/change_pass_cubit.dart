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
  ) : super(const ChangePassState.initialState());

  Future<void> changePass(
      {required String curPass,
      required String newPass,
      required String pass}) async {
    final failureOrUser = await _authRepository.newPass(
        curPass: curPass, newPass: newPass, pass: pass);
    failureOrUser.fold(
      (l) {
        emit(ChangePassState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(ChangePassState.loaded(status: r));
      },
    );
  }
}

@freezed
class ChangePassState with _$ChangePassState {
  const factory ChangePassState.initialState() = _InitialPage;

  const factory ChangePassState.loadingState() = _LoadingState;

  const factory ChangePassState.loaded({required bool status}) = _LoadedState;

  const factory ChangePassState.errorState({
    required String message,
  }) = _ErrorState;
}
