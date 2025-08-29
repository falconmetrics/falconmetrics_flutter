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
    await methodChannel.invokeMethod<void>('setTrackingEnabled', enabled);
  }

  @override
  Future<bool> isTrackingEnabled() async {
    return await methodChannel.invokeMethod<bool>('isTrackingEnabled') ?? true;
  }

  @override
  Future<String?> getIDFA() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return await methodChannel.invokeMethod<String?>(
        'getTrackingAuthorizationStatus',
      );
    } else {
      throw UnsupportedError('getIDFA is only supported on iOS');
    }
  }

  @override
  Future<void> requestIDFA() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      await methodChannel.invokeMethod<void>('requestIDFA');
    } else {
      throw UnsupportedError('requestIDFA is only supported on iOS');
    }
  }

  @override
  Future<TrackingAuthorizationStatus?> getTrackingAuthorizationStatus() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final status = await methodChannel.invokeMethod<String?>(
        'getTrackingAuthorizationStatus',
      );
      return status?.toTrackingAuthorizationStatus();
    } else {
      throw UnsupportedError(
        'getTrackingAuthorizationStatus is only supported on iOS',
      );
    }
  }
}

extension _TrackingAuthorizationStatusX on String? {
  TrackingAuthorizationStatus? toTrackingAuthorizationStatus() {
    if (this == null) {
      return null;
    }
    switch (this) {
      case 'notDetermined':
        return TrackingAuthorizationStatus.notDetermined;
      case 'restricted':
        return TrackingAuthorizationStatus.restricted;
      case 'denied':
        return TrackingAuthorizationStatus.denied;
      case 'authorized':
        return TrackingAuthorizationStatus.authorized;
      default:
        throw ArgumentError('Invalid tracking authorization status: $this');
    }
  }
}
