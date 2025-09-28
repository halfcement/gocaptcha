import 'gocaptcha_platform_interface.dart';

/// 默认的类,暂时用不到
class Gocaptcha {
  Future<String?> getPlatformVersion() {
    return GocaptchaPlatform.instance.getPlatformVersion();
  }
}
