import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/core/platform/secure_storage.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:re_seedwork/re_seedwork.dart';

abstract interface class ProfileLocalDs extends ValueStore<Optional<UserDto>?> {
  Future<void> save(UserDto user);

  Future<Optional<UserDto>> get({bool forceFromStorage = false});

  Future<void> delete();
}

// TODO: есть необходимость хранить пользователя локально?
@Injectable(as: ProfileLocalDs)
final class ProfileLocalDsImpl extends InMemoryValueStore<Optional<UserDto>?>
    implements ProfileLocalDs {
  ProfileLocalDsImpl({
    required this.secureStorage,
    @ignoreParam Optional<UserDto>? initialState,
  }) : super(initialState);

  @protected
  final SecureStorage secureStorage;

  @visibleForTesting
  static const kUserProfileKey = 'UserProfile';

  @override
  Future<void> delete() async {
    await secureStorage.delete(kUserProfileKey);
    add(const Optional.undefined());
  }

  @override
  Future<Optional<UserDto>> get({bool forceFromStorage = false}) async {
    if (data == null || forceFromStorage) {
      final string = await secureStorage.read(kUserProfileKey);
      final user = string != null ? UserDto.fromJson(jsonDecode(string)) : null;
      add(Optional(user));
    }
    return Optional(data?.toNullable);
  }

  @override
  Future<void> save(UserDto user) async {
    await secureStorage.write(
      key: kUserProfileKey,
      value: jsonEncode(user.toJson()),
    );
    add(Optional.presented(user));
  }
}
