import 'package:falconmetrics_flutter/events.dart';
import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:falconmetrics_flutter/platform/falconmetrics_flutter_method_channel.dart';
import 'package:falconmetrics_flutter/platform/falconmetrics_flutter_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFalconmetricsFlutterPlatform
    with MockPlatformInterfaceMixin
    implements FalconmetricsFlutterPlatform {
  @override
  Future<void> init({required String apiKey}) => Future.value();

  @override
  Future<void> trackEvent({required TrackingEvent event}) => Future.value();

  @override
  Future<void> setDebugLoggingEnabled({required bool enabled}) =>
      Future.value();

  @override
  Future<void> setTrackingEnabled({required bool enabled}) => Future.value();

  @override
  Future<bool> isTrackingEnabled() => Future.value(false);
}

void main() {
  final FalconmetricsFlutterPlatform initialPlatform =
      FalconmetricsFlutterPlatform.instance;

  test('$MethodChannelFalconmetricsFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFalconmetricsFlutter>());
  });

  test('getPlatformVersion', () async {
    FalconmetricsFlutter falconmetricsFlutterPlugin = FalconmetricsFlutter();
    MockFalconmetricsFlutterPlatform fakePlatform =
        MockFalconmetricsFlutterPlatform();
    FalconmetricsFlutterPlatform.instance = fakePlatform;
    await falconmetricsFlutterPlugin.init(apiKey: '123');
  });

  test('setTrackingEnabled', () async {
    FalconmetricsFlutter falconmetricsFlutterPlugin = FalconmetricsFlutter();
    MockFalconmetricsFlutterPlatform fakePlatform =
        MockFalconmetricsFlutterPlatform();
    FalconmetricsFlutterPlatform.instance = fakePlatform;
    await falconmetricsFlutterPlugin.setTrackingEnabled(enabled: true);
  });

  test('isTrackingEnabled', () async {
    FalconmetricsFlutter falconmetricsFlutterPlugin = FalconmetricsFlutter();
    MockFalconmetricsFlutterPlatform fakePlatform =
        MockFalconmetricsFlutterPlatform();
    FalconmetricsFlutterPlatform.instance = fakePlatform;
    final result = await falconmetricsFlutterPlugin.isTrackingEnabled();
    expect(result, false);
  });

  test('setDebugLoggingEnabled', () async {
    FalconmetricsFlutter falconmetricsFlutterPlugin = FalconmetricsFlutter();
    MockFalconmetricsFlutterPlatform fakePlatform =
        MockFalconmetricsFlutterPlatform();
    FalconmetricsFlutterPlatform.instance = fakePlatform;
    await falconmetricsFlutterPlugin.setDebugLoggingEnabled(enabled: true);
  });
}
