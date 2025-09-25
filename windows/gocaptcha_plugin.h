#ifndef FLUTTER_PLUGIN_GOCAPTCHA_PLUGIN_H_
#define FLUTTER_PLUGIN_GOCAPTCHA_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace gocaptcha {

class GocaptchaPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  GocaptchaPlugin();

  virtual ~GocaptchaPlugin();

  // Disallow copy and assign.
  GocaptchaPlugin(const GocaptchaPlugin&) = delete;
  GocaptchaPlugin& operator=(const GocaptchaPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace gocaptcha

#endif  // FLUTTER_PLUGIN_GOCAPTCHA_PLUGIN_H_
