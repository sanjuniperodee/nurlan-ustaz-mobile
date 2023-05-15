
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/dio_wrapper.dart';

const _tag = 'AuthRemoteDS';

abstract class AuthRemoteDs {}

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImpl extends AuthRemoteDs {
  late final Dio dio;
  final DioWrapper dioWrapper;
  AuthRemoteDsImpl(this.dioWrapper) {
    dioWrapper.path('');
    dio = dioWrapper.dio;
  }
}
