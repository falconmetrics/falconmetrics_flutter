import 'package:falconmetrics_flutter/events.dart';
import 'package:falconmetrics_flutter/src/event_proto_converter.dart';
import 'package:falconmetrics_flutter/src/generated/event.pb.dart' as pb;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EventProtoConverter', () {
    late EventProtoConverter converter;

    setUp(() {
      converter = EventProtoConverter();
    });

    test('converts UserSignedUpOrLoggedInEvent correctly', () {
      // Arrange
      final event = const UserSignedUpOrLoggedInEvent();

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasUserSignedUpOrLoggedIn(), isTrue);
      expect(
        protoEvent.whichEvent(),
        equals(pb.TrackingEvent_Event.userSignedUpOrLoggedIn),
      );
    });

    test('converts AddedToCartEvent correctly', () {
      // Arrange
      final event = const AddedToCartEvent(
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

    test('converts CouponAppliedEvent correctly', () {
      // Arrange
      final event = const CouponAppliedEvent(
        couponCode: 'SAVE20',
        cartId: 'cart456',
      );

      // Act
      final protoEvent = converter.convert(event);

      // Assert
      expect(protoEvent.hasCouponApplied(), isTrue);
      expect(
        protoEvent.whichEvent(),
        equals(pb.TrackingEvent_Event.couponApplied),
      );

      final couponAppliedEvent = protoEvent.couponApplied;
      expect(couponAppliedEvent.couponCode, equals('SAVE20'));
      expect(couponAppliedEvent.cartId, equals('cart456'));
    });

    test('converts PurchaseEvent correctly', () {
      // Arrange
      final event = const PurchaseEvent(
        itemId: 'item123',
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
      expect(purchaseEvent.itemId, equals('item123'));
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
  });
}
