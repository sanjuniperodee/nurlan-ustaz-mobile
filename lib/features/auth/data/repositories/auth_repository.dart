import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

const _tag = 'AuthRepository';

abstract class AuthRepository {}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDs remoteDS;
  final AuthLocalDs localDS;

  AuthRepositoryImpl({
    required this.remoteDS,
    required this.localDS,
  });
}
