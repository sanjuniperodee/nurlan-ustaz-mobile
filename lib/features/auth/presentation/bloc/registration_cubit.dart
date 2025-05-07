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
  ) : super(const RegistrationState.loading());
  final AuthRepository _authRepository;
  late int userId;
  late String password;

  void changeGender(Gender gender) {
    print(gender.name);
    emit(RegistrationState.initial(
        userDTO: const UserPayload().copyWith(gender: gender)));
  }

  Future<void> postUser(UserPayload userDTO) async {
    emit(const RegistrationState.loading());
    final result = await _authRepository.postUser(userDTO: userDTO);
    return result.fold(
      (l) {
        emit(RegistrationState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const RegistrationState.success());
        userId = r.id ?? 0;
        emit(RegistrationState.loaded(
            user: r.copyWith(password: userDTO.password!)));
      },
    );
  }
}

@freezed
sealed class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial(
      {@Default(false) bool isPolicyAccept,
      @Default(UserPayload(
          fullName: '',
          email: '',
          phoneNumber: '',
          password: '',
          rePassword: '',
          birthday: '',
          gender: Gender.male))
      UserPayload userDTO}) = RegistrationInitialState;

  const factory RegistrationState.loaded({
    required UserPayload user,
  }) = RegistrationLoadedState;

  const factory RegistrationState.loading() = RegistrationLoadingState;
  const factory RegistrationState.success() = RegistrationSuccessState;
  const factory RegistrationState.error({
    required String message,
  }) = RegistrationErrorState;
}
