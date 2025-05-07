import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/token_dto.dart';
import '../../data/repositories/auth_repository.dart';

part 'code_verification_cubit.freezed.dart';

@singleton
class CodeVerificationCubit extends Cubit<CodeVerificationState> {
  CodeVerificationCubit(
    this._authRepository,
  ) : super(const CodeVerificationState.initial());
  final AuthRepository _authRepository;

  Future<void> resendCode(String email) async {
    final result = await _authRepository.resendActivation(email: email);
    result.fold((l) {
      emit(CodeVerificationState.error(message: mapFailureToMessageBack(l)));
    }, (r) async {});
  }

  Future<void> sendCode(
      String? code, int userId, TokenCreateDTO tokenCreateDTO) async {
    emit(const CodeVerificationState.loading());

    final result = await _authRepository.activateUser(
        activateUserDTO: ActivateUserDTO(userId: userId, code: code));
    result.fold((l) {
      emit(CodeVerificationState.error(message: mapFailureToMessageBack(l)));
      emit(const CodeVerificationState.initial());
    }, (r) async {
      final result =
          await _authRepository.createJTW(createTokenDTO: tokenCreateDTO);
      result.fold(
        (l) {
          emit(
              CodeVerificationState.error(message: mapFailureToMessageBack(l)));
          emit(CodeVerificationState.initial());
        },
        (r) {
          emit(const CodeVerificationState.loaded());
        },
      );
    });
  }
}

@freezed
sealed class CodeVerificationState with _$CodeVerificationState {
  const factory CodeVerificationState.initial() = CodeVerificationInitialState;
  const factory CodeVerificationState.loaded() = CodeVerificationLoadedState;
  const factory CodeVerificationState.loading() = CodeVerificationLoadingState;
  const factory CodeVerificationState.error({
    required String message,
  }) = CodeVerificationErrorState;
}
