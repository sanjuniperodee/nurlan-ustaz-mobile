import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

part 'change_pass_cubit.freezed.dart';

@singleton
class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(
    this.authRepository,
  ) : super(const ChangePassState.initial());

  final AuthRepository authRepository;

  Future<void> changePass({
    required String curPass,
    required String newPass,
    required String pass,
  }) async {
    final result = await authRepository.changePass(
      curPass: curPass,
      newPass: newPass,
      pass: pass,
    );
    result.fold(
      (l) {
        emit(ChangePassState.error(message: mapFailureToMessage(l)));
        emit(const ChangePassState.initial());
      },
      (_) => emit(ChangePassState.loaded(status: true)),
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
