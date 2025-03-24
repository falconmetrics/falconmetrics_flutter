import Flutter
import UIKit
import falconmetrics_ios
import SwiftProtobuf

public class FalconmetricsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "falconmetrics_flutter", binaryMessenger: registrar.messenger())
    let instance = FalconmetricsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
    let sdk = FalconMetricsSdk.create()
      
    switch call.method {
    case "init":
        sdk.initialize(apiKey: "YOUR_API_KEY")
        result(.success)
        guard let eventData = call.arguments as? FlutterStandardTypedData else {
            throw NSError(domain: "TrackingError", code: 3, userInfo: [NSLocalizedDescriptionKey: "Invalid arguments"])
        }

        let byteArray = eventData.data
        sdk.trackEvent(event: <#T##TrackingEvent#>)
        result(.success)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
