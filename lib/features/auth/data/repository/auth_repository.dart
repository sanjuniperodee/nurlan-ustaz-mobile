import 'package:dartz/dartz.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/remote/auth_remote_ds.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserDto>> postUser({required UserDto userDTO});
  Future<Either<Failure, UserDto>> updateUser({
    required UserDto user,
    String? avatarPath,
  });
  Future<Either<Failure, TokenDTO>> refreshJwt(TokenDTO tokens);
  Future<Either<Failure, void>> activateUser({
    required ActivateUserDTO activateUserDTO,
  });
  Future<Either<Failure, void>> deleteUser();
  Future<Either<Failure, bool>> changePass({
    required String curPass,
    required String newPass,
    required String pass,
  });
  Future<Either<Failure, TokenDTO>> createJwt({
    required TokenCreateDTO tokenCreateDTO,
  });
  Future<Either<Failure, int>> resetPassword({required String mail});
  Future<Either<Failure, void>> resetPasswordConfirm({
    required String sessionId,
    required String newPassword,
    required String reNewPassword,
  });
  Future<Either<Failure, String>> confirmCode({
    required ActivateUserDTO activateUserDTO,
  });
  Future<Either<Failure, String>> resendActivation({required String email});
}
