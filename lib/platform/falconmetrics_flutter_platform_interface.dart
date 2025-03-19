import 'package:falconmetrics_flutter/events.dart';
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
  Future<void> init({required String apiKey}) {
    throw UnimplementedError('init() has not been implemented.');
  }

  /// Tracks a conversion event
  Future<void> trackEvent({required TrackingEvent event}) {
    throw UnimplementedError('trackEvent() has not been implemented.');
  }
}
