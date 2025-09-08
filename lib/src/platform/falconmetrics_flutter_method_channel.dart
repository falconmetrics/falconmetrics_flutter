import 'package:falconmetrics_flutter/src/events.dart';
import 'package:falconmetrics_flutter/src/generated/userdata.pb.dart'
    as pb_userdata;
import 'package:falconmetrics_flutter/src/model/tracking_authorization_status.dart';
import 'package:falconmetrics_flutter/src/model/tracking_options.dart';
import 'package:falconmetrics_flutter/src/model/user_data.dart';
import 'package:falconmetrics_flutter/src/platform/event_proto_converter.dart';
import 'package:falconmetrics_flutter/src/platform/falconmetrics_flutter_platform_interface.dart';
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
  Future<void> init({
    required String apiKey,
    TrackingOptions trackingOptions = const TrackingOptions(),
    String? fbAppId,
  }) async {
    await methodChannel.invokeMethod<void>('init', {
      'apiKey': apiKey,
      'fbAppId': fbAppId,
      'ipAddressTracking': trackingOptions.ipAddressTracking?.name,
    });
  }

  @override
  Future<void> setDebugLoggingEnabled({required bool enabled}) async {
    await methodChannel.invokeMethod<void>('setDebugLoggingEnabled', {
      'enabled': enabled,
    });
  }

  @override
  Future<void> trackEvent({
    required TrackingEvent event,
    UserData? userData,
  }) async {
    final protoEvent = EventProtoConverter().convert(event);
    final userDataProto = pb_userdata.UserData(
      email: userData?.email,
      phoneNumber: userData?.phoneNumber,
      firstName: userData?.firstName,
      lastName: userData?.lastName,
      dateOfBirth: userData?.dateOfBirth,
      city: userData?.city,
      state: userData?.state,
      postalCode: userData?.postalCode,
      country: userData?.country,
    );

    await methodChannel.invokeMethod<void>('trackEvent', {
      'event': protoEvent.writeToBuffer(),
      'userData': userDataProto.writeToBuffer(),
    });
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

  @override
  Future<void> updateTrackingOptions({
    required TrackingOptions trackingOptions,
  }) async {
    await methodChannel.invokeMethod<void>('updateTrackingOptions', {
      'ipAddressTracking': trackingOptions.ipAddressTracking?.name,
    });
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
