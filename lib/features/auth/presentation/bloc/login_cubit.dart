import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/token_dto.dart';
import '../../data/model/user_dto.dart';
import '../../data/repositories/auth_repository.dart';

part 'login_cubit.freezed.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._authRepository,
  ) : super(const LoginState.loadingState());
  final AuthRepository _authRepository;

  Future<void> createToken(TokenCreateDTO tokenCreateDTO) async {
    final result =
        await _authRepository.createJTW(createTokenDTO: tokenCreateDTO);
    result.fold(
      (l) {
        log('error 2');
      },
      (r) {
        print('uspechno');
        emit(const LoginState.loadedState());
      },
    );
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initialState() = _InitialState;

  const factory LoginState.loadedState() = _LoadedState;

  const factory LoginState.loadingState() = _LoadingState;

  const factory LoginState.errorState({
    required String message,
  }) = _ErrorState;
}
