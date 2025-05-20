import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';

class VerifyForgotCodeEvent {
  const VerifyForgotCodeEvent({
    required this.userId,
    required this.code,
  });

  final int userId;

  final String code;
}

typedef VerifyForgotCodeState = DrySuccessDataState<String, Object>;

class VerifyForgotCodeBloc
    extends DrySuccessDataStateBloc<VerifyForgotCodeEvent, String, Object> {
  VerifyForgotCodeBloc({required this.authRemoteDs}) {
    handle<VerifyForgotCodeEvent>(
      (event) => authRemoteDs.confirmCode(
        activateUserDTO: ActivateUserDTO(),
      ),
    );
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
