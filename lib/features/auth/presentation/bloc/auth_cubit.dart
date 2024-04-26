// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(
    this.authRepository,
  ) : super(AuthState.initialState());

  late int userId;
  void changeGender(Gender gender) {
    emit(AuthState.initialState(
        userDTO: UserPayload().copyWith(gender: gender)));
  }

  Future<void> postUser(UserPayload userDTO) async {
    final result = await authRepository.postUser(userDTO: userDTO);
    return result.fold(
      (l) {},
      (r) {
        userId = r.id ?? 0;
        createToken(TokenCreateDTO(email: r.email, password: userDTO.password));
      },
    );
  }

  Future<void> sendCode(String? code) async {
    final result = await authRepository.activateUser(
        activateUserDTO: ActivateUserDTO(user_id: userId, code: code));
    result.fold((l) => {result.toString()}, (r) => {print('uiiii')});
  }

  Future<void> createToken(TokenCreateDTO tokenCreateDTO) async {
    final result =
        await authRepository.createJTW(createTokenDTO: tokenCreateDTO);
    result.fold(
      (l) {
        log('тонен не создан');
      },
      (r) {
        log('токен создан');
      },
    );
  }
}

@freezed
class AuthState with _$AuthState {
  factory AuthState.initialState({
    @Default(false) bool isPolicyAccept,
    @Default(
        UserPayload(
            fullName: '',
            email: '',
            phoneNumber: '',
            password: '',
            rePassword: '',
            birthday: '',
            gender: Gender.male))
        UserPayload userDTO,
  }) = _InitialPage;

  const factory AuthState.loadingState() = _LoadingState;

  const factory AuthState.loaded() = _LoadedState;

  const factory AuthState.errorState({
    required String message,
  }) = _ErrorState;
}
