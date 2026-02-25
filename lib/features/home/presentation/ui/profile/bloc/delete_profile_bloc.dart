import 'package:dry_bloc/dry_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

class DeleteProfileEvent {
  const DeleteProfileEvent();
}

typedef DeleteProfileState = DryEmptyState<Object>;

class DeleteProfileBloc extends DryEmptyBloc<DeleteProfileEvent, Object> {
  DeleteProfileBloc({
    required this.authLocalDs,
    required this.authRepository,
  }) {
    handle<DeleteProfileEvent>((event) async {
      final result = await authRepository.deleteUser();
      result.fold(
        (l) => throw Exception(mapFailureToMessage(l)),
        (_) {},
      );
      await authLocalDs.removeToken();
    });
  }

  @protected
  final AuthLocalDs authLocalDs;

  @protected
  final AuthRepository authRepository;
}
