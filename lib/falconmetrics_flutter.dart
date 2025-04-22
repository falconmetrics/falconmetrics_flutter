import 'package:falconmetrics_flutter/events.dart';

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
  Future<void> init({required String apiKey}) {
    return FalconmetricsFlutterPlatform.instance.init(apiKey: apiKey);
  }

  /// Tracks a conversion event
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
}
