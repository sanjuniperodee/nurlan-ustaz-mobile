import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

typedef RegistrationState = DrySuccessDataState<UserDto, Object>;

final class RegistrationBloc
    extends DrySuccessDataBloc<UserDto, UserDto, Object> {
  RegistrationBloc({
    required this.authRepository,
    super.initialState,
  }) {
    handle<UserDto>((userDTO) async {
      final result = await authRepository.postUser(userDTO: userDTO);
      return result.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (p) => userDTO.copyWith(id: p.id),
      );
    });
  }

  @protected
  final AuthRepository authRepository;
}
