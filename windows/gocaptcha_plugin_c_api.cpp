#include "include/gocaptcha/gocaptcha_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "gocaptcha_plugin.h"

void GocaptchaPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  gocaptcha::GocaptchaPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
