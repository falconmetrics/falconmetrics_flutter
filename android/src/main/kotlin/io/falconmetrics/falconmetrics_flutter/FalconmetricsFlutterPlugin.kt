package io.falconmetrics.falconmetrics_flutter

import io.falconmetrics.sdk.FalconMetrics
import io.falconmetrics.sdk.FalconMetricsSdk
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FalconmetricsFlutterPlugin */
class FalconmetricsFlutterPlugin : FlutterPlugin, MethodCallHandler {

    private lateinit var channel: MethodChannel

    private lateinit var falconMetrics: FalconMetrics

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "falconmetrics_flutter")
        falconMetrics = FalconMetricsSdk.create(flutterPluginBinding.applicationContext)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "init") {
            val apiKey = call.argument<String>("apiKey") ?: ""
            falconMetrics.init(apiKey)
            result.success(null)
        } else if (call.method == "trackEvent") {
            val event = call.arguments as ByteArray
            val tmp = convertTrackingEvent(Event.TrackingEvent.parseFrom(event))

            falconMetrics.trackEvent(tmp)

            result.success(null)


        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
