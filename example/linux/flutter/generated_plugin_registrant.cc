//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <gocaptcha/gocaptcha_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) gocaptcha_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GocaptchaPlugin");
  gocaptcha_plugin_register_with_registrar(gocaptcha_registrar);
}
