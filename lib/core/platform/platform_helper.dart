import 'platform_helper_stub.dart' if (dart.library.io) 'platform_helper_io.dart'
    as platform_helper_impl;

mixin PlatformHelper {
  static String get operatingSystem =>
      platform_helper_impl.getOperatingSystem();
}
