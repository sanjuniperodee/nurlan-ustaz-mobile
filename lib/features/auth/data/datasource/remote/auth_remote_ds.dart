import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/platform/network_helper.dart';

abstract class AuthRemoteDs {
  Future<UserDto> postUser({required UserDto userDTO});

  Future<UserDto> updateUser({required UserDto user, String? avatarPath});

  Future<TokenDTO> refreshJwt(TokenDTO tokens);

  Future<void> activateUser({required ActivateUserDTO activateUserDTO});

  Future<void> deleteUser();

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

@Singleton(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  AuthRemoteDsImpl(this.dio);

  final Dio dio;

  @override
  Future<UserDto> postUser({required UserDto userDTO}) async {
    final user = userDTO.toJson();
    user.removeWhere((key, value) => value == null);
    final response = await dio.post(EndPoints.createUser, data: user);

    return UserDto.fromJson(response.data);
  }

  @override
  Future<UserDto> updateUser({
    required UserDto user,
    String? avatarPath,
  }) async {
    final json = user.toJson();
    json
      ..remove('avatar')
      ..remove('is_staff');
    final FormData formData = FormData.fromMap(json);
    if (avatarPath != null) {
      formData.files.add(
        MapEntry(
          'avatar',
          await MultipartFile.fromFile(avatarPath),
        ),
      );
    }
    final response = await dio.patch(EndPoints.currentUser, data: formData);

    return UserDto.fromJson(response.data);
  }

  @override
  Future<TokenDTO> createJwt({required TokenCreateDTO tokenCreateDTO}) async {
    final response = await dio.post(
      EndPoints.createToken,
      data: tokenCreateDTO.toJson(),
    );
    return TokenDTO.fromJson(response.data);
  }

  @override
  Future<void> activateUser({required ActivateUserDTO activateUserDTO}) async {
    await dio.post(
      EndPoints.activateUser,
      data: activateUserDTO.toJson(),
    );
  }

  @override
  Future<bool> changePass({
    required String curPass,
    required String newPass,
    required String pass,
  }) async {
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
  }

  @override
  Future<void> deleteUser() async => dio.delete(EndPoints.currentUser);

  @override
  Future<int> resetPassword({required String mail}) async {
    final response = await dio.post(
      EndPoints.resetPassword,
      data: {
        'email': mail,
      },
    );
    final body = response.data as Map<String, dynamic>;
    return int.parse(body['user_id'].toString());
  }

  @override
  Future<void> resetPasswordConfirm({
    required String sessionId,
    required String newPassword,
    required String reNewPassword,
  }) async {
    await dio.post(
      EndPoints.resetPasswordConfirm,
      data: {
        'session_id': sessionId,
        'new_password': newPassword,
        're_new_password': reNewPassword,
      },
    );
  }

  @override
  Future<String> confirmCode({required ActivateUserDTO activateUserDTO}) async {
    final response = await dio.post(
      EndPoints.resetConfirmCode,
      data: {
        'user_id': "${activateUserDTO.userId}",
        "code": "${activateUserDTO.code}",
      },
    );
    final data = response.data as Map<String, dynamic>;
    return data['session_id'].toString();
  }

  @override
  Future<String> resendActivation({required String email}) async {
    await dio.post(
      EndPoints.resendActivation,
      data: {
        'email': email,
      },
    );
    return ('success');
  }

  @override
  Future<TokenDTO> refreshJwt(TokenDTO tokens) async {
    final response = await dio.post(
      EndPoints.refreshToken,
      data: {'refresh': tokens.refresh},
    );

    return TokenDTO.fromJson(response.data);
  }
}
