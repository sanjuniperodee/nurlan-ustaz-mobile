import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDs);

  final AuthRemoteDs _remoteDs;

  @override
  Future<Either<Failure, UserDto>> postUser({required UserDto userDTO}) async {
    try {
      final result = await _remoteDs.postUser(userDTO: userDTO);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, UserDto>> updateUser({
    required UserDto user,
    String? avatarPath,
  }) async {
    try {
      final result =
          await _remoteDs.updateUser(user: user, avatarPath: avatarPath);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, TokenDTO>> refreshJwt(TokenDTO tokens) async {
    try {
      final result = await _remoteDs.refreshJwt(tokens);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> activateUser({
    required ActivateUserDTO activateUserDTO,
  }) async {
    try {
      await _remoteDs.activateUser(activateUserDTO: activateUserDTO);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      await _remoteDs.deleteUser();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, bool>> changePass({
    required String curPass,
    required String newPass,
    required String pass,
  }) async {
    try {
      final result = await _remoteDs.changePass(
        curPass: curPass,
        newPass: newPass,
        pass: pass,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, TokenDTO>> createJwt({
    required TokenCreateDTO tokenCreateDTO,
  }) async {
    try {
      final result =
          await _remoteDs.createJwt(tokenCreateDTO: tokenCreateDTO);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, int>> resetPassword({required String mail}) async {
    try {
      final result = await _remoteDs.resetPassword(mail: mail);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, void>> resetPasswordConfirm({
    required String sessionId,
    required String newPassword,
    required String reNewPassword,
  }) async {
    try {
      await _remoteDs.resetPasswordConfirm(
        sessionId: sessionId,
        newPassword: newPassword,
        reNewPassword: reNewPassword,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> confirmCode({
    required ActivateUserDTO activateUserDTO,
  }) async {
    try {
      final result =
          await _remoteDs.confirmCode(activateUserDTO: activateUserDTO);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> resendActivation({
    required String email,
  }) async {
    try {
      final result = await _remoteDs.resendActivation(email: email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
