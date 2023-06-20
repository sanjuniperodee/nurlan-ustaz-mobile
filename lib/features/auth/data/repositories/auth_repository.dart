import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';

import '../../../../core/common/constants.dart';
import '../../../../core/platform/network_info.dart';

const _tag = 'AuthRepository';

abstract class AuthRepository {
  Future<Either<Failure, bool>> getOnboardingStatus();

  Future<Either<Failure, bool>> saveOnboardingStatus({
    required bool isOnboarding,
  });

  Future<Either<Failure, String>> saveLocale({
    required String locale,
  });

  Either<Failure, String> getLocale();

  Future<Either<Failure, TokenDTO>> createJTW(
      {required TokenCreateDTO createTokenDTO});

  Future<Either<Failure, UserPayload>> postUser({required UserPayload userDTO});
  Future<Either<Failure, UserDto>> rename(
      {required UserPayload user, XFile? avatar});
  Future<Either<Failure, UserDto>> getUser();

  Future<Either<Failure, bool>> activateUser(
      {required ActivateUserDTO activateUserDTO});
  Future<Either<Failure, bool>> newPass(
      {required String curPass, required String newPass, required String pass});

  Future<Either<Failure, String>> refreshToken({required String refreshToken});

  Either<Failure, String> authCheck();
  Either<Failure, String> logOut();
}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDs remoteDS;
  final AuthLocalDs localDS;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.remoteDS,
    required this.localDS,
  });

  @override
  Either<Failure, String> getLocale() {
    try {
      final String msg = localDS.getLocale();

      return Right(msg);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveLocale({required String locale}) async {
    try {
      await localDS.saveLocale(locale: locale);

      return const Right('Success');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

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

  @override
  Future<Either<Failure, UserPayload>> postUser(
      {required UserPayload userDTO}) async {
    if (await networkInfo.isConnected) {
      try {
        final UserPayload result = await remoteDS.postUser(userDTO: userDTO);

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, UserDto>> rename(
      {required UserPayload user, XFile? avatar}) async {
    if (await networkInfo.isConnected) {
      try {
        final UserDto result =
            await remoteDS.rename(user: user, avatar: avatar);

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, UserDto>> getUser() async {
    if (await networkInfo.isConnected) {
      try {
        final UserDto result = await remoteDS.getUser();

        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, TokenDTO>> createJTW(
      {required TokenCreateDTO createTokenDTO}) async {
    if (await networkInfo.isConnected) {
      try {
        final TokenDTO result =
            await remoteDS.createJwt(tokenCreateDTO: createTokenDTO);
        localDS.saveToken(token: result.access ?? '');

        return Right(result);
      } on ServerException catch (e) {
        log('madi');
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> newPass(
      {required String curPass,
      required String newPass,
      required String pass}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDS.changePass(
            curPass: curPass, newPass: newPass, pass: pass);
        return const Right(true);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, bool>> activateUser(
      {required ActivateUserDTO activateUserDTO}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDS.activateUser(activateUserDTO: activateUserDTO);
        return const Right(true);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken(
      {required String refreshToken}) async {
    if (await networkInfo.isConnected) {
      print('refresh idet');
      try {
        final TokenDTO result = await remoteDS.refreshJwt(
          refreshToken: refreshToken,
        );
        localDS.saveToken(token: result.access!);
        return Right(result.access!);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Either<Failure, String> authCheck() {
    try {
      final token = localDS.getToken();
      log(
        'AuthRepositoryImpl authCheck:: ${token}',
        name: _tag,
      );
      if (token == null) {
        log('пустой токен');
        // && user.verifyStatus != 'wait') {
        return Left(CacheFailure(message: 'Пустой токен!'));
      }
      return Right(token);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Either<Failure, String> logOut() {
    try {
      // final user = localDS.getUserFromCache();
      localDS.removeUserFromCache();
      return Right('success');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
