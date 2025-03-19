import 'package:falconmetrics_flutter/events.dart';
import 'package:falconmetrics_flutter/platform/event_proto_converter.dart';
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
    final protoEvent = EventProtoConverter().convert(event);
    await methodChannel.invokeMethod<void>(
      'trackEvent',
      protoEvent.writeToBuffer(),
    );
  }
}
