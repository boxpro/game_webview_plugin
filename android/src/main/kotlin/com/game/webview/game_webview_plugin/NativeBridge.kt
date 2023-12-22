package com.game.webview.game_webview_plugin

import android.util.Log
import android.webkit.JavascriptInterface
import com.google.gson.Gson
import org.json.JSONObject


class NativeBridge internal constructor(
    private val context: GameWebView
) {

    @JavascriptInterface
    fun getConfig(params: String) {
        val obj = JSONObject(params)
        val jsFunName = obj.optString("jsCallback")
        val getConfigData = GetConfigData()
        getConfigData.appChannel = "notaclub"
        getConfigData.appId = 7706836862.toInt()
        getConfigData.userId = "2921000016"
        getConfigData.code = "4dd717373ad94b6000239ca3eee027f1"
        getConfigData.roomId = "2921000016"
        getConfigData.gameMode = "3"
        getConfigData.language = "2"
        getConfigData.gameConfig.sceneMode = 0
        getConfigData.gameConfig.currencyIcon = ""
        getConfigData.gsp = 101
        val str = jsFunName + "(" + Gson().toJson(getConfigData) + ")"
        this.context.callJs(str)
    }

    @JavascriptInterface
    fun gameRecharge(params: String) {
        Log.d("BSGAME", "游戏调用 gameRecharge");
    }

    @JavascriptInterface
    fun gameLoaded(params: String) {
        Log.d("BSGAME", "游戏调用 gameLoad");
    }

    @JavascriptInterface
    fun destroy(params: String) {
        Log.d("BSGAME", "游戏调用 destroy");
    }

}