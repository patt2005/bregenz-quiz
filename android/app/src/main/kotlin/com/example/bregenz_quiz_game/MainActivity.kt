package com.example.bregenz_quiz_game

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/user_agent"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Make sure the flutterEngine is initialized and non-null
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getUserAgent") {
                val userAgent = System.getProperty("http.agent")
                result.success(userAgent)
            } else {
                result.notImplemented()
            }
        }
    }
}
