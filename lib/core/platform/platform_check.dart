// Platform check abstraction for web compatibility.
// Uses conditional imports: io implementation on native, stub on web.
import 'platform_check_stub.dart' if (dart.library.io) 'platform_check_io.dart'
    as platform_check;

bool get isIOS => platform_check.isIOS;
bool get isAndroid => platform_check.isAndroid;
bool get isMacOS => platform_check.isMacOS;
