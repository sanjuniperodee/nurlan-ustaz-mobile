import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/platform/secure_storage.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:re_seedwork/re_seedwork.dart';

abstract class AuthLocalDs extends OptionalValueStore<TokenDTO> {
  Future<void> saveToken(TokenDTO token);

  Future<Optional<TokenDTO>> getToken({bool forceFromStorage = false});

  Future<void> removeToken();
}

@Singleton(as: AuthLocalDs)
class AuthLocalDsImpl extends InMemoryOptionalValueStore<TokenDTO>
    implements AuthLocalDs {
  AuthLocalDsImpl({
    required this.secureStorage,
    @ignoreParam TokenDTO? initialValue,
  }) : super(initialValue);

  @FactoryMethod(preResolve: true)
  static Future<AuthLocalDsImpl> init({
    required SecureStorage secureStorage,
  }) async {
    final ds = AuthLocalDsImpl(
      secureStorage: secureStorage,
    );
    await ds.getToken(forceFromStorage: true);
    return ds;
  }

  final SecureStorage secureStorage;

  @override
  Future<void> saveToken(TokenDTO token) async {
    await secureStorage.write(
      key: SharedKeys.TOKEN,
      value: jsonEncode(token.toJson()),
    );
    add(Optional.presented(token));
  }

  @override
  Future<Optional<TokenDTO>> getToken({
    bool forceFromStorage = false,
  }) async {
    if (forceFromStorage) {
      final string = await secureStorage.read(SharedKeys.TOKEN);

      final token =
          string == null ? null : TokenDTO.fromJson(jsonDecode(string));
      add(Optional(token));
    }

    return data;
  }

  @override
  Future<void> removeToken() async {
    await secureStorage.delete(SharedKeys.TOKEN);
    await flush();
  }
}
