package io.falconmetrics.falconmetrics_flutter

import android.content.Context
import io.falconmetrics.sdk.FalconMetrics
import io.falconmetrics.sdk.FalconMetricsSdk
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import pb.Event

/** FalconmetricsFlutterPlugin */
class FalconmetricsFlutterPlugin : FlutterPlugin, MethodCallHandler {

    private lateinit var channel: MethodChannel

    private lateinit var falconMetrics: FalconMetrics
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "io.falconmetrics.falconmetrics_flutter"
        )
        falconMetrics = FalconMetricsSdk.create(flutterPluginBinding.applicationContext)
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "init") {
            val apiKey = call.argument<String>("apiKey")
            val fbAppId = call.argument<String>("fbAppId")
            if (apiKey == null) {
                result.error("INVALID_ARGUMENTS", "ApiKey argument is required", null)
                return
            }
            falconMetrics.init(apiKey, fbAppId)
            result.success(null)
        } else if (call.method == "setDebugLoggingEnabled") {
           val enabled = call.argument<Boolean>("enabled")
            if (enabled == null) {
                result.error("INVALID_ARGUMENTS", "Enabled argument is required", null)
                return
            }
            falconMetrics.setDebugLogging(enabled)
            result.success(null)
        } else if (call.method == "trackEvent") {
            val event = call.arguments as ByteArray
            val tmp = convertTrackingEvent(Event.TrackingEvent.parseFrom(event))
            falconMetrics.trackEvent(tmp)
            result.success(null)
        } else if (call.method == "setTrackingEnabled") {
            val enabled = call.arguments as Boolean
            falconMetrics.setTracking(context, enabled)
            result.success(null)
        } else if (call.method == "isTrackingEnabled") {
            result.success(falconMetrics.isTrackingEnabled(context))
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
