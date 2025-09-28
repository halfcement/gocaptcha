import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gocaptcha_platform_interface.dart';

///用于和原生交互的代码,暂时用不到
/// An implementation of [GocaptchaPlatform] that uses method channels.
class MethodChannelGocaptcha extends GocaptchaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gocaptcha');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
