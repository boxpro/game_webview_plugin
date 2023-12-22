import 'package:flutter_test/flutter_test.dart';
import 'package:game_webview_plugin/game_webview_plugin.dart';
import 'package:game_webview_plugin/game_webview_plugin_platform_interface.dart';
import 'package:game_webview_plugin/game_webview_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGameWebviewPluginPlatform
    with MockPlatformInterfaceMixin
    implements GameWebviewPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GameWebviewPluginPlatform initialPlatform = GameWebviewPluginPlatform.instance;

  test('$MethodChannelGameWebviewPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGameWebviewPlugin>());
  });

  test('getPlatformVersion', () async {
    GameWebviewPlugin gameWebviewPlugin = GameWebviewPlugin();
    MockGameWebviewPluginPlatform fakePlatform = MockGameWebviewPluginPlatform();
    GameWebviewPluginPlatform.instance = fakePlatform;

    expect(await gameWebviewPlugin.getPlatformVersion(), '42');
  });
}
