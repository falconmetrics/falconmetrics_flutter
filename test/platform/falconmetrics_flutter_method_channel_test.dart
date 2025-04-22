import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:falconmetrics_flutter/platform/falconmetrics_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFalconmetricsFlutter platform =
      MethodChannelFalconmetricsFlutter();
  const MethodChannel channel = MethodChannel('falconmetrics_flutter');

  final List<MethodCall> log = <MethodCall>[];

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          log.add(methodCall);
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    log.clear();
  });

  test('It calls init with the correct arguments', () async {
    const String testApiKey = 'test_api_key_123';
    await platform.init(apiKey: testApiKey);

    expect(log, hasLength(1));
    expect(log.first.method, 'init');
    expect(log.first.arguments, {'apiKey': testApiKey});
  });
}
