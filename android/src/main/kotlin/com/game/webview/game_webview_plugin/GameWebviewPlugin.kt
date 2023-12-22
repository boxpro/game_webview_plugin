package com.game.webview.game_webview_plugin
import io.flutter.embedding.engine.plugins.FlutterPlugin
/** GameWebviewPlugin */
class GameWebviewPlugin : FlutterPlugin {
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "game_webview_plugin", GameWebViewFactory(flutterPluginBinding.binaryMessenger)
        )
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        TODO("Not yet implemented")
    }
}
