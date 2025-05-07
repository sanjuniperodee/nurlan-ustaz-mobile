import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload2.dart';

import '../../../../../core/error/excepteion.dart';
import '../../../../../core/platform/network_helper.dart';

const _tag = 'AuthRemoteDS';

abstract class AuthRemoteDs {
  Future<UserPayload> postUser({required UserPayload userDTO});

  Future<UserDto> rename({required UserPayload2 user, XFile? avatar});

  Future<UserDto> getUser();

  Future<bool> activateUser({required ActivateUserDTO activateUserDTO});

  Future<bool> deleteUser();

  Future<bool> changePass(
      {required String curPass, required String newPass, required String pass});

  Future<TokenDTO> createJwt({required TokenCreateDTO tokenCreateDTO});

  Future<int> resetPassword({required String mail});

  Future<void> resetPasswordConfirm(
      {required String sessionId,
      required String newPassword,
      required String reNewPassword});
  Future<String> confirmCode({required ActivateUserDTO activateUserDTO});
  Future<String> resendActivation({required String email});
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
      final user = userDTO.toJson();
      user.removeWhere((key, value) => value == null);
      final response = await dio.post(EndPoints.createUser, data: user);

      return UserPayload.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<UserDto> rename({
    required UserPayload2 user,
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
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<UserDto> getUser() async {
    try {
      final response = await dio.get(
        '${EndPoints.createUser}/me/',
      );
      log(response.data.toString());
      return UserDto.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<TokenDTO> createJwt({required TokenCreateDTO tokenCreateDTO}) async {
    try {
      final response = await dio.post(
        EndPoints.createToken,
        data: tokenCreateDTO.toJson(),
      );
      return TokenDTO.fromJson(response.data);
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> activateUser({required ActivateUserDTO activateUserDTO}) async {
    try {
      await dio.post(
        EndPoints.activateUser,
        data: activateUserDTO.toJson(),
      );
      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> changePass(
      {required String curPass,
      required String newPass,
      required String pass}) async {
    try {
      await dio.post(
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
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      await dio.delete(
        '${EndPoints.createUser}me/',
      );

      return true;
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<int> resetPassword({required String mail}) async {
    try {
      final response = await dio.post(
        EndPoints.resetPassword,
        data: {
          'email': mail,
        },
      );
      final body = response.data as Map<String, dynamic>;
      log(body.toString());
      return int.parse(body['user_id'].toString());
    } catch (e) {
      throw ServerException(
        message: 'пользователь не зарегестрирован',
      );
    }
  }

  @override
  Future<void> resetPasswordConfirm(
      {required String sessionId,
      required String newPassword,
      required String reNewPassword}) async {
    try {
      await dio.post(
        EndPoints.resetPasswordConfirm,
        data: {
          'session_id': sessionId,
          'new_password': newPassword,
          're_new_password': reNewPassword,
        },
      );
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<String> confirmCode({required ActivateUserDTO activateUserDTO}) async {
    try {
      final response = await dio.post(
        EndPoints.resetConfirmCode,
        data: {
          'user_id': "${activateUserDTO.userId}",
          "code": "${activateUserDTO.code}",
        },
      );
      final data = response.data as Map<String, dynamic>;
      return data['session_id'].toString();
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<String> resendActivation({required String email}) async {
    try {
      await dio.post(
        EndPoints.resendActivation,
        data: {
          'email': email,
        },
      );
      return ('success');
    } on DioError catch (e) {
      throw ServerException(
        message:
            (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }
}
