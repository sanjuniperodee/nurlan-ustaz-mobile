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
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload2.dart';

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
      {required UserPayload2 user, XFile? avatar});

  Future<Either<Failure, UserDto>> getUser();

  Future<Either<Failure, bool>> activateUser(
      {required ActivateUserDTO activateUserDTO});
  Future<Either<Failure, bool>> deleteUser();
  Future<Either<Failure, bool>> newPass(
      {required String curPass, required String newPass, required String pass});

  Either<Failure, TokenDTO> authCheck();

  Either<Failure, String> logOut();

  Future<Either<Failure, int>> resetPassword({required String mail});
  Future<Either<Failure, void>> resetPasswordConfirm(
      {required String sessionId,
      required String newPassword,
      required String reNewPassword});
  Future<Either<Failure, String>> ressetConfirmCode(
      {required ActivateUserDTO activateUserDTO});
  Future<Either<Failure, String>> resendActivation({required String email});
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
  Future<Either<Failure, String>> saveLocale({required String locale}) async {
    try {
      await localDS.saveLocale(locale: locale);

      return const Right('Success');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

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
      {required UserPayload2 user, XFile? avatar}) async {
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
        localDS.saveToken(token: result);
        final UserDto? user = await remoteDS.getUser();
        if (user != null) {
          localDS.saveUser(user: user);
        }
        final UserDto? users = await localDS.getUserFromCacheNull();
        log('USERRRR${users.toString()}');
        return Right(result);
      } on ServerException catch (e) {
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
  Future<Either<Failure, bool>> deleteUser() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDS.deleteUser();
        localDS.removeUserFromCache();
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
  Either<Failure, TokenDTO> authCheck() {
    try {
      final TokenDTO? token = localDS.getTokenFromCache();
      log(
        'AuthRepositoryImpl authCheck:: ${token}',
        name: _tag,
      );
      if (token == null) {
        log('пустой токен');
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
      return const Right('success');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, int>> resetPassword({required String mail}) async {
    if (await networkInfo.isConnected) {
      try {
        final id = await remoteDS.resetPassword(mail: mail);
        return Right(id);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, void>> resetPasswordConfirm(
      {required String sessionId,
      required String newPassword,
      required String reNewPassword}) async {
    if (await networkInfo.isConnected) {
      try {
        final id = await remoteDS.resetPasswordConfirm(
            sessionId: sessionId,
            newPassword: newPassword,
            reNewPassword: reNewPassword);
        return Right(id);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, String>> ressetConfirmCode(
      {required ActivateUserDTO activateUserDTO}) async {
    if (await networkInfo.isConnected) {
      try {
        final id = await remoteDS.confirmCode(
          activateUserDTO: activateUserDTO,
        );
        return Right(id);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }

  @override
  Future<Either<Failure, String>> resendActivation(
      {required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final id = await remoteDS.resendActivation(
          email: email,
        );
        return Right(id);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(ServerFailure(message: NO_INTERNET_TEXT));
    }
  }
}
