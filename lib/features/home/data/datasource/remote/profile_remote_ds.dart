import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_helper.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

abstract interface class ProfileRemoteDs {
  Future<UserDto> getCurrent();
}

@Injectable(as: ProfileRemoteDs)
final class ProfileRemoteDsImpl implements ProfileRemoteDs {
  const ProfileRemoteDsImpl({required this.client});

  @protected
  final Dio client;

  @override
  Future<UserDto> getCurrent() async {
    final response = await client.get(
      EndPoints.currentUser,
      options: DioHelperMixin.requiresAuthorizationOption,
    );

    return UserDto.fromJson(response.data);
  }
}
