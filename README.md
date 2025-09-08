# FalconMetrics Flutter SDK

A Flutter plugin for integrating FalconMetrics analytics and conversion tracking into your Flutter applications. This SDK allows you to track various e-commerce events including user sign-ups, cart additions, coupon applications, and purchases.

[![pub package](https://img.shields.io/pub/v/falconmetrics_flutter.svg)](https://pub.dev/packages/falconmetrics_flutter)

## Features

- Easy integration with Flutter applications
- Track user sign-ups and logins
- Track e-commerce events (add to cart, purchase, etc.)
- Support for both Android and iOS platforms
- Privacy-aware implementation (respects user tracking preferences)

## Installation

Add `falconmetrics_flutter` to your `pubspec.yaml` file:

```yaml
dependencies:
  falconmetrics_flutter: ^1.1.0
```

Then run:

```bash
flutter pub get
```

## Platform Setup

### Android

No additional setup required for Android.

### iOS

FalconMetrics uses SKAdNetwork for iOS. No additional setup is required as the SDK handles this automatically.

## Usage

### Initialize the SDK

Initialize the SDK as early as possible in your application, typically in your `main.dart` file:

```dart
import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final falconMetrics = FalconmetricsFlutter();
  await falconMetrics.init(apiKey: 'YOUR_API_KEY');
  
  runApp(MyApp());
}
```

#### Configure IP address tracking (optional)

You can control how IP addresses are collected during initialization using `TrackingOptions`.

```dart
import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';

await FalconmetricsFlutter().init(
  apiKey: 'YOUR_API_KEY',
  trackingOptions: TrackingOptions(
    // Choose how to collect the user's IP address
    // full | anonymised | disabled
    ipAddressTracking: IpAddressTracking.anonymised,
  ),
);
```

### Tracking Events

#### Complete registration event

```dart
import 'package:falconmetrics_flutter/events.dart';

final falconMetrics = FalconmetricsFlutter();
await falconMetrics.trackEvent(
  event: CompleteRegistrationEvent(),
);
```

#### Add to Cart

```dart
await falconMetrics.trackEvent(
  event: AddedToCartEvent(
    itemId: 'product-123',
    quantity: 2,
    productPriceInCents: 1099, // $10.99
    currency: 'USD',
    productCategory: 'Electronics',
    cartId: 'cart-456',
  ),
);
```

#### Subscription event

```dart
await falconMetrics.trackEvent(
  event: SubscriptionEvent(
    currencyCode: 'USD',
    predictedLtvValueInCents: 1099,
  ),
);
```

#### Purchase

```dart
await falconMetrics.trackEvent(
  event: PurchaseEvent(
    itemIds: ['product-123'],
    quantity: 2,
    transactionId: 'transaction-789',
    productPriceInCents: 1099, // $10.99
    currency: 'USD',
    revenueInCents: 2198, // $21.98
    productCategory: 'Electronics',
    cartId: 'cart-456',
    paymentMethod: 'credit_card',
    taxInCents: 220, // $2.20
    shippingCostInCents: 499, // $4.99
    discountInCents: 200, // $2.00
  ),
);
```

#### Attach optional user data to any event

For better attribution and matching, you can provide optional user data alongside any tracking event. Provide whatever fields you have; all fields are optional.

```dart
import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';

await falconMetrics.trackEvent(
  event: CustomEvent(
    eventName: 'newsletter_signup',
    attributes: {'source': 'homepage'},
  ),
  userData: UserData(
    email: 'user@example.com',
    phoneNumber: '+12025550123',
    firstName: 'Ada',
    lastName: 'Lovelace',
    city: 'London',
    postalCode: 'W1A 1AA',
    state: 'London',
    country: 'GB',
    dateOfBirth: '1815-12-10', // YYYY-MM-DD
  ),
);
```

#### Custom event

You can also create a custom event but make sure to use the same event name as the one you use in your ad network.

Optionally you can add a currency and revenue in cents to the custom event. The revenue will be recorded as revenue to the ad network.

```dart
await falconMetrics.trackEvent(
  event: CustomEvent(
    eventName: 'custom_event_name',
    attributes: {
      'attribute_name': 'attribute_value',
    },
    currency: 'USD',
    revenueInCents: 1099,
  ),
);
```

### Managing Tracking Preferences

#### Enable or Disable Tracking

```dart
// Enable tracking
await falconMetrics.setTrackingEnabled(enabled: true);

// Disable tracking
await falconMetrics.setTrackingEnabled(enabled: false);
```

#### Check if Tracking is Enabled

```dart
final isEnabled = await falconMetrics.isTrackingEnabled();
print('Tracking enabled: $isEnabled');
```

#### Update tracking options

```dart
await falconMetrics.updateTrackingOptions(
  trackingOptions: TrackingOptions(
    ipAddressTracking: IpAddressTracking.anonymised,
  ),
);
```

## Example

Check the [example](example/) directory for a complete sample application demonstrating how to use the FalconMetrics Flutter SDK.

## API Reference

### FalconmetricsFlutter

- `init({required String apiKey, String? fbAppId, TrackingOptions? trackingOptions})` - Initialize the SDK
- `trackEvent({required TrackingEvent event})` - Track an event
- `setTrackingEnabled({required bool enabled})` - Enable or disable tracking
- `isTrackingEnabled()` - Check if tracking is enabled
- `getIDFA()` - iOS only: Get the IDFA (Identifier for Advertisers)
- `requestIDFA()` - iOS only: Request the IDFA permission from the user
- `getTrackingAuthorizationStatus()` - iOS only: Get the current tracking authorization status

#### TrackingOptions

- `ipAddressTracking: IpAddressTracking`
  - `IpAddressTracking.full` – store full IP address
  - `IpAddressTracking.anonymised` – store anonymised IP address
  - `IpAddressTracking.disabled` – do not collect/store IP address

### TrackingEvent Types

- `UserSignedUpOrLoggedInEvent()` - Track user sign-up or login
- `AddedToCartEvent()` - Track when a product is added to cart
- `CouponAppliedEvent()` - Track when a coupon is applied
- `PurchaseEvent()` - Track a purchase transaction

### iOS IDFA (Identifier for Advertisers)

For iOS apps, you can use the IDFA methods to request and retrieve the user's Identifier for Advertisers. This helps with more accurate attribution on iOS devices.

#### iOS Configuration
Add NSUserTrackingUsageDescription to your Info.plist with a clear purpose string.

```xml
<key>NSUserTrackingUsageDescription</key>
<string>We use IDFA to track user behavior and improve our services.</string>
```

#### Request IDFA Permission

Before accessing the IDFA, you need to request permission from the user:

```dart
final falconMetrics = FalconmetricsFlutter();
final status = await falconMetrics.requestIDFA();

switch (status) {
  case TrackingAuthorizationStatus.authorized:
    print('User granted permission');
    break;
  case TrackingAuthorizationStatus.denied:
    print('User denied permission');
    break;
  case TrackingAuthorizationStatus.restricted:
    print('Tracking is restricted');
    break;
  case TrackingAuthorizationStatus.notDetermined:
    print('User has not yet been asked');
    break;
}
```

If NSUserTrackingUsageDescription is not set on iOS we will return TrackingAuthorizationStatus.denied.

#### Get Current Authorization Status

```dart
final status = await falconMetrics.getTrackingAuthorizationStatus();
print('Current tracking status: $status');
```

#### Get IDFA

After receiving permission, you can retrieve the IDFA:

```dart
final idfa = await falconMetrics.getIDFA();
print('IDFA: $idfa');
```

### Google advertising ID

For a more accurate attribution it is recommended to enable Google advertising ID tracking. To do this, add the following permission to your AndroidManifest.xml file: 

```xml
  <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
```

The FalconMetrics sdk automatically tracks the Google advertising ID for you and takes into account the users consent to use the ID.

### Meta Install referrer

The meta referrer is more elaborate than the Google Play Install referrer. Google Play Install referrer only provides info for same session click through installs, while the Meta Referrer provides info for view through installs, click through installs and multiple session click through installs. The FalconMetrics sdk automatically retrieves and processes the meta referrer in order to provide the most accurate attribution possible.

Add the following `<queries>` element inside the root `<manifest>` tag to enable Meta Referrer support:

```xml
<queries>
  <package android:name="com.facebook.katana" />
</queries>

<queries>
  <package android:name="com.instagram.android" />
</queries>

<queries>
  <package android:name="com.facebook.lite" />
</queries>
```

## License

This project is licensed under the terms found in the [LICENSE](LICENSE) file.
