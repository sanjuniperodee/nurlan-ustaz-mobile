import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';

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
  SetNewPasswordBloc({required this.authRemoteDs}) {
    handle<SetNewPasswordEvent>(
      (event) async {
        await authRemoteDs.resetPasswordConfirm(
          sessionId: event.sessionId,
          newPassword: event.newPassword,
          reNewPassword: event.reNewPassword,
        );
        await authRemoteDs.createJwt(
          tokenCreateDTO: TokenCreateDTO(
            email: event.email,
            password: event.newPassword,
          ),
        );
      },
    );
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
