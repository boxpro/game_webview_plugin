package com.game.webview.game_webview_plugin

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Color
import android.view.View
import android.webkit.WebView
import android.webkit.WebViewClient
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class GameWebView internal constructor(
    context: Context,
    messenger: BinaryMessenger,
    id: Int
):PlatformView, MethodChannel.MethodCallHandler {
    private val webView: WebView
    private val methodChannel: MethodChannel


    init {
        webView= WebView(context)
        methodChannel = MethodChannel(messenger, "game_webview_plugin_$id")
        methodChannel.setMethodCallHandler(this)
        configWebView()

    }


    @SuppressLint("SetJavaScriptEnabled", "JavascriptInterface")
    fun configWebView(){
        webView.webViewClient = WebViewClient()
        webView.settings.javaScriptEnabled = true
        webView.setBackgroundColor(Color.TRANSPARENT)
        webView.addJavascriptInterface(NativeBridge(this), "NativeBridge");
    }


    override fun getView(): View{
        return  webView
    }

    override fun dispose() {
        TODO("Not yet implemented")
    }

    override fun onMethodCall(p0: MethodCall, p1: MethodChannel.Result) {
        TODO("Not yet implemented")
    }


    fun callJs(str: String) {
        val webview = webView
        webview.post { webView.loadUrl("javascript:$str") }
    }

}
