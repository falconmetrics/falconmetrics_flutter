import Flutter
import UIKit
import falconmetrics_ios

public class FalconmetricsFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "falconmetrics_flutter", binaryMessenger: registrar.messenger())
    let instance = FalconmetricsFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
    let sdk = FalconMetricsSdk()
    switch call.method {
    case "getPlatformVersion":
        result(sdk.sayHello())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
