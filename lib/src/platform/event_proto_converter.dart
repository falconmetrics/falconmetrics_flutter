import 'package:falconmetrics_flutter/src/events.dart';

import '../generated/event.pb.dart' as pb;

class EventProtoConverter {
  pb.TrackingEvent convert(TrackingEvent event) {
    return switch (event) {
      CompleteRegistrationEvent() => pb.TrackingEvent(
        completeRegistration: _convertCompleteRegistrationEvent(event),
      ),
      AddedToCartEvent() => pb.TrackingEvent(
        addedToCart: _convertAddedToCartEvent(event),
      ),
      SubscriptionEvent() => pb.TrackingEvent(
        subscribe: _convertSubscriptionEvent(event),
      ),
      PurchaseEvent() => pb.TrackingEvent(
        purchase: _convertPurchaseEvent(event),
      ),
      CustomEvent() => pb.TrackingEvent(
        customEvent: _convertCustomEvent(event),
      ),
    };
  }

  pb.CompleteRegistrationEvent _convertCompleteRegistrationEvent(
    CompleteRegistrationEvent event,
  ) {
    return pb.CompleteRegistrationEvent.create();
  }

  pb.AddedToCartEvent _convertAddedToCartEvent(AddedToCartEvent event) {
    return pb.AddedToCartEvent(
      itemId: event.itemId,
      cartId: event.cartId,
      quantity: event.quantity,
      currency: event.currency,
      productPriceInCents: event.productPriceInCents,
      productCategory: event.productCategory,
    );
  }

  pb.SubscriptionEvent _convertSubscriptionEvent(SubscriptionEvent event) {
    return pb.SubscriptionEvent(
      currency: event.currencyCode,
      predictedLtvValueInCents: event.predictedLtvValueInCents,
    );
  }

  pb.PurchaseEvent _convertPurchaseEvent(PurchaseEvent event) {
    return pb.PurchaseEvent(
      itemIds: event.itemIds,
      quantity: event.quantity,
      transactionId: event.transactionId,
      productPriceInCents: event.productPriceInCents,
      currency: event.currency,
      revenueInCents: event.revenueInCents,
      productCategory: event.productCategory,
      cartId: event.cartId,
      paymentMethod: event.paymentMethod,
      taxInCents: event.taxInCents,
      shippingCostInCents: event.shippingCostInCents,
      discountInCents: event.discountInCents,
    );
  }

  pb.CustomEvent _convertCustomEvent(CustomEvent event) {
    final attributes = <String, pb.AttributeValue>{};

    event.attributes?.forEach((key, value) {
      attributes[key] = _convertAttributeValue(value);
    });

    return pb.CustomEvent(
      eventName: event.eventName,
      attributes: attributes.entries,
    );
  }

  pb.AttributeValue _convertAttributeValue(Object value) {
    if (value is String) {
      return pb.AttributeValue(stringValue: value);
    } else if (value is int) {
      return pb.AttributeValue(intValue: value);
    } else if (value is double) {
      return pb.AttributeValue(doubleValue: value);
    } else if (value is bool) {
      return pb.AttributeValue(boolValue: value);
    } else {
      throw UnsupportedError(
        'Unsupported attribute value type: ${value.runtimeType}',
      );
    }
  }
}
