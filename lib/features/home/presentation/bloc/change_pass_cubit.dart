import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

part 'change_pass_cubit.freezed.dart';

@singleton
class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(
    this.authRemoteDs,
  ) : super(const ChangePassState.initial());

  final AuthRemoteDs authRemoteDs;

  Future<void> changePass({
    required String curPass,
    required String newPass,
    required String pass,
  }) async {
    try {
      await authRemoteDs.changePass(
          curPass: curPass, newPass: newPass, pass: pass);
      emit(ChangePassState.loaded(status: true));
    } catch (e) {
      emit(
        ChangePassState.error(
          message: mapFailureToMessageBack(
            ServerFailure(message: e.toString()),
          ),
        ),
      );
      emit(ChangePassState.initial());
      rethrow;
    }
    // failureOrUser.fold(
    //   (l) {},
    //   (r) {},
    // );
  }
}

@freezed
sealed class ChangePassState with _$ChangePassState {
  const factory ChangePassState.initial() = ChangePassInitialPage;
  const factory ChangePassState.loading() = ChangePassLoadingState;
  const factory ChangePassState.loaded({required bool status}) =
      ChangePassLoadedState;
  const factory ChangePassState.error({
    required String message,
  }) = ChangePassErrorState;
}
