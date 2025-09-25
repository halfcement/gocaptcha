
import 'gocaptcha_platform_interface.dart';
class Gocaptcha {
  Future<String?> getPlatformVersion() {
    return GocaptchaPlatform.instance.getPlatformVersion();
  }
}
