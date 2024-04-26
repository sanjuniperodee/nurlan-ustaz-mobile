import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/enums/gender.dart';
import '../../data/model/user_payload.dart';
import '../../data/repositories/auth_repository.dart';

part 'registration_cubit.freezed.dart';

@singleton
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(
    this._authRepository,
  ) : super(const RegistrationState.loadingState());
  final AuthRepository _authRepository;
  late int userId;
  late String password;

  void changeGender(Gender gender) {
    print(gender.name);
    emit(RegistrationState.initialState(
        userDTO: const UserPayload().copyWith(gender: gender)));
  }

  Future<void> postUser(UserPayload userDTO) async {
    emit(_LoadingState());
    final result = await _authRepository.postUser(userDTO: userDTO);
    return result.fold(
      (l) {
        emit(RegistrationState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const _SuccessState());
        userId = r.id ?? 0;
        emit(RegistrationState.loadedState(
            user: r.copyWith(password: userDTO.password!)));
      },
    );
  }
}

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initialState(
      {@Default(false) bool isPolicyAccept,
      @Default(UserPayload(
          fullName: '',
          email: '',
          phoneNumber: '',
          password: '',
          rePassword: '',
          birthday: '',
          gender: Gender.male))
      UserPayload userDTO}) = _InitialState;

  const factory RegistrationState.loadedState({
    required UserPayload user,
  }) = _LoadedState;

  const factory RegistrationState.loadingState() = _LoadingState;

  const factory RegistrationState.successState() = _SuccessState;

  const factory RegistrationState.errorState({
    required String message,
  }) = _ErrorState;
}
