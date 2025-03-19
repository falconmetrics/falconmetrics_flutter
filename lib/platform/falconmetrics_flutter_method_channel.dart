import 'package:falconmetrics_flutter/events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'falconmetrics_flutter_platform_interface.dart';

/// An implementation of [FalconmetricsFlutterPlatform] that uses method channels.
class MethodChannelFalconmetricsFlutter extends FalconmetricsFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('falconmetrics_flutter');

  @override
  Future<void> init({required String apiKey}) async {
    await methodChannel.invokeMethod<void>('init', {'apiKey': apiKey});
  }

  @override
  Future<void> trackEvent({required TrackingEvent event}) async {
    await methodChannel.invokeMethod<void>('trackEvent', {'event': event});
  }
}
