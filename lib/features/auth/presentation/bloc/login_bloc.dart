import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class LoginEvent {
  const LoginEvent({required this.tokenCreateDTO});

  final TokenCreateDTO tokenCreateDTO;
}

typedef LoginState = DryEmptyState<Object>;

class LoginBloc extends DryEmptyBloc<LoginEvent, Object> {
  LoginBloc({
    required this.authRepository,
    super.initialState,
  }) {
    handle<LoginEvent>((event) async {
      final result = await authRepository.createJwt(
        tokenCreateDTO: event.tokenCreateDTO,
      );
      return result.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (r) => r,
      );
    });
  }

  @protected
  final AuthRepository authRepository;
}
