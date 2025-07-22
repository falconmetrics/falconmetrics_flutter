import 'package:falconmetrics_flutter/src/events.dart';
import 'package:falconmetrics_flutter/src/generated/event.pb.dart' as pb;
import 'package:falconmetrics_flutter/src/platform/event_proto_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventProtoConverter', () {
    late EventProtoConverter converter;

    setUp(() {
      converter = EventProtoConverter();
    });

    test('converts CompleteRegistrationEvent correctly', () {
      // Arrange
      final event = CompleteRegistrationEvent();

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasCompleteRegistration(), isTrue);
      expect(
        protoEvent.whichEvent(),
        equals(pb.TrackingEvent_Event.completeRegistration),
      );
    });

    test('converts AddedToCartEvent correctly', () {
      // Arrange
      final event = AddedToCartEvent(
        itemId: 'item123',
        quantity: 2,
        productPriceInCents: 1099,
        currency: 'USD',
        productCategory: 'Electronics',
        cartId: 'cart456',
      );

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasAddedToCart(), isTrue);
      expect(
        protoEvent.whichEvent(),
        equals(pb.TrackingEvent_Event.addedToCart),
      );

      final addedToCartEvent = protoEvent.addedToCart;
      expect(addedToCartEvent.itemId, equals('item123'));
      expect(addedToCartEvent.quantity, equals(2));
      expect(addedToCartEvent.productPriceInCents, equals(1099));
      expect(addedToCartEvent.currency, equals('USD'));
      expect(addedToCartEvent.productCategory, equals('Electronics'));
      expect(addedToCartEvent.cartId, equals('cart456'));
    });

    test('converts SubscriptionEvent correctly', () {
      // Arrange
      final event = SubscriptionEvent(
        currencyCode: 'USD',
        predictedLtvValueInCents: 1099,
      );

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasSubscribe(), isTrue);
      expect(protoEvent.whichEvent(), equals(pb.TrackingEvent_Event.subscribe));

      final subscribeEvent = protoEvent.subscribe;
      expect(subscribeEvent.currency, equals('USD'));
      expect(subscribeEvent.predictedLtvValueInCents, equals(1099));
    });

    test('converts PurchaseEvent correctly', () {
      // Arrange
      final event = PurchaseEvent(
        itemIds: ['item123'],
        quantity: 2,
        transactionId: 'txn789',
        productPriceInCents: 1099,
        currency: 'USD',
        revenueInCents: 2198,
        productCategory: 'Electronics',
        cartId: 'cart456',
        paymentMethod: 'Credit Card',
        taxInCents: 175,
        shippingCostInCents: 499,
        discountInCents: 200,
      );

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasPurchase(), isTrue);
      expect(protoEvent.whichEvent(), equals(pb.TrackingEvent_Event.purchase));

      final purchaseEvent = protoEvent.purchase;
      expect(purchaseEvent.itemIds, equals(['item123']));
      expect(purchaseEvent.quantity, equals(2));
      expect(purchaseEvent.transactionId, equals('txn789'));
      expect(purchaseEvent.productPriceInCents, equals(1099));
      expect(purchaseEvent.currency, equals('USD'));
      expect(purchaseEvent.revenueInCents, equals(2198));
      expect(purchaseEvent.productCategory, equals('Electronics'));
      expect(purchaseEvent.cartId, equals('cart456'));
      expect(purchaseEvent.paymentMethod, equals('Credit Card'));
      expect(purchaseEvent.taxInCents, equals(175));
      expect(purchaseEvent.shippingCostInCents, equals(499));
      expect(purchaseEvent.discountInCents, equals(200));
    });

    test('converts CustomEvent correctly', () {
      // Arrange
      final event = CustomEvent(
        eventName: 'custom_event',
        attributes: {
          'attribute1': 'value1',
          'attribute2': 123,
          'attribute3': true,
        },
      );

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasCustomEvent(), isTrue);
      expect(
        protoEvent.whichEvent(),
        equals(pb.TrackingEvent_Event.customEvent),
      );

      final customEvent = protoEvent.customEvent;
      expect(customEvent.eventName, equals('custom_event'));
      expect(customEvent.attributes.length, equals(3));
      expect(
        customEvent.attributes['attribute1']?.stringValue,
        equals('value1'),
      );
      expect(customEvent.attributes['attribute2']?.intValue, equals(123));
      expect(customEvent.attributes['attribute3']?.boolValue, equals(true));
    });

    test('Is throws error when customevent has incorrect attribute type', () {
      // Arrange
      final event = CustomEvent(
        eventName: 'custom_event',
        attributes: {
          'attribute1': _DummyClass(),
          'attribute2': 123,
          'attribute3': true,
        },
      );

      // Act & Assert
      expect(() => converter.convert(event), throwsUnsupportedError);
    });
  });
}

class _DummyClass {}
