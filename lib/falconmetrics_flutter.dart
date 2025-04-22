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

  /// ANDROID ONLY: Enables or disables tracking events
  ///
  /// On iOS we use Skadnetwork that is privacy aware already and cannot be
  /// disabled by this SDK.
  Future<void> setTrackingEnabled({required bool enabled}) {
    return FalconmetricsFlutterPlatform.instance.setTrackingEnabled(
      enabled: enabled,
    );
  }

  /// ANDROID ONLY: Checks if tracking is enabled
  Future<bool> isTrackingEnabled() {
    return FalconmetricsFlutterPlatform.instance.isTrackingEnabled();
  }
}
