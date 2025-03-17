import 'package:flutter_test/flutter_test.dart';
import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:falconmetrics_flutter/falconmetrics_flutter_platform_interface.dart';
import 'package:falconmetrics_flutter/falconmetrics_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFalconmetricsFlutterPlatform
    with MockPlatformInterfaceMixin
    implements FalconmetricsFlutterPlatform {

  @override
  Future<void> init({required String apiKey}) => Future.value();
}

void main() {
  final FalconmetricsFlutterPlatform initialPlatform = FalconmetricsFlutterPlatform.instance;

  test('$MethodChannelFalconmetricsFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFalconmetricsFlutter>());
  });

  test('getPlatformVersion', () async {
    FalconmetricsFlutter falconmetricsFlutterPlugin = FalconmetricsFlutter();
    MockFalconmetricsFlutterPlatform fakePlatform = MockFalconmetricsFlutterPlatform();
    FalconmetricsFlutterPlatform.instance = fakePlatform;
    await falconmetricsFlutterPlugin.init(apiKey: '123');

    
  });
}
