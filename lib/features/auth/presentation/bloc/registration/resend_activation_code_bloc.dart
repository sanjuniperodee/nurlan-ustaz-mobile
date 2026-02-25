import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class ResendActivationCodeEvent {
  const ResendActivationCodeEvent({required this.email});

  final String email;
}

typedef ResendActivationCodeState = DryEmptyState<Object>;

class ResendActivationCodeBloc
    extends DryEmptyBloc<ResendActivationCodeEvent, Object> {
  ResendActivationCodeBloc({
    required this.authRepository,
  }) {
    handle<ResendActivationCodeEvent>((event) async {
      final result =
          await authRepository.resendActivation(email: event.email);
      return result.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (r) => r,
      );
    });
  }

  @protected
  final AuthRepository authRepository;
}
