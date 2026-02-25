import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class VerifyForgotCodeEvent {
  const VerifyForgotCodeEvent({
    required this.userId,
    required this.code,
  });

  final int userId;

  final String code;
}

typedef VerifyForgotCodeState = DrySuccessDataState<String, Object>;

class VerifyForgotCodeBloc
    extends DrySuccessDataBloc<VerifyForgotCodeEvent, String, Object> {
  VerifyForgotCodeBloc({required this.authRepository}) {
    handle<VerifyForgotCodeEvent>((event) async {
      final result = await authRepository.confirmCode(
        activateUserDTO: ActivateUserDTO(
          code: event.code,
          userId: event.userId,
        ),
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
