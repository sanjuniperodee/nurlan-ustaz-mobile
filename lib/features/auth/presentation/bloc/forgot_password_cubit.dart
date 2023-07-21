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
  ) : super(const ForgotPasswordState.initialState());
  final AuthRepository _authRepository;
  late int userId;
  late String sessionId;

  Future<void> resetConfirm(
      {
      required String newPassword,
      required String reNewPassword}) async {
    emit(ForgotPasswordState.loadingState());

    final result = await _authRepository.resetPasswordConfirm(
        sessionId:sessionId,
        newPassword: newPassword,
        reNewPassword: reNewPassword);
    result.fold((l) {
      emit(_ErrorState(message: mapFailureToMessageBack(l)));
      emit(ForgotPasswordState.verificationCodeState(userId: userId));
    }, (r) {
      emit(const _SuccessConfirm());
      emit(_InitialState());

    });
  }

  Future<void> resetConfirmCode(
      {required String code,
        }) async {
    emit(ForgotPasswordState.loadingState());

    final result = await _authRepository.ressetConfirmCode(
       activateUserDTO: ActivateUserDTO(user_id: userId,code: code));
    result.fold((l) {
      emit(_ErrorState(message: mapFailureToMessageBack(l)));
      emit(ForgotPasswordState.verificationCodeState(userId: userId));
    }, (r) {
      log('${r}------sessionID');
      sessionId = r;
      emit(const _NewPasswordState());

    });
  }




  Future<void> getIdByMail(String mail) async {
    emit(ForgotPasswordState.loadingState());
    final id = await _authRepository.resetPassword(mail: mail);

    return id.fold((l) {
      emit(_ErrorState(message: mapFailureToMessageBack(l)));
      emit(_InitialState());
    }, (r) {
      userId = r;
      emit(ForgotPasswordState.verificationCodeState(userId: r));
    });
  }

  Future<void> toInitialPage() async {
    emit(const ForgotPasswordState.initialState());
  }

  Future<void> toCodeVerificationPage() async {
    emit(ForgotPasswordState.verificationCodeState(userId: userId));
  }

  Future<void> toNewPasswordPage() async {
    emit(_NewPasswordState());
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
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initialState() = _InitialState;

  const factory ForgotPasswordState.successConfirm() = _SuccessConfirm;

  const factory ForgotPasswordState.verificationCodeState(
      {required int userId}) = _VerificationCodeState;

  const factory ForgotPasswordState.newPassword() =
      _NewPasswordState;

  const factory ForgotPasswordState.loadingState() = _LoadingState;

  const factory ForgotPasswordState.errorState({
    required String message,
  }) = _ErrorState;
}
