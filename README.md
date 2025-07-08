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
  falconmetrics_flutter: ^0.1.0
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

### Tracking Events

#### User Sign-Up or Login

```dart
import 'package:falconmetrics_flutter/events.dart';

final falconMetrics = FalconmetricsFlutter();
await falconMetrics.trackEvent(
  event: UserSignedUpOrLoggedInEvent(),
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

#### Apply Coupon

```dart
await falconMetrics.trackEvent(
  event: CouponAppliedEvent(
    couponCode: 'SUMMER20',
    cartId: 'cart-456',
  ),
);
```

#### Purchase

```dart
await falconMetrics.trackEvent(
  event: PurchaseEvent(
    itemId: 'product-123',
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

> **Note:** Tracking preferences primarily affect Android. iOS uses a privacy-aware SKAdNetwork implementation that cannot be disabled through this SDK.

## Example

Check the [example](example/) directory for a complete sample application demonstrating how to use the FalconMetrics Flutter SDK.

## API Reference

### FalconmetricsFlutter

- `init({required String apiKey})` - Initialize the SDK with your API key
- `trackEvent({required TrackingEvent event})` - Track an event
- `setTrackingEnabled({required bool enabled})` - Enable or disable tracking
- `isTrackingEnabled()` - Check if tracking is enabled

### TrackingEvent Types

- `UserSignedUpOrLoggedInEvent()` - Track user sign-up or login
- `AddedToCartEvent()` - Track when a product is added to cart
- `CouponAppliedEvent()` - Track when a coupon is applied
- `PurchaseEvent()` - Track a purchase transaction

### Google advertising ID

For a more accurate attribution it is recommended to enable Google advertising ID tracking. To do this, add the following permission to your AndroidManifest.xml file: 

```xml
  <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
```

The FalconMetrics sdk automatically tracks the Google advertising ID for you and takes into account the users consent to use the ID.

## License

This project is licensed under the terms found in the [LICENSE](LICENSE) file.
