import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:game_webview_plugin/game_webview_plugin.dart';

void main() {
  runApp(const MyApp());
}

typedef FlutterWebViewCreatedCallback = void Function(WebViewController controller);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: AndroidView(
          viewType: 'game_webview_plugin',
          onPlatformViewCreated: (id) {

          },
        )
      ),
    );
  }
}


// Callback method when platform view is created
void _onPlatformViewCreated(int id) => onMapViewCreated(WebViewController._(id));

class WebViewController {
  WebViewController._(int id)
      : _channel =
  MethodChannel('game_webview_plugin_$id');

  final MethodChannel _channel;

  Future<void> setUrl({required String url}) async {
    return _channel.invokeMethod('setUrl', url);
  }

}