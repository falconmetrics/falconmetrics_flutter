import 'package:falconmetrics_flutter/src/events.dart';
import 'package:falconmetrics_flutter/src/model/tracking_authorization_status.dart';
import 'package:falconmetrics_flutter/src/platform/platform_exports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

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
    await methodChannel.invokeMethod<void>('setTrackingEnabled', {
      'trackingEnabled': enabled,
    });
  }

  @override
  Future<bool> isTrackingEnabled() async {
    return await methodChannel.invokeMethod<bool>('isTrackingEnabled') ?? true;
  }

  @override
  Future<String?> getIDFA() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return await methodChannel.invokeMethod<String?>('getIDFA');
    } else {
      throw UnsupportedError('getIDFA is only supported on iOS');
    }
  }

  @override
  Future<TrackingAuthorizationStatus> requestIDFA() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final status = await methodChannel.invokeMethod<int>('requestIDFA');
      return status.toTrackingAuthorizationStatus();
    } else {
      throw UnsupportedError('requestIDFA is only supported on iOS');
    }
  }

  @override
  Future<TrackingAuthorizationStatus> getTrackingAuthorizationStatus() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final status = await methodChannel.invokeMethod<int>(
        'getTrackingAuthorizationStatus',
      );
      return status.toTrackingAuthorizationStatus();
    } else {
      throw UnsupportedError(
        'getTrackingAuthorizationStatus is only supported on iOS',
      );
    }
  }
}

extension _TrackingAuthorizationStatusX on int? {
  TrackingAuthorizationStatus toTrackingAuthorizationStatus() {
    if (this == null) {
      return TrackingAuthorizationStatus.notDetermined;
    }
    switch (this) {
      case 0:
        return TrackingAuthorizationStatus.notDetermined;
      case 1:
        return TrackingAuthorizationStatus.restricted;
      case 2:
        return TrackingAuthorizationStatus.denied;
      case 3:
        return TrackingAuthorizationStatus.authorized;
      default:
        throw ArgumentError('Invalid tracking authorization status: $this');
    }
  }
}
