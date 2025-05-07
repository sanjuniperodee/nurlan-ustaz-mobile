import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/auth_repository.dart';

part 'forgot_password_cubit.freezed.dart';

@singleton
class ForgotPasswordCubitCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubitCubit(
    this._authRepository,
  ) : super(const ForgotPasswordState.initial());
  final AuthRepository _authRepository;
  late int userId;
  late String sessionId;

  Future<void> resetConfirm(
      {required String newPassword, required String reNewPassword}) async {
    emit(ForgotPasswordState.loading());

    final result = await _authRepository.resetPasswordConfirm(
        sessionId: sessionId,
        newPassword: newPassword,
        reNewPassword: reNewPassword);
    result.fold((l) {
      emit(ForgotPasswordState.error(message: mapFailureToMessageBack(l)));
      emit(ForgotPasswordState.verificationCode(userId: userId));
    }, (r) {
      emit(const ForgotPasswordState.successConfirm());
      emit(const ForgotPasswordState.initial());
    });
  }

  Future<void> resetConfirmCode({
    required String code,
  }) async {
    emit(ForgotPasswordState.loading());

    final result = await _authRepository.ressetConfirmCode(
        activateUserDTO: ActivateUserDTO(userId: userId, code: code));
    result.fold((l) {
      emit(ForgotPasswordState.error(message: mapFailureToMessageBack(l)));
      emit(ForgotPasswordState.verificationCode(userId: userId));
    }, (r) {
      log('${r}------sessionID');
      sessionId = r;
      emit(const ForgotPasswordState.newPassword());
    });
  }

  Future<void> getIdByMail(String mail) async {
    emit(ForgotPasswordState.loading());
    final id = await _authRepository.resetPassword(mail: mail);

    return id.fold((l) {
      emit(ForgotPasswordState.error(message: mapFailureToMessageBack(l)));
      emit(ForgotPasswordState.initial());
    }, (r) {
      userId = r;
      emit(ForgotPasswordState.verificationCode(userId: r));
    });
  }

  Future<void> toInitialPage() async {
    emit(const ForgotPasswordState.initial());
  }

  Future<void> toCodeVerificationPage() async {
    emit(ForgotPasswordState.verificationCode(userId: userId));
  }

  Future<void> toNewPasswordPage() async {
    emit(const ForgotPasswordState.newPassword());
  }

  // void toInitialPage() {
  //   emit(const _InitialState());
  // }

  // //Future<void> sendEmail() async {
  //   emit(const _$_VerificationCodeState());
  // }

  Future<void> sendCode() async {
    print('hello');
    //emit(const _NewPasswordState());
  }

// Future<void> sendCode(
//     String? code, int userId, TokenCreateDTO tokenCreateDTO) async {
//   final result = await _authRepository.activateUser(
//       activateUserDTO: ActivateUserDTO(user_id: userId, code: code));
//   result.fold((l) => {result.toString()}, (r) async {
//     final result =
//     await _authRepository.createJTW(createTokenDTO: tokenCreateDTO);
//     result.fold(
//           (l) {
//         log('error 2');
//       },
//           (r) {
//         emit(CodeVerificationState.loadedState());
//       },
//     );
//   });
// }
}

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = ForgotPasswordInitialState;
  const factory ForgotPasswordState.successConfirm() =
      ForgotPasswordSuccessConfirmState;
  const factory ForgotPasswordState.verificationCode({required int userId}) =
      ForgotPasswordVerificationCodeState;
  const factory ForgotPasswordState.newPassword() =
      ForgotPasswordNewPasswordState;
  const factory ForgotPasswordState.loading() = ForgotPasswordLoadingState;
  const factory ForgotPasswordState.error({
    required String message,
  }) = ForgotPasswordErrorState;
}
