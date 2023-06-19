import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';

part 'get_profile_cubit.freezed.dart';

@singleton
class GetProfileCubit extends Cubit<GetProfileState> {
  final AuthRepository _authRepository;
  GetProfileCubit(
    this._authRepository,
  ) : super(const GetProfileState.initialState());

  Future<void> getUser() async {
    final failureOrUser = await _authRepository.getUser();
    failureOrUser.fold(
      (l) {
        emit(GetProfileState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(GetProfileState.loaded(user: r));
      },
    );
  }
}

@freezed
class GetProfileState with _$GetProfileState {
  const factory GetProfileState.initialState() = _InitialPage;

  const factory GetProfileState.loadingState() = _LoadingState;

  const factory GetProfileState.loaded({
    required UserDTO user,
  }) = _LoadedState;

  const factory GetProfileState.errorState({
    required String message,
  }) = _ErrorState;
}
