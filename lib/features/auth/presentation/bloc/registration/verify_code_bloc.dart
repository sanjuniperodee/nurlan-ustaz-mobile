import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class VerifyCodeEvent {
  const VerifyCodeEvent({
    required this.code,
    required this.user,
  });

  @protected
  final String code;

  @protected
  final UserDto user;
}

typedef VerifyCodeState = DryEmptyState<Object>;

class VerifyCodeBloc extends DryEmptyBloc<VerifyCodeEvent, Object> {
  VerifyCodeBloc({required this.authRepository}) {
    handle<VerifyCodeEvent>((event) async {
      final activateResult = await authRepository.activateUser(
        activateUserDTO: ActivateUserDTO(
          code: event.code,
          userId: event.user.id,
        ),
      );
      activateResult.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (_) {},
      );
      final jwtResult = await authRepository.createJwt(
        tokenCreateDTO: TokenCreateDTO(
          email: event.user.email,
          password: event.user.password,
        ),
      );
      jwtResult.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (_) {},
      );
    });
  }

  @protected
  final AuthRepository authRepository;
}
