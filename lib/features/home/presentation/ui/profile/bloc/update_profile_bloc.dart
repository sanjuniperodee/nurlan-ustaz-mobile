import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart';

class UpdateProfileEvent {
  const UpdateProfileEvent({
    required this.user,
    this.newAvatarPath,
  });

  final String? newAvatarPath;

  final UserDto user;
}

typedef UpdateProfileState = DryEmptyState<Object>;

class UpdateProfileBloc extends DryEmptyStateBloc<UpdateProfileEvent, Object> {
  UpdateProfileBloc(
      {required this.authRemoteDs, required this.profileLocalDs}) {
    handle<UpdateProfileEvent>(
      (event) async {
        final user = await authRemoteDs.updateUser(
          user: event.user,
          avatarPath: event.newAvatarPath,
        );
        await profileLocalDs.save(user);
      },
    );
  }

  @protected
  final AuthRemoteDs authRemoteDs;

  @protected
  final ProfileLocalDs profileLocalDs;
}
