

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



typedef FlutterWebViewCreatedCallback = void Function(
    WebViewController controller);

class TestH5Page extends StatelessWidget {
  final FlutterWebViewCreatedCallback onMapViewCreated;

  TestH5Page({super.key, required this.onMapViewCreated});

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: 'game_webview_plugin',
      onPlatformViewCreated: (id) {},
    );
  }
}


// WebView Controller class to set url etc
class WebViewController {
  WebViewController._(int id) : _channel =MethodChannel('game_webview_plugin_$id');
  final MethodChannel _channel;
  Future<void> setUrl({required String url}) async {
    return _channel.invokeMethod('setUrl', url);
  }
}