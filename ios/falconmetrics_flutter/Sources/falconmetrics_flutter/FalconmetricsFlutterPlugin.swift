@preconcurrency import Flutter
import UIKit
import FalconMetrics
import SwiftProtobuf

// Box the FlutterResult to avoid capturing a non-Sendable closure directly in concurrent contexts.
final class ResultBox: @unchecked Sendable {
  let call: FlutterResult
  init(_ result: @escaping FlutterResult) { self.call = result }
}

public class FalconmetricsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "io.falconmetrics.falconmetrics_flutter", binaryMessenger: registrar.messenger())
    let instance = FalconmetricsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping @Sendable FlutterResult) {
      
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
                let ipTracking = args["ipAddressTracking"] as? String? ?? "full"
                Task {
                    await FalconMetricsSdk.shared.initialize(apiKey: apiKey, trackingOptions: TrackingOptions(ipAddressCollection: convertIpTracking(ipTracking: ipTracking)) )
                }

        result(nil)
    case "setDebugLoggingEnabled":
        guard let args = call.arguments as? [String: Any],
              let enabled = args["enabled"] as? Bool else {
            result(FlutterError(
                code: "INVALID_ARGUMENTS",
                message: "Enabled argument is required",
                details: nil
            ))
            return
        }
        
        FalconMetricsSdk.shared.setDebugLogging(enabled: enabled)
        result(nil)
    case "trackEvent":
        // Expecting a map with 'event' and optional 'userData' as protobuf byte arrays
        guard let args = call.arguments as? [String: Any],
              let eventBytes = args["event"] as? FlutterStandardTypedData else {
            result(FlutterError(code: "INVALID_ARGUMENTS", message: "Expected arguments map with 'event' bytes", details: nil))
            return
        }
        do {
            // Step 1: Deserialize from protobufs
            let protoEvent = try Pb_TrackingEvent(serializedData: eventBytes.data)

            var _protoUserData: Pb_UserData? = nil
            if let userDataBytes = args["userData"] as? FlutterStandardTypedData {
                // userData is optional; parse if provided
                _protoUserData = try? Pb_UserData(serializedData: userDataBytes.data)
            }
            
            // Step 2: Convert user data if provided
            var userData: UserData? = nil
            if let protoUserData = _protoUserData {
                userData = convertUserData(protoUserData)
            }

            // Step 3: Convert to SDK tracking event builder
            let builder = try convertTrackingEvent(event: protoEvent)
       
            // Step 4: Start tracking in background
            Task.detached {
                if let userData = userData {
                    await builder.track(userData: userData)
                } else {
                    await builder.track()
                }
            }

            // Return immediately without waiting for tracking to complete
            result(nil)
        } catch {
            result(FlutterError(code: "PARSE_ERROR", message: "Failed to parse TrackingEvent", details: error.localizedDescription))
        }
    case "setTrackingEnabled":
        guard let args = call.arguments as? [String: Any],
              let enabled = args["trackingEnabled"] as? Bool else {
            result(FlutterError(
                code: "INVALID_ARGUMENTS",
                message: "Enabled argument is required",
                details: nil
            ))
            return
        }
        Task{
            await FalconMetricsSdk.shared.setTracking(enabled: enabled)
        }
        result(nil)
    case "isTrackingEnabled":
        let box = ResultBox(result)
        Task {
            let enabled = await FalconMetricsSdk.shared.isTrackingEnabled()
            await MainActor.run { box.call(enabled) }
        }
    case "getIDFA":
        if #available(iOS 14.0, *){
            let idfa =  FalconMetricsSdk.shared.getIDFA()
            result(idfa)
        }else {
            result(FlutterError(code: "INVALID_VERSION", message: "This method is only available on iOS 14.0 and above", details: nil))
        }
    case "updateTrackingOptions":
        guard let args = call.arguments as? [String: Any] else {
                    result(FlutterError(
                        code: "INVALID_ARGUMENTS",
                        message: "Arguments is required",
                        details: nil
                    ))
                    return
                }
                let ipTracking = args["ipAddressTracking"] as? String? ?? "full"
                Task {
                    await FalconMetricsSdk.shared.updateTrackingOptions(trackinOptions: TrackingOptions(ipAddressCollection: convertIpTracking(ipTracking: ipTracking)) )
                }

        result(nil)
    case "getTrackingAuthorizationStatus":
        if #available(iOS 14.0, *){
            let status =  FalconMetricsSdk.shared.getTrackingAuthorizationStatus()
            result(status.rawValue)
        }else {
            result(FlutterError(code: "INVALID_VERSION", message: "This method is only available on iOS 14.0 and above", details: nil))
        }
    case "requestIDFA":
        if #available(iOS 14.0, *){
            let box = ResultBox(result)
            Task {
                let status = await FalconMetricsSdk.shared.requestIDFAPermission()
                await MainActor.run { box.call(status.rawValue) }
            }
        } else {
            result(FlutterError(code: "INVALID_VERSION", message: "This method is only available on iOS 14.0 and above", details: nil))
        }
    default:
        result(nil)
    }
  }
}

private func convertIpTracking(ipTracking: String?) -> IpAddressCollection {
    switch ipTracking?.lowercased() ?? "full" {
        case "full":
            return .full
        case "anonymised":
            return .anonymized
        case "disabled":
            return .disabled
        default:
            return .full
    }
}
