import 'package:falconmetrics_flutter/src/events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'event_proto_converter.dart';
import 'falconmetrics_flutter_platform_interface.dart';

/// An implementation of [FalconmetricsFlutterPlatform] that uses method channels.
class MethodChannelFalconmetricsFlutter extends FalconmetricsFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'io.falconmetrics.falconmetrics_flutter',
  );

  @override
  Future<void> init({required String apiKey, String? fbAppId}) async {
    await methodChannel.invokeMethod<void>('init', {
      'apiKey': apiKey,
      'fbAppId': fbAppId,
    });
  }

  @override
  Future<void> setDebugLoggingEnabled({required bool enabled}) async {
    await methodChannel.invokeMethod<void>('setDebugLoggingEnabled', {
      'enabled': enabled,
    });
  }

  @override
  Future<void> trackEvent({required TrackingEvent event}) async {
    final protoEvent = EventProtoConverter().convert(event);
    await methodChannel.invokeMethod<void>(
      'trackEvent',
      protoEvent.writeToBuffer(),
    );
  }

  @override
  Future<void> setTrackingEnabled({required bool enabled}) async {
    await methodChannel.invokeMethod<void>('setTrackingEnabled', enabled);
  }

  @override
  Future<bool> isTrackingEnabled() async {
    return await methodChannel.invokeMethod<bool>('isTrackingEnabled') ?? true;
  }
}
