
import 'package:flutter/cupertino.dart';
import 'package:gocaptcha/slide_captcha.dart';
import 'package:gocaptcha/slide_captcha_model.dart';

import 'gocaptcha_platform_interface.dart';
class Gocaptcha {
  Future<String?> getPlatformVersion() {
    return GocaptchaPlatform.instance.getPlatformVersion();
  }
}
