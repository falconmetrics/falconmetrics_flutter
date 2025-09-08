import 'package:falconmetrics_flutter/src/events.dart';
import 'package:falconmetrics_flutter/src/generated/userdata.pb.dart'
    as pb_userdata;
import 'package:falconmetrics_flutter/src/model/tracking_options.dart';
import 'package:falconmetrics_flutter/src/model/user_data.dart';
import 'package:falconmetrics_flutter/src/platform/event_proto_converter.dart';
import 'package:falconmetrics_flutter/src/platform/falconmetrics_flutter_method_channel.dart';
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
    await platform.init(
      apiKey: testApiKey,
      fbAppId: '456',
      trackingOptions: TrackingOptions(
        ipAddressTracking: IpAddressTracking.anonymised,
      ),
    );

    expect(log, hasLength(1));
    expect(log.first.method, 'init');
    expect(log.first.arguments, {
      'apiKey': testApiKey,
      'fbAppId': '456',
      'ipAddressTracking': 'anonymised',
    });
  });

  test('It calls setDebugLoggingEnabled with the correct arguments', () async {
    await platform.setDebugLoggingEnabled(enabled: true);

    expect(log, hasLength(1));
    expect(log.first.method, 'setDebugLoggingEnabled');
    expect(log.first.arguments, {'enabled': true});
  });
  test('It calls updateTrackingOptions with the correct arguments', () async {
    await platform.updateTrackingOptions(
      trackingOptions: TrackingOptions(
        ipAddressTracking: IpAddressTracking.anonymised,
      ),
    );

    expect(log, hasLength(1));
    expect(log.first.method, 'updateTrackingOptions');
    expect(log.first.arguments, {'ipAddressTracking': 'anonymised'});
  });

  test('It calls trackEvent with the correct arguments', () async {
    final event = AddedToCartEvent(
      itemId: '123',
      quantity: 1,
      productPriceInCents: 100,
      currency: 'USD',
    );

    final userData = pb_userdata.UserData(email: 'foo@bar.com');

    final eventProto = EventProtoConverter().convert(event);
    await platform.trackEvent(
      event: event,
      userData: UserData(email: 'foo@bar.com'),
    );

    expect(log, hasLength(1));
    expect(log.first.method, 'trackEvent');
    expect(log.first.arguments, {
      'event': eventProto.writeToBuffer(),
      'userData': userData.writeToBuffer(),
    });
  });

  test('It calls setTrackingEnabled with the correct arguments', () async {
    await platform.setTrackingEnabled(enabled: true);

    expect(log, hasLength(1));
    expect(log.first.method, 'setTrackingEnabled');
    expect(log.first.arguments, {'trackingEnabled': true});
  });

  test('It calls isTrackingEnabled with the correct arguments', () async {
    await platform.isTrackingEnabled();

    expect(log, hasLength(1));
    expect(log.first.method, 'isTrackingEnabled');
    expect(log.first.arguments, null);
  });
}
