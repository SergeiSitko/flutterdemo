package com.example.flutter_demo_app;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;

class Application : FlutterApplication(), PluginRegistrantCallback {

    override fun registerWith(registry: PluginRegistry?) {
        registry?.registrarFor("com.iotecksolutions.background_location_fetch.BackgroundLocationFetchPlugin");
    }
}