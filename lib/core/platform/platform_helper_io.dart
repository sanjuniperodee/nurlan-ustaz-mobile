import 'dart:io' show Platform;

String getOperatingSystem() {
  if (Platform.isMacOS) return 'ios';
  return Platform.operatingSystem;
}
