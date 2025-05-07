import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/token_dto.dart';
import '../../data/repositories/auth_repository.dart';

part 'login_cubit.freezed.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._authRepository,
  ) : super(const LoginState.initial());
  final AuthRepository _authRepository;

  Future<void> createToken(TokenCreateDTO tokenCreateDTO) async {
    emit(const LoginState.loading());
    final result =
        await _authRepository.createJTW(createTokenDTO: tokenCreateDTO);
    result.fold(
      (l) {
        l as ServerFailure;
        emit(LoginState.error(message: mapFailureToMessageBack(l)));
        emit(const LoginState.initial());
      },
      (r) {
        emit(const LoginState.loaded());
        emit(const LoginState.initial());
      },
    );
  }
}

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loaded() = LoginLoadedState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.error({
    required String message,
  }) = LoginErrorState;
}
