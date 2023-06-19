import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

import '../../../../../core/error/excepteion.dart';
import '../../../../../core/platform/network_helper.dart';

const _tag = 'AuthRemoteDS';

abstract class AuthRemoteDs {
  Future<UserDTO> postUser({required UserDTO userDTO});

  Future<UserDTO> getUser();
  Future<bool> activateUser({required ActivateUserDTO activateUserDTO});
  Future<bool> changePass(
      {required String curPass, required String newPass, required String pass});

  Future<TokenDTO> createJwt({required TokenCreateDTO tokenCreateDTO});
  Future<TokenDTO> refreshJwt({required String refreshToken});
}

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;

  AuthRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }

  @override
  Future<UserDTO> postUser({required UserDTO userDTO}) async {
    try {
      final response = await dio.post(
        EndPoints.createUser,
        data: userDTO.toJson(),
      );

      return UserDTO.fromJson(response.data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserDTO> getUser() async {
    try {
      final response = await dio.get(
        '${EndPoints.createUser}/me/',
      );

      return UserDTO.fromJson(response.data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TokenDTO> createJwt({required TokenCreateDTO tokenCreateDTO}) async {
    try {
      print('hello');
      final response = await dio.post(
        EndPoints.createToken,
        data: tokenCreateDTO.toJson(),
      );
      return TokenDTO.fromJson(response.data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> activateUser({required ActivateUserDTO activateUserDTO}) async {
    try {
      final result = await dio.post(
        EndPoints.activateUser,
        data: activateUserDTO.toJson(),
      );
      return true;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<bool> changePass(
      {required String curPass,
      required String newPass,
      required String pass}) async {
    try {
      final result = await dio.post(
        EndPoints.newPass,
        data: {
          'new_password': newPass,
          're_new_password': pass,
          'current_password': curPass,
        },
      );
      log(curPass.toString());
      log(newPass.toString());
      log(pass.toString());
      return true;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TokenDTO> refreshJwt({required String refreshToken}) async {
    try {
      final response = await dio.post(
        EndPoints.refreshToken,
        data: {
          'refresh': refreshToken,
        },
      );
      return TokenDTO.fromJson(response.data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
