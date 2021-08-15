package com.example.reversed_channel

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {


    private var CHANNEL = "reversed";


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterContext = flutterEngine

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, _ ->

            if (call.method == "Start_Service") {
                //Start service intent
                val service_intent = Intent(this, MyService::class.java)
                startService(service_intent)

            }

        }
    }

    companion object {
        private lateinit var flutterContext: FlutterEngine

        fun callFlutterMethod() {
            MethodChannel(flutterContext.dartExecutor.binaryMessenger, "callMrFlutter")
                    .invokeMethod("showToast", "")
        }
    }
}
