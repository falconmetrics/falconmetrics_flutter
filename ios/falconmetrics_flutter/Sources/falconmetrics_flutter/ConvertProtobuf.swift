//
//  ConvertProtobuf.swift
//  falconmetrics_flutter
//
//  Created by FalconMetrics on 24/03/2025.
//
import falconmetrics_ios
import Foundation


func convertTrackingEvent(event: Pb_TrackingEvent) throws -> TrackingEvent {
    switch event.event {
    case .userSignedUpOrLoggedIn:
        return UserSignedUpOrLoggedInEvent()

    case .addedToCart:
        return AddedToCartEvent(
            itemId: event.addedToCart.itemID,
            quantity: Int(event.addedToCart.quantity),
            productPriceInCents: Int(event.addedToCart.productPriceInCents),
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
            quantity: Int(event.purchase.quantity),
            transactionId: event.purchase.transactionID,
            productPriceInCents: Int(event.purchase.productPriceInCents),
            currency: event.purchase.currency,
            revenueInCents: Int(event.purchase.revenueInCents),
            productCategory: event.purchase.productCategory,
            cartId: event.purchase.cartID,
            paymentMethod: event.purchase.paymentMethod,
            taxInCents:Int( event.purchase.taxInCents),
            shippingCostInCents: Int(event.purchase.shippingCostInCents),
            discountInCents: Int(event.purchase.discountInCents)
        )

    @unknown default:
        throw NSError(domain: "TrackingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unknown event case"])
    }
}
