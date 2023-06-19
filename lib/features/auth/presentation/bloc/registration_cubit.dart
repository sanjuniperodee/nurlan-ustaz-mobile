import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/enums/gender.dart';
import '../../data/model/user_dto.dart';
import '../../data/repositories/auth_repository.dart';

part 'registration_cubit.freezed.dart';

@singleton
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(
    this._authRepository,
  ) : super(const RegistrationState.loadingState());
  final AuthRepository _authRepository;
  late int userId;

  void changeGender(Gender gender) {
    print(gender.name);
    emit(RegistrationState.initialState(
        userDTO: const UserDTO().copyWith(gender: gender)));
  }

  Future<void> postUser(UserDTO userDTO) async {
    final result = await _authRepository.postUser(userDTO: userDTO);
    return result.fold(
      (l) {
        emit(RegistrationState.errorState(message: 'ошибка регистрации'));


      },
      (r) {
        userId = r.id ?? 0;
        emit(RegistrationState.loadedState(user: r));
      },
    );
  }
}

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initialState(
      {@Default(false)
          bool isPolicyAccept,
      @Default(
          UserDTO(
              fullName: '',
              email: '',
              phoneNumber: '',
              password: '',
              rePassword: '',
              birthday: '',
              gender: Gender.male))
          UserDTO userDTO}) = _InitialState;

  const factory RegistrationState.loadedState({
    required UserDTO user,
  }) = _LoadedState;

  const factory RegistrationState.loadingState() = _LoadingState;

  const factory RegistrationState.errorState({
    required String message,
  }) = _ErrorState;
}
