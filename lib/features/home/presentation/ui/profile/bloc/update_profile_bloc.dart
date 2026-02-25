import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';
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

class UpdateProfileBloc extends DryEmptyBloc<UpdateProfileEvent, Object> {
  UpdateProfileBloc({
    required this.authRepository,
    required this.profileLocalDs,
  }) {
    handle<UpdateProfileEvent>((event) async {
      final result = await authRepository.updateUser(
        user: event.user,
        avatarPath: event.newAvatarPath,
      );
      final user = result.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (r) => r,
      );
      await profileLocalDs.save(user);
    });
  }

  @protected
  final AuthRepository authRepository;

  @protected
  final ProfileLocalDs profileLocalDs;
}
