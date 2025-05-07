import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload2.dart';

import '../../data/repositories/auth_repository.dart';

part 'rename_user_cubit.freezed.dart';

@singleton
class RenameUserCubit extends Cubit<RenameUserState> {
  RenameUserCubit(
    this._authRepository,
  ) : super(const RenameUserState.loading());
  final AuthRepository _authRepository;

  Future<void> renameUser({required UserPayload2 user, XFile? avatar}) async {
    emit(const RenameUserState.loading());
    final result = await _authRepository.rename(user: user, avatar: avatar);
    result.fold(
      (l) {
        emit(RenameUserState.error(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(RenameUserState.loaded(user: r));
      },
    );
  }
}

@freezed
sealed class RenameUserState with _$RenameUserState {
  const factory RenameUserState.initial() = RenameUserInitialState;
  const factory RenameUserState.loaded({required UserDto user}) =
      RenameUserLoadedState;
  const factory RenameUserState.loading() = RenameUserLoadingState;
  const factory RenameUserState.error({
    required String message,
  }) = RenameUserErrorState;
}
