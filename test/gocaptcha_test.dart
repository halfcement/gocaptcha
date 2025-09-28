import 'package:flutter_test/flutter_test.dart';
import 'package:gocaptcha/gocaptcha.dart';
import 'package:gocaptcha/gocaptcha_platform_interface.dart';
import 'package:gocaptcha/gocaptcha_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGocaptchaPlatform
    with MockPlatformInterfaceMixin
    implements GocaptchaPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GocaptchaPlatform initialPlatform = GocaptchaPlatform.instance;

  test('$MethodChannelGocaptcha is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGocaptcha>());
  });

  test('getPlatformVersion', () async {
    Gocaptcha gocaptchaPlugin = Gocaptcha();
    MockGocaptchaPlatform fakePlatform = MockGocaptchaPlatform();
    GocaptchaPlatform.instance = fakePlatform;

    expect(await gocaptchaPlugin.getPlatformVersion(), '42');
  });
}
