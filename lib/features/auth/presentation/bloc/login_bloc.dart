import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';

class LoginEvent {
  const LoginEvent({required this.tokenCreateDTO});

  final TokenCreateDTO tokenCreateDTO;
}

typedef LoginState = DryEmptyState<Object>;

class LoginBloc extends DryEmptyStateBloc<LoginEvent, Object> {
  LoginBloc({
    required this.authRemoteDs,
    super.initialState,
  }) {
    handle<LoginEvent>(
      (event) async =>
          await authRemoteDs.createJwt(tokenCreateDTO: event.tokenCreateDTO),
    );
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
