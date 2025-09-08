package io.falconmetrics.falconmetrics_flutter

import android.content.Context
import io.falconmetrics.sdk.FalconMetrics
import io.falconmetrics.sdk.FalconMetricsConfig
import io.falconmetrics.sdk.FalconMetricsSdk
import io.falconmetrics.sdk.IpAddressTracking
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.google.protobuf.InvalidProtocolBufferException
import pb.Event
import pb.Userdata

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
            val ipAddressTracking = call.argument<String>("ipAddressTracking")
            if (apiKey == null) {
                result.error("INVALID_ARGUMENTS", "ApiKey argument is required", null)
                return
            }
            falconMetrics.init(
                apiKey,
                fbAppId,
                FalconMetricsConfig(ipAddressTracking = ipAddressTracking.toIpAddressTracking())
            )
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
            val eventBytes = call.argument<ByteArray>("event")
            val userDataBytes = call.argument<ByteArray>("userData")
            
            if (eventBytes == null) {
                result.error("INVALID_ARGUMENTS", "Missing required 'event' bytes", null)
                return
            }
            
            try {
                val trackingEvent = convertTrackingEvent(Event.TrackingEvent.parseFrom(eventBytes))
                val userData = if (userDataBytes != null) {
                    convertUserData(Userdata.UserData.parseFrom(userDataBytes))
                } else {
                    convertUserData(null)
                }
                
                falconMetrics.trackEvent(trackingEvent, userData)
                result.success(null)
            } catch (e: InvalidProtocolBufferException) {
                result.error("INVALID_PROTOBUF", "Failed to parse protobuf: ${e.message}", null)
            } catch (e: Exception) {
                result.error("TRACK_EVENT_ERROR", "Failed to track event: ${e.message}", null)
            }
        } else if (call.method == "setTrackingEnabled") {
            val enabled = call.argument<Boolean>("trackingEnabled")
            if (enabled == null) {
                result.error("INVALID_ARGUMENTS", "trackingEnabled argument is required", null)
                return
            }
            falconMetrics.setTracking(context, enabled)
            result.success(null)
        } else if (call.method == "isTrackingEnabled") {
            result.success(falconMetrics.isTrackingEnabled(context))
        } else if (call.method == "updateTrackingOptions") {
            val ipAddressTracking = call.argument<String>("ipAddressTracking")
            falconMetrics.updateTrackingOptions(FalconMetricsConfig(ipAddressTracking.toIpAddressTracking()))
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

private fun String?.toIpAddressTracking(): IpAddressTracking {
    return when (this?.lowercase()) {
        "disabled" -> IpAddressTracking.disabled
        "anonymised" -> IpAddressTracking.anonymised
        "full" -> IpAddressTracking.full
        else -> IpAddressTracking.full
    }
}
