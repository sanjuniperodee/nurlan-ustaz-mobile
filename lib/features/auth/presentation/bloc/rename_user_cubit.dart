import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload2.dart';

import '../../data/repositories/auth_repository.dart';

part 'rename_user_cubit.freezed.dart';

@singleton
class RenameUserCubit extends Cubit<RenameUserState> {
  RenameUserCubit(
    this._authRepository,
  ) : super(const RenameUserState.loadingState());
  final AuthRepository _authRepository;

  Future<void> renameUser({required UserPayload2 user, XFile? avatar}) async {
    emit(const RenameUserState.loadingState());
    final result = await _authRepository.rename(user: user, avatar: avatar);
    result.fold(
      (l) {
        emit(RenameUserState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(RenameUserState.loadedState(user: r));
      },
    );
  }
}

@freezed
class RenameUserState with _$RenameUserState {
  const factory RenameUserState.initialState() = _InitialState;

  const factory RenameUserState.loadedState({required UserDto user}) =
      _LoadedState;

  const factory RenameUserState.loadingState() = _LoadingState;

  const factory RenameUserState.errorState({
    required String message,
  }) = _ErrorState;
}
