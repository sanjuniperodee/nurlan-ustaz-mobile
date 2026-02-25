import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class GetUserIdByEmailEvent {
  const GetUserIdByEmailEvent(this.email);

  final String email;
}

typedef GetUserIdByEmailState = DrySuccessDataState<(String, int), Object>;

class GetUserIdByEmailBloc
    extends DrySuccessDataBloc<GetUserIdByEmailEvent, (String, int), Object> {
  GetUserIdByEmailBloc({required this.authRepository}) {
    handle<GetUserIdByEmailEvent>((event) async {
      final result =
          await authRepository.resetPassword(mail: event.email);
      return result.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (userId) => (event.email, userId),
      );
    });
  }

  @protected
  final AuthRepository authRepository;
}
