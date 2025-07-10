import 'package:falconmetrics_flutter/events.dart';
import '../generated/event.pb.dart' as pb;

class EventProtoConverter {
  pb.TrackingEvent convert(TrackingEvent event) {
    return switch (event) {
      UserSignedUpOrLoggedInEvent() => pb.TrackingEvent(
        userSignedUpOrLoggedIn: _convertSignInEvent(event),
      ),
      AddedToCartEvent() => pb.TrackingEvent(
        addedToCart: _convertAddedToCartEvent(event),
      ),
      CouponAppliedEvent() => pb.TrackingEvent(
        couponApplied: _convertCouponAppliedEvent(event),
      ),
      PurchaseEvent() => pb.TrackingEvent(
        purchase: _convertPurchaseEvent(event),
      ),
    };
  }

  pb.UserSignedUpOrLoggedInEvent _convertSignInEvent(
    UserSignedUpOrLoggedInEvent event,
  ) {
    return pb.UserSignedUpOrLoggedInEvent.create();
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

  pb.CouponAppliedEvent _convertCouponAppliedEvent(CouponAppliedEvent event) {
    return pb.CouponAppliedEvent(
      couponCode: event.couponCode,
      cartId: event.cartId,
    );
  }

  pb.PurchaseEvent _convertPurchaseEvent(PurchaseEvent event) {
    return pb.PurchaseEvent(
      itemId: event.itemId,
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
}
