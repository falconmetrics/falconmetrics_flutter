import 'package:falconmetrics_flutter/src/events.dart';
import 'package:falconmetrics_flutter/src/model/tracking_authorization_status.dart'
    show TrackingAuthorizationStatus;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'falconmetrics_flutter_method_channel.dart';

abstract class FalconmetricsFlutterPlatform extends PlatformInterface {
  /// Constructs a FalconmetricsFlutterPlatform.
  FalconmetricsFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static FalconmetricsFlutterPlatform _instance =
      MethodChannelFalconmetricsFlutter();

  /// The default instance of [FalconmetricsFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelFalconmetricsFlutter].
  static FalconmetricsFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FalconmetricsFlutterPlatform] when
  /// they register themselves.
  static set instance(FalconmetricsFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Initialise the falconmetrics plugin
  ///
  /// Supply your unique [apiKey] to initialise the plugin for your app.
  /// Optionally supply your [fbAppId] to enable meta referrer support.
  Future<void> init({required String apiKey, String? fbAppId}) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<void> setDebugLoggingEnabled({required bool enabled}) {
    throw UnimplementedError(
      'setDebugLoggingEnabled() has not been implemented.',
    );
  }

  /// Tracks a conversion event
  Future<void> trackEvent({required TrackingEvent event}) {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }

  /// Enables or disables tracking events
  Future<void> setTrackingEnabled({required bool enabled}) {
    throw UnimplementedError('setTrackingEnabled() has not been implemented.');
  }

  /// Checks if tracking is enabled
  Future<bool> isTrackingEnabled() {
    throw UnimplementedError('isTrackingEnabled() has not been implemented.');
  }

  /// Gets the IDFA
  Future<String?> getIDFA() {
    throw UnimplementedError('getIDFA() has not been implemented.');
  }

  /// Requests the IDFA
  Future<void> requestIDFA() {
    throw UnimplementedError('requestIDFA() has not been implemented.');
  }

  /// Gets the tracking authorization status
  Future<TrackingAuthorizationStatus?> getTrackingAuthorizationStatus() {
    throw UnimplementedError(
      'getTrackingAuthorizationStatus() has not been implemented.',
    );
  }
}
