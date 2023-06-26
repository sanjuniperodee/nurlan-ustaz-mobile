import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';

import '../../../../../core/error/excepteion.dart';
import '../../../../../core/platform/network_helper.dart';

const _tag = 'AuthRemoteDS';

abstract class AuthRemoteDs {
  Future<UserPayload> postUser({required UserPayload userDTO});
  Future<UserDto> rename({required UserPayload user, XFile? avatar});

  Future<UserDto> getUser();
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
  Future<UserPayload> postUser({required UserPayload userDTO}) async {
    try {
      final response = await dio.post(
        EndPoints.createUser,
        data: userDTO.toJson(),
      );

      return UserPayload.fromJson(response.data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserDto> rename({
    required UserPayload user,
    XFile? avatar,
  }) async {
    try {
      final FormData formData = FormData.fromMap(
        user.toJson(),
      );
      if (avatar != null) {
        formData.files.add(
          MapEntry(
            'avatar',
            await MultipartFile.fromFile(avatar.path),
          ),
        );
        log("Path:::${avatar.path}");
      }
      final response = await dio.patch(
        '${EndPoints.createUser}me/',
        data: formData,
      );

      return UserDto.fromJson(response.data);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserDto> getUser() async {
    try {
      final response = await dio.get(
        '${EndPoints.createUser}/me/',
      );

      return UserDto.fromJson(response.data);
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
