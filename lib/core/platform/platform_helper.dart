import 'dart:io';

mixin PlatformHelper {
  static String get operatingSystem {
    if (Platform.isMacOS) return 'ios';
    return Platform.operatingSystem;
  }
}
