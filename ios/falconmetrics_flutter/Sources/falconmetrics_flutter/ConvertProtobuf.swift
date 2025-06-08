//
//  ConvertProtobuf.swift
//  falconmetrics_flutter
//
//  Created by FalconMetrics on 24/03/2025.
//
import FalconMetrics
import Foundation


func convertTrackingEvent(event: Pb_TrackingEvent) throws -> FalconMetrics.BaseEventBuilder {
    switch event.event {
    case .userSignedUpOrLoggedIn:
        return FalconMetricsSdk.shared.createSignupBuilder()

    case .addedToCart:
        return FalconMetricsSdk.shared.createAddToCartBuilder()
            .withItemId( event.addedToCart.itemID)
            .withQuantity(Int(event.addedToCart.quantity))
            .withProductPrice(Int(event.addedToCart.productPriceInCents))
            .withCurrency(event.addedToCart.currency)
            .withProductCategory( event.addedToCart.productCategory)
            .withCartId( event.addedToCart.cartID)
        

    case .couponApplied:
        return FalconMetricsSdk.shared.createCouponBuilder()
            .withCouponCode( event.couponApplied.couponCode)
            .withCartId( event.couponApplied.cartID)
        

    case .purchase:
        return FalconMetricsSdk.shared.createPurchaseBuilder()
            .withItemId(event.purchase.itemID)
            .withQuantity(Int(event.purchase.quantity))
            .withTransactionId( event.purchase.transactionID)
            .withProductPrice(Int(event.purchase.productPriceInCents))
            .withCurrency(event.purchase.currency)
//            .withRevenue(Int(event.purchase.revenueInCents))
            .withProductCategory(event.purchase.productCategory)
            .withCartId(event.purchase.cartID)
            .withPaymentMethod(event.purchase.paymentMethod)
            .withTax(Int( event.purchase.taxInCents))
            .withShipping(Int(event.purchase.shippingCostInCents))
            .withDiscount(Int(event.purchase.discountInCents))

    @unknown default:
        throw NSError(domain: "TrackingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unknown event case"])
    }
}
