package com.example.appgainsdk

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.ProcessLifecycleOwner
import com.google.gson.Gson
import io.appgain.sdk.controller.Appgain
import io.appgain.sdk.controller.AppgainPushReceiver
import io.appgain.sdk.interfaces.AppgainDataCallback
import io.appgain.sdk.model.BaseResponse
import io.appgain.sdk.model.deferredlinking.DeferredDeepLinkingResponse
import io.appgain.sdk.model.push.ReceiveStatus
import io.flutter.app.FlutterApplication
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.Appgain.io/AppgainSDK"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // Note: this method is invoked on the main thread.
            call, result ->
            when(call.method){
                "logEvent" -> {
                    val action: String = call.argument<String>("action")?:""
                    val event: String = call.argument<String>("event")?:""
                    val extras: HashMap<String, String> = call.argument<HashMap<String, String>>("extras")?: hashMapOf()
                    val bundle = Bundle()
                    for(key in extras.keys.toList()) {
                        bundle.putString(key, extras.get(key))
                    }
                    Appgain.logEvent(action, event, bundle, object : AppgainDataCallback<Void> {
                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }
                    })
                }
                "initSDK" -> {
                    val apiKey: String = call.argument<String>("apiKey")?:""
                    val appId: String = call.argument<String>("appId")?:""
                    print( "==> "+ apiKey)
                    print( "==> "+ appId)
                    Appgain.enableLog()
                    Appgain.initialize(this, appId, apiKey, true,
                            object : AppgainDataCallback<Void> {
                                override fun onFailure(failure: BaseResponse?) {
                                    result.error("", "", Gson().toJson(failure))

                                }

                                override fun onSuccess(data: Void?) {
                                    result.success(null)
                                }
                            }
                    )
                }
                "getUserID" -> {
                    val userId = Appgain.getUserId()
                    result.success(userId)
                }
                "matchLink" -> {
                    Appgain.matchLink(object : AppgainDataCallback<DeferredDeepLinkingResponse> {
                        override fun onSuccess(data: DeferredDeepLinkingResponse?) {
                            if (data != null) {
                                result.success(Gson().toJson(data))
                            }
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "fireAutomatorWithPersonalization" -> {
                    val triggerPoint: String = call.argument<String>("triggerPointName")?:""
                    val personalizationData: HashMap<String, String> = call.argument<HashMap<String, String>>("personalizationMap")?: hashMapOf()
                    Appgain.fireAutomator(triggerPoint, personalizationData, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "fireAutomator" -> {
                    val triggerPoint: String = call.argument<String>("triggerPointName")?:""
                    Appgain.fireAutomator(triggerPoint, HashMap<String, String>(), object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "setuserId" -> {
                    val userId: String = call.argument<String>("userId")?:""
                    Appgain.updateUserId(userId, object : AppgainDataCallback<String> {
                        override fun onSuccess(data: String?) {
                            result.success(data)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }

                    })
                }
                "addPurchase" -> {
                    val productName: String = call.argument<String>("productName")?:""
                    val amount: Double = call.argument<Double>("amount")?:0.0
                    val currency: String = call.argument<String>("curruncy")?:""
                    Appgain.logPurchase(productName, amount.toFloat(), currency, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                "enableReciveNotification" -> {
                    val enable: Boolean = call.argument<Boolean>("enable")?:true
                    val channel: String = call.argument<String>("type")?:""
                    Appgain.enableNotifications(enable, channel, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                "addNotificationChannel" -> {
                    val channel: String = call.argument<String>("notificationType")?:""
                    val data: String = call.argument<String>("item")?:""
                    Appgain.createNotificationChannel(channel, data, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                            print("success")
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                            print(Gson().toJson(failure))

                        }
                    })
                }
                "updateUser" -> {
                    val userData = call.argument<HashMap<String, String>>("userData")?: hashMapOf()
                    Appgain.updateUserData(userData, object : AppgainDataCallback<Void> {
                        override fun onSuccess(data: Void?) {
                            result.success(null)
                        }

                        override fun onFailure(failure: BaseResponse?) {
                            result.error("", "", Gson().toJson(failure))
                        }
                    })
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}

class PushReceiver : AppgainPushReceiver() {
    override fun onReceive(context: Context?, receiveStatus: ReceiveStatus?, intent: Intent?) {

    }
}
class FlutterTestApp : FlutterApplication(), LifecycleObserver {
    override fun onCreate() {

        super.onCreate()
        ProcessLifecycleOwner.get().getLifecycle().addObserver(this)
    }
    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    fun onAppBackgrounded() {
        Appgain.onAppBackgrounded()
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    fun onAppForegrounded() {
        Appgain.onAppForegrounded()
    }
}