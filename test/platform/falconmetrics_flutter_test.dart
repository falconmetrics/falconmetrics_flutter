import 'package:falconmetrics_flutter/events.dart';
import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:falconmetrics_flutter/platform/falconmetrics_flutter_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFalconmetricsFlutterPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements FalconmetricsFlutterPlatform {}

void main() {
  final FalconmetricsFlutterPlatform initialPlatform =
      FalconmetricsFlutterPlatform.instance;

  late FalconmetricsFlutter sut;

  setUpAll(() {
    registerFallbackValue(UserSignedUpOrLoggedInEvent());
  });

  setUp(() {
    FalconmetricsFlutterPlatform.instance = MockFalconmetricsFlutterPlatform();

    when(
      () => FalconmetricsFlutterPlatform.instance.init(
        apiKey: any(named: 'apiKey'),
        fbAppId: any(named: 'fbAppId'),
      ),
    ).thenAnswer((_) => Future.value());

    when(
      () => FalconmetricsFlutterPlatform.instance.setTrackingEnabled(
        enabled: any(named: 'enabled'),
      ),
    ).thenAnswer((_) => Future.value());

    when(
      () => FalconmetricsFlutterPlatform.instance.trackEvent(
        event: any(named: 'event'),
      ),
    ).thenAnswer((_) => Future.value());

    when(
      () => FalconmetricsFlutterPlatform.instance.isTrackingEnabled(),
    ).thenAnswer((_) => Future.value(false));

    when(
      () => FalconmetricsFlutterPlatform.instance.setDebugLoggingEnabled(
        enabled: any(named: 'enabled'),
      ),
    ).thenAnswer((_) => Future.value());

    sut = FalconmetricsFlutter();
  });

  tearDown(() {
    FalconmetricsFlutterPlatform.instance = initialPlatform;
  });

  test('getPlatformVersion', () async {
    await sut.init(apiKey: '123', fbAppId: '456');

    verify(() => sut.init(apiKey: '123', fbAppId: '456')).called(1);
  });

  test('setTrackingEnabled', () async {
    await sut.setTrackingEnabled(enabled: true);

    verify(() => sut.setTrackingEnabled(enabled: true)).called(1);
  });

  test('isTrackingEnabled', () async {
    final result = await sut.isTrackingEnabled();
    expect(result, false);
  });

  test('setDebugLoggingEnabled', () async {
    await sut.setDebugLoggingEnabled(enabled: true);

    verify(() => sut.setDebugLoggingEnabled(enabled: true)).called(1);
  });

  test('Track event', () async {
    await sut.trackEvent(
      event: AddedToCartEvent(
        itemId: '123',
        quantity: 1,
        productPriceInCents: 100,
        currency: 'USD',
      ),
    );

    verify(
      () => sut.trackEvent(
        event: AddedToCartEvent(
          itemId: '123',
          quantity: 1,
          productPriceInCents: 100,
          currency: 'USD',
        ),
      ),
    ).called(1);
  });
}
