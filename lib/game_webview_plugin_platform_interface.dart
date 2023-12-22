import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'game_webview_plugin_method_channel.dart';

abstract class GameWebviewPluginPlatform extends PlatformInterface {
  /// Constructs a GameWebviewPluginPlatform.
  GameWebviewPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static GameWebviewPluginPlatform _instance = MethodChannelGameWebviewPlugin();

  /// The default instance of [GameWebviewPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelGameWebviewPlugin].
  static GameWebviewPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GameWebviewPluginPlatform] when
  /// they register themselves.
  static set instance(GameWebviewPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
