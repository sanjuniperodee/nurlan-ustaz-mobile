import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class SetNewPasswordEvent {
  const SetNewPasswordEvent({
    required this.email,
    required this.sessionId,
    required this.newPassword,
    required this.reNewPassword,
  });

  final String email;

  final String sessionId;

  final String newPassword;

  final String reNewPassword;
}

typedef SetNewPasswordState = DryEmptyState<Object>;

class SetNewPasswordBloc extends DryEmptyBloc<SetNewPasswordEvent, Object> {
  SetNewPasswordBloc({required this.authRepository}) {
    handle<SetNewPasswordEvent>((event) async {
      final confirmResult = await authRepository.resetPasswordConfirm(
        sessionId: event.sessionId,
        newPassword: event.newPassword,
        reNewPassword: event.reNewPassword,
      );
      confirmResult.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (_) {},
      );
      final jwtResult = await authRepository.createJwt(
        tokenCreateDTO: TokenCreateDTO(
          email: event.email,
          password: event.newPassword,
        ),
      );
      jwtResult.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (_) {},
      );
    });
  }

  @protected
  final AuthRepository authRepository;
}
