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
  ) : super(const LoginState.initialState());
  final AuthRepository _authRepository;

  Future<void> createToken(TokenCreateDTO tokenCreateDTO) async {
    emit(_LoadingState());
    final result =
        await _authRepository.createJTW(createTokenDTO: tokenCreateDTO);
    result.fold(
      (l) {
        l as ServerFailure;
        emit(_ErrorState(message: mapFailureToMessageBack(l)));
        emit(const LoginState.initialState());

      },
      (r) {
        emit(const LoginState.loadedState());
        emit(const LoginState.initialState());

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
