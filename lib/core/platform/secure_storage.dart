import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: temporaty wrapper, the purpose of which is to make the app launch on macos.
// FlutterSecureStorage requires signing the app with a developer certificate,
// which is currently not possible, so on macos instead of FlutterSecureStorage
// will be used SharedPreferences.
@Singleton()
final class SecureStorage {
  const SecureStorage({
    required this.preferences,
    required this.secureStorage,
  });

  @protected
  final SharedPreferences preferences;

  @protected
  final FlutterSecureStorage secureStorage;

  Future<String?> read(String key) async {
    if (Platform.isMacOS) {
      return preferences.getString(key);
    }

    return secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    if (Platform.isMacOS) {
      await preferences.remove(key);
      return;
    }

    return secureStorage.delete(key: key);
  }

  Future<void> write({required String key, required String value}) async {
    if (Platform.isMacOS) {
      await preferences.setString(key, value);
      return;
    }

    return secureStorage.write(key: key, value: value);
  }
}
