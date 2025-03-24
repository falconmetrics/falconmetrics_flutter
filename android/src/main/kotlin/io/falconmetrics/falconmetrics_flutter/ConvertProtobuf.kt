package io.falconmetrics.falconmetrics_flutter

import io.falconmetrics.sdk.AddedToCartEvent
import io.falconmetrics.sdk.CouponAppliedEvent
import io.falconmetrics.sdk.PurchaseEvent
import io.falconmetrics.sdk.TrackingEvent
import io.falconmetrics.sdk.UserSignedUpOrLoggedInEvent


fun convertTrackingEvent(event: Event.TrackingEvent): TrackingEvent {
    return when (event.getEventCase()) {
        Event.TrackingEvent.EventCase.USER_SIGNED_UP_OR_LOGGED_IN ->
            UserSignedUpOrLoggedInEvent()

        Event.TrackingEvent.EventCase.ADDED_TO_CART ->
            AddedToCartEvent(
                itemId = event.addedToCart.itemId,
                quantity = event.addedToCart.quantity,
                productPriceInCents = event.addedToCart.productPriceInCents,
                currency = event.addedToCart.currency,
                productCategory = event.addedToCart.productCategory,
                cartId = event.addedToCart.cartId
            )

        Event.TrackingEvent.EventCase.COUPON_APPLIED ->
            CouponAppliedEvent(
                couponCode = event.couponApplied.couponCode,
                cartId = event.couponApplied.cartId
            )

        Event.TrackingEvent.EventCase.PURCHASE ->
            PurchaseEvent(
                itemId = event.purchase.itemId,
                quantity = event.purchase.quantity,
                transactionId = event.purchase.transactionId,
                productPriceInCents = event.purchase.productPriceInCents,
                currency = event.purchase.currency,
                revenueInCents = event.purchase.revenueInCents,
                productCategory = event.purchase.productCategory,
                cartId = event.purchase.cartId,
                paymentMethod = event.purchase.paymentMethod,
                taxInCents = event.purchase.taxInCents,
                shippingCostInCents = event.purchase.shippingCostInCents,
                discountInCents = event.purchase.discountInCents
            )

        Event.TrackingEvent.EventCase.EVENT_NOT_SET -> throw IllegalArgumentException("Event not set")
    }

}
