package com.example.reversed_channel

import android.app.Service
import android.content.Intent
import android.os.Handler
import android.os.IBinder
import android.widget.Toast

class MyService : Service() {

    var handler = Handler()

    override fun onCreate() {
        super.onCreate()

        handler.postDelayed(object : Runnable {
            override fun run() {
                ///Call Flutter
                MainActivity.callFlutterMethod()

                handler.postDelayed(this, 5000)
            }
        }, 0)

    }

    override fun onBind(intent: Intent): IBinder? {
        return null
    }
}