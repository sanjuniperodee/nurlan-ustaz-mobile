import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/remote/profile_remote_ds.dart';

class LoadProfileEvent {
  const LoadProfileEvent();
}

typedef LoadProfileState = DrySuccessDataState<UserDto, Object>;

class LoadProfileBloc
    extends DrySuccessDataBloc<LoadProfileEvent, UserDto, Object> {
  LoadProfileBloc({
    required this.profileRemoteDs,
    required this.profileLocalDs,
  }) {
    handle<LoadProfileEvent>((event) async {
      final user = await profileRemoteDs.getCurrent();
      await profileLocalDs.save(user);
      return user;
    });
  }

  @protected
  final ProfileLocalDs profileLocalDs;

  @protected
  final ProfileRemoteDs profileRemoteDs;
}
