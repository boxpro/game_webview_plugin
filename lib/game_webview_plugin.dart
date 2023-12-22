
import 'game_webview_plugin_platform_interface.dart';

class GameWebviewPlugin {
  Future<String?> getPlatformVersion() {
    return GameWebviewPluginPlatform.instance.getPlatformVersion();
  }
}
