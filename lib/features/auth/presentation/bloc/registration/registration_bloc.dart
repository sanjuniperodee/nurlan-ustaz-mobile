import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

typedef RegistrationState = DrySuccessDataState<UserDto, Object>;

final class RegistrationBloc
    extends DrySuccessDataStateBloc<UserDto, UserDto, Object> {
  RegistrationBloc({
    required this.authRemoteDs,
    super.initialState,
  }) {
    handle<UserDto>((userDTO) async {
      final p = await authRemoteDs.postUser(userDTO: userDTO);
      return userDTO.copyWith(id: p.id);
    });
  }

  @protected
  final AuthRemoteDs authRemoteDs;
}
