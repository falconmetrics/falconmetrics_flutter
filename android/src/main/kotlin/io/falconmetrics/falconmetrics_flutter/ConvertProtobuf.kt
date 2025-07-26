package io.falconmetrics.falconmetrics_flutter

import io.falconmetrics.sdk.AddedToCartEvent
import io.falconmetrics.sdk.CompleteRegistrationEvent
import io.falconmetrics.sdk.CustomEvent
import io.falconmetrics.sdk.PurchaseEvent
import io.falconmetrics.sdk.SubscribeEvent
import io.falconmetrics.sdk.TrackingEvent
import pb.Event


fun convertTrackingEvent(event: Event.TrackingEvent): TrackingEvent {
    return when (event.eventCase) {
        Event.TrackingEvent.EventCase.COMPLETE_REGISTRATION -> {
            CompleteRegistrationEvent()
        }

        Event.TrackingEvent.EventCase.ADDED_TO_CART -> {
            AddedToCartEvent(
                itemId = event.addedToCart.itemId,
                quantity = event.addedToCart.quantity,
                productPriceInCents = event.addedToCart.productPriceInCents,
                currency = event.addedToCart.currency,
                productCategory = event.addedToCart.productCategory,
                cartId = event.addedToCart.cartId
            )
        }

        Event.TrackingEvent.EventCase.SUBSCRIBE -> {
            SubscribeEvent(
                currency = event.subscribe.currency,
                predictedLtvValueInCents = event.subscribe.predictedLtvValueInCents
            )
        }

        Event.TrackingEvent.EventCase.PURCHASE -> {
            PurchaseEvent(
                itemIds = event.purchase.itemIdsList,
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
        }

        Event.TrackingEvent.EventCase.CUSTOM_EVENT -> {

            val attributes = mutableMapOf<String, Any>()
            for ((key, value) in event.customEvent.attributesMap) {
                when (value.valueCase) {
                    Event.AttributeValue.ValueCase.STRING_VALUE -> {
                        attributes[key] = value.stringValue
                    }

                    Event.AttributeValue.ValueCase.INT_VALUE -> {
                        attributes[key] = value.intValue
                    }

                    Event.AttributeValue.ValueCase.DOUBLE_VALUE -> {
                        attributes[key] = value.doubleValue
                    }

                    Event.AttributeValue.ValueCase.BOOL_VALUE -> {
                        attributes[key] = value.boolValue
                    }

                    else -> {
                        //ignore
                    }
                }
            }

            CustomEvent(
                eventName = event.customEvent.eventName,
                attributes = attributes,
                currency = event.customEvent.currency,
                revenueInCents = event.customEvent.revenueInCents
            )
        }


        Event.TrackingEvent.EventCase.EVENT_NOT_SET -> {
            throw IllegalArgumentException("Event not set")
        }
    }

}
