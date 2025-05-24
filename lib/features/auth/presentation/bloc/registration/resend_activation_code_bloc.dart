import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

class ResendActivationCodeEvent {
  const ResendActivationCodeEvent({required this.email});

  final String email;
}

typedef ResendActivationCodeState = DryEmptyState<Object>;

class ResendActivationCodeBloc
    extends DryEmptyBloc<ResendActivationCodeEvent, Object> {
  ResendActivationCodeBloc({
    required this.authRemoteDs,
  }) {
    handle<ResendActivationCodeEvent>(
        (event) => authRemoteDs.resendActivation(email: event.email));
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
