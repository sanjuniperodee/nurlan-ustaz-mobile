import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart';
import 'package:re_seedwork/re_seedwork.dart';

class AuthCubit extends Cubit<Optional<TokenDTO>> with ConsumerBlocMixin {
  AuthCubit({
    required this.authLocalDs,
    required this.profileLocalDs,
    required this.authRemoteDs,
  }) : super(authLocalDs.data) {
    subscribe(authLocalDs, _onNewState);
  }

  void _onNewState(Optional<TokenDTO> tokens) async {
    emit(tokens);
    if (!tokens.isPresent) await profileLocalDs.delete();
  }

  Future<void> logout() async {
    final token = authLocalDs.data.valueOrNull;
    if (token != null && token.refresh.isNotEmpty) {
      try {
        await authRemoteDs.blacklistRefresh(refresh: token.refresh);
      } catch (_) {
        // Do not block logout on blacklist failure (e.g. network, 401)
      }
    }
    await authLocalDs.removeToken();
  }

  @protected
  final AuthLocalDs authLocalDs;

  @protected
  final ProfileLocalDs profileLocalDs;

  @protected
  final AuthRemoteDs authRemoteDs;
}
