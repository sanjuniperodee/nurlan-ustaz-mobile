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
  ) : super(const CodeVerificationState.loadingState());
  final AuthRepository _authRepository;

  Future<void> sendCode(
      String? code, int userId, TokenCreateDTO tokenCreateDTO) async {
    final result = await _authRepository.activateUser(
        activateUserDTO: ActivateUserDTO(user_id: userId, code: code));
    result.fold((l) {
      emit(_ErrorState(message: mapFailureToMessageBack(l)));
    }, (r) async {
      final result =
          await _authRepository.createJTW(createTokenDTO: tokenCreateDTO);
      result.fold(
        (l) {},
        (r) {
          emit(const CodeVerificationState.loadedState());
        },
      );
    });
  }
}

@freezed
class CodeVerificationState with _$CodeVerificationState {
  const factory CodeVerificationState.initialState() = _InitialState;

  const factory CodeVerificationState.loadedState() = _LoadedState;

  const factory CodeVerificationState.loadingState() = _LoadingState;

  const factory CodeVerificationState.errorState({
    required String message,
  }) = _ErrorState;
}
