import Flutter
import UIKit
import FalconMetrics
import SwiftProtobuf

public class FalconmetricsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "falconmetrics_flutter", binaryMessenger: registrar.messenger())
    let instance = FalconmetricsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
    switch call.method {
    case "init":
        guard let args = call.arguments as? [String: Any],
                      let apiKey = args["apiKey"] as? String else {
                    result(FlutterError(
                        code: "INVALID_ARGUMENTS",
                        message: "API key is required",
                        details: nil
                    ))
                    return
                }
                Task {
                    await FalconMetricsSdk.shared.initialize(apiKey: apiKey)
                }

        result(nil)
    case "trackEvent":
        guard let eventData = call.arguments as? FlutterStandardTypedData else {
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Expected byte array", details: nil))
                return
            }
            do {
                // Step 1: Deserialize from protobuf
                let protoEvent = try Pb_TrackingEvent(serializedData: eventData.data)

                // Step 2: Convert to SDK tracking event
                let builder = try convertTrackingEvent(event: protoEvent)

                // Step 3: Start tracking in background
                Task.detached {
                    await builder.track()
                }
                
                // Return immediately without waiting for tracking to complete
                result(nil)
            } catch {
                result(FlutterError(code: "PARSE_ERROR", message: "Failed to parse TrackingEvent", details: error.localizedDescription))
            }
    case "setTrackingEnabled":
        // This function only works on android and shouldn't do anything on iOS because we depend on skad
        result(nil)
    case "isTrackingEnabled":
        // This function only works on android and shouldn't do anything on iOS because we depend on skad
        result(true)
    default:
        result(nil)
    }
  }
}
