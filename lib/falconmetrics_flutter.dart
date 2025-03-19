import 'package:falconmetrics_flutter/events.dart';

import 'falconmetrics_flutter_platform_interface.dart';

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
}
