import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

class DeleteProfileEvent {
  const DeleteProfileEvent();
}

typedef DeleteProfileState = DryEmptyState<Object>;

class DeleteProfileBloc extends DryEmptyBloc<DeleteProfileEvent, Object> {
  DeleteProfileBloc({
    required this.authLocalDs,
    required this.authRemoteDs,
  }) {
    handle<DeleteProfileEvent>((event) async {
      await authRemoteDs.deleteUser();
      await authLocalDs.removeToken();
    });
  }

  @protected
  final AuthLocalDs authLocalDs;

  @protected
  final AuthRemoteDs authRemoteDs;
}
