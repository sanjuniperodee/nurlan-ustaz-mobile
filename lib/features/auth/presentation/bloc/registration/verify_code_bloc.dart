import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

class VerifyCodeEvent {
  const VerifyCodeEvent({
    required this.code,
    required this.user,
  });

  @protected
  final String code;

  @protected
  final UserDto user;
}

typedef VerifyCodeState = DryEmptyState<Object>;

class VerifyCodeBloc extends DryEmptyStateBloc<VerifyCodeEvent, Object> {
  VerifyCodeBloc({required this.authRemoteDs}) {
    handle<VerifyCodeEvent>(
      (event) async {
        await authRemoteDs.activateUser(
          activateUserDTO: ActivateUserDTO(
            code: event.code,
            userId: event.user.id,
          ),
        );
        // Will be saved to local ds in interceptor
        await authRemoteDs.createJwt(
          tokenCreateDTO: TokenCreateDTO(
            email: event.user.email,
            password: event.user.password,
          ),
        );
      },
    );
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
