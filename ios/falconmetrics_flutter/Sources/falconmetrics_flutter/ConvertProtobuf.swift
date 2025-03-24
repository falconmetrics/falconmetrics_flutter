//
//  ConvertProtobuf.swift
//  falconmetrics_flutter
//
//  Created by FalconMetrics on 24/03/2025.
//
func convertTrackingEvent(event: Event_TrackingEvent) throws -> TrackingEvent {
    switch event.eventCase {
    case .userSignedUpOrLoggedIn:
        return UserSignedUpOrLoggedInEvent()

    case .addedToCart:
        return AddedToCartEvent(
            itemId: event.addedToCart.itemID,
            quantity: event.addedToCart.quantity,
            productPriceInCents: event.addedToCart.productPriceInCents,
            currency: event.addedToCart.currency,
            productCategory: event.addedToCart.productCategory,
            cartId: event.addedToCart.cartID
        )

    case .couponApplied:
        return CouponAppliedEvent(
            couponCode: event.couponApplied.couponCode,
            cartId: event.couponApplied.cartID
        )

    case .purchase:
        return PurchaseEvent(
            itemId: event.purchase.itemID,
            quantity: event.purchase.quantity,
            transactionId: event.purchase.transactionID,
            productPriceInCents: event.purchase.productPriceInCents,
            currency: event.purchase.currency,
            revenueInCents: event.purchase.revenueInCents,
            productCategory: event.purchase.productCategory,
            cartId: event.purchase.cartID,
            paymentMethod: event.purchase.paymentMethod,
            taxInCents: event.purchase.taxInCents,
            shippingCostInCents: event.purchase.shippingCostInCents,
            discountInCents: event.purchase.discountInCents
        )

    case .eventNotSet:
        throw NSError(domain: "TrackingError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Event not set"])
    @unknown default:
        throw NSError(domain: "TrackingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unknown event case"])
    }
}
