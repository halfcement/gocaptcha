import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gocaptcha_method_channel.dart';

abstract class GocaptchaPlatform extends PlatformInterface {
  /// Constructs a GocaptchaPlatform.
  GocaptchaPlatform() : super(token: _token);

  static final Object _token = Object();

  static GocaptchaPlatform _instance = MethodChannelGocaptcha();

  /// The default instance of [GocaptchaPlatform] to use.
  ///
  /// Defaults to [MethodChannelGocaptcha].
  static GocaptchaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GocaptchaPlatform] when
  /// they register themselves.
  static set instance(GocaptchaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
