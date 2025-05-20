import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart';
import 'package:re_seedwork/re_seedwork.dart';

class AuthCubit extends Cubit<Optional<TokenDTO>> with ConsumerBlocMixin {
  AuthCubit({
    required this.authLocalDs,
    required this.profileLocalDs,
  }) : super(authLocalDs.data) {
    subscribe(authLocalDs, _onNewState);
  }

  void _onNewState(Optional<TokenDTO> tokens) async {
    emit(tokens);
    if (!tokens.isPresent) await profileLocalDs.delete();
  }

  Future<void> logout() async => await authLocalDs.removeToken();

  @protected
  final AuthLocalDs authLocalDs;

  @protected
  final ProfileLocalDs profileLocalDs;
}
