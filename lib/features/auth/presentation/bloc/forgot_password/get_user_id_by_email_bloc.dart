import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

class GetUserIdByEmailEvent {
  const GetUserIdByEmailEvent(this.email);

  final String email;
}

typedef GetUserIdByEmailState = DrySuccessDataState<(String, int), Object>;

class GetUserIdByEmailBloc
    extends DrySuccessDataBloc<GetUserIdByEmailEvent, (String, int), Object> {
  GetUserIdByEmailBloc({required this.authRemoteDs}) {
    handle<GetUserIdByEmailEvent>(
      (event) async =>
          (event.email, await authRemoteDs.resetPassword(mail: event.email)),
    );
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
