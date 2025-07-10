import 'package:falconmetrics_flutter/events.dart';
import 'package:falconmetrics_flutter/platform/event_proto_converter.dart';
import 'package:falconmetrics_flutter/platform/falconmetrics_flutter_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFalconmetricsFlutter platform =
      MethodChannelFalconmetricsFlutter();
  const MethodChannel channel = MethodChannel(
    'io.falconmetrics.falconmetrics_flutter',
  );

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
    await platform.init(apiKey: testApiKey, fbAppId: '456');

    expect(log, hasLength(1));
    expect(log.first.method, 'init');
    expect(log.first.arguments, {'apiKey': testApiKey, 'fbAppId': '456'});
  });

  test('It calls setDebugLoggingEnabled with the correct arguments', () async {
    await platform.setDebugLoggingEnabled(enabled: true);

    expect(log, hasLength(1));
    expect(log.first.method, 'setDebugLoggingEnabled');
    expect(log.first.arguments, {'enabled': true});
  });

  test('It calls trackEvent with the correct arguments', () async {
    final event = AddedToCartEvent(
      itemId: '123',
      quantity: 1,
      productPriceInCents: 100,
      currency: 'USD',
    );

    final eventProto = EventProtoConverter().convert(event);
    await platform.trackEvent(event: event);

    expect(log, hasLength(1));
    expect(log.first.method, 'trackEvent');
    expect(log.first.arguments, eventProto.writeToBuffer());
  });

  test('It calls setTrackingEnabled with the correct arguments', () async {
    await platform.setTrackingEnabled(enabled: true);

    expect(log, hasLength(1));
    expect(log.first.method, 'setTrackingEnabled');
    expect(log.first.arguments, true);
  });

  test('It calls isTrackingEnabled with the correct arguments', () async {
    await platform.isTrackingEnabled();

    expect(log, hasLength(1));
    expect(log.first.method, 'isTrackingEnabled');
    expect(log.first.arguments, null);
  });
}
