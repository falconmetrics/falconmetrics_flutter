import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';

import 'platform/falconmetrics_flutter_platform_interface.dart';

/// The main class for the Falconmetrics Flutter plugin.
///
/// Make sure to call [init] before using the plugin to ensure everything is
/// initialised correctly.
class FalconmetricsFlutter {
  /// Initialise the falconmetrics sdk for your app. The earlier in the application
  /// you call this method, the better.
  ///
  /// Supply your unique [apiKey] to initialise the plugin for your app.
  /// Optionally supply your [fbAppId] to enable meta referrer support.
  Future<void> init({required String apiKey, String? fbAppId}) {
    return FalconmetricsFlutterPlatform.instance.init(
      apiKey: apiKey,
      fbAppId: fbAppId,
    );
  }

  /// Enable or disable debug logging
  ///
  /// Use [enabled] to enable or disable debug logging.
  Future<void> setDebugLoggingEnabled({required bool enabled}) {
    return FalconmetricsFlutterPlatform.instance.setDebugLoggingEnabled(
      enabled: enabled,
    );
  }

  /// Tracks a conversion event
  ///
  /// Use [event] to track a conversion event.
  Future<void> trackEvent({required TrackingEvent event}) {
    return FalconmetricsFlutterPlatform.instance.trackEvent(event: event);
  }

  /// Enables or disables tracking functionality.
  ///
  /// Note: This is primarily for Android. iOS uses a privacy-aware Skadnetwork
  /// that cannot be disabled through this SDK.
  Future<void> setTrackingEnabled({required bool enabled}) {
    return FalconmetricsFlutterPlatform.instance.setTrackingEnabled(
      enabled: enabled,
    );
  }

  /// Returns whether tracking is currently enabled.
  ///
  /// Defaults to `true` if the native platform returns null.
  ///
  /// Note: This is primarily for Android. iOS uses a privacy-aware Skadnetwork
  /// that cannot be disabled through this SDK.
  Future<bool> isTrackingEnabled() {
    return FalconmetricsFlutterPlatform.instance.isTrackingEnabled();
  }

  /// iOS only: Returns the IDFA (Identifier for advertisers) of the device.
  Future<String?> getIDFA() {
    return FalconmetricsFlutterPlatform.instance.getIDFA();
  }

  /// iOS only: Requests the IDFA (Identifier for advertisers) of the device.
  Future<TrackingAuthorizationStatus> requestIDFA() {
    return FalconmetricsFlutterPlatform.instance.requestIDFA();
  }

  /// iOS only: Returns the tracking authorization status of the device.
  Future<TrackingAuthorizationStatus> getTrackingAuthorizationStatus() {
    return FalconmetricsFlutterPlatform.instance
        .getTrackingAuthorizationStatus();
  }
}
