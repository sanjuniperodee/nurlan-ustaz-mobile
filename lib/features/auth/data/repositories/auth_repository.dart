import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';

const _tag = 'AuthRepository';

abstract class AuthRepository {
  Future<Either<Failure, bool>> getOnboardingStatus();
  Future<Either<Failure, bool>> saveOnboardingStatus({
    required bool isOnboarding,
  });
}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDs remoteDS;
  final AuthLocalDs localDS;

  AuthRepositoryImpl({
    required this.remoteDS,
    required this.localDS,
  });


  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    try {
      final bool isOnboarding = await localDS.getOnboardingStatusFromCache();
      return Right(isOnboarding);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }



  @override
  Future<Either<Failure, bool>> saveOnboardingStatus({
    required bool isOnboarding,
  }) async {
    try {
      await localDS.saveOnboardingStatusToCache(isOnboarding: isOnboarding);
      return const Right(true);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
