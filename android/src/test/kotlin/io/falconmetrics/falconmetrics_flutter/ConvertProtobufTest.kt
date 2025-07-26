import io.falconmetrics.falconmetrics_flutter.convertTrackingEvent
import io.falconmetrics.sdk.AddedToCartEvent
import io.falconmetrics.sdk.SubscribeEvent
import io.falconmetrics.sdk.PurchaseEvent
import io.falconmetrics.sdk.CompleteRegistrationEvent
import io.falconmetrics.sdk.CustomEvent
import org.junit.jupiter.api.Assertions.assertTrue
import pb.Event
import kotlin.test.Test
import kotlin.test.assertEquals

class ConvertProtobufEventTest {

    @Test
    fun `It should return UserSignedUpOrLoggedInEvent when event is USER_SIGNED_UP_OR_LOGGED_IN`() {
        // Arrange
        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setCompleteRegistration(Event.CompleteRegistrationEvent.getDefaultInstance())
            .build()

        val result = convertTrackingEvent(trackingEvent)

        assertTrue(result is CompleteRegistrationEvent)
    }

    @Test
    fun `It should return AddedToCartEvent when event is ADDED_TO_CART`() {
        val addedToCartEvent = Event.AddedToCartEvent.newBuilder()
            .setItemId("item123")
            .setQuantity(2)
            .setProductPriceInCents(1000)
            .setCurrency("USD")
            .setProductCategory("Electronics")
            .setCartId("cart456")
            .build()

        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setAddedToCart(addedToCartEvent)
            .build()

        val result = convertTrackingEvent(trackingEvent)


        assertTrue(result is AddedToCartEvent)
        result as AddedToCartEvent
        assertEquals("item123", result.itemId)
        assertEquals(2, result.quantity)
        assertEquals(1000, result.productPriceInCents)
        assertEquals("USD", result.currency)
        assertEquals("Electronics", result.productCategory)
        assertEquals("cart456", result.cartId)
    }

    @Test
    fun `It should return CouponAppliedEvent when event is COUPON_APPLIED`() {
        val event = Event.SubscriptionEvent.newBuilder()
            .setCurrency("USD")
            .setPredictedLtvValueInCents(10000)
            .build()

        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setSubscribe(event)
            .build()

        val result = convertTrackingEvent(trackingEvent)

        assertTrue(result is SubscribeEvent)
        result as SubscribeEvent
        assertEquals("USD", result.currency)
        assertEquals(10000, result.predictedLtvValueInCents)
    }

    @Test
    fun `It should return Custom event when event is CustomEvent`() {
        val attributeValue1 = Event.AttributeValue.newBuilder()
            .setStringValue("my_value")
            .build()

        val attributeValue2 = Event.AttributeValue.newBuilder()
            .setIntValue(1000)
            .build()

        val attributeValue3 = Event.AttributeValue.newBuilder()
            .setBoolValue(false)
            .build()

        val attributeValue4 = Event.AttributeValue.newBuilder()
            .setDoubleValue(3.14)
            .build()

        val event = Event.CustomEvent.newBuilder()
            .setEventName("my_custom_event")
            .putAllAttributes(
                mapOf(
                    "key1" to attributeValue1,
                    "key2" to attributeValue2,
                    "key3" to attributeValue3,
                    "key4" to attributeValue4
                )
            )
            .build()

        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setCustomEvent(event)
            .build()

        val result = convertTrackingEvent(trackingEvent)

        assertTrue(result is CustomEvent)
        result as CustomEvent
        assertEquals("my_custom_event", result.eventName)
        assertEquals(
            mapOf("key1" to "my_value", "key2" to 1000, "key3" to false, "key4" to 3.14),
            result.attributes
        )
    }

    @Test
    fun `It should return Custom event with revenue`() {
        val attributeValue1 = Event.AttributeValue.newBuilder()
            .setStringValue("my_value")
            .build()

        val attributeValue2 = Event.AttributeValue.newBuilder()
            .setIntValue(1000)
            .build()

        val attributeValue3 = Event.AttributeValue.newBuilder()
            .setBoolValue(false)
            .build()

        val attributeValue4 = Event.AttributeValue.newBuilder()
            .setDoubleValue(3.14)
            .build()

        val event = Event.CustomEvent.newBuilder()
            .setEventName("my_custom_event")
            .setCurrency("USD")
            .setRevenueInCents(1000)
            .putAllAttributes(
                mapOf(
                    "key1" to attributeValue1,
                    "key2" to attributeValue2,
                    "key3" to attributeValue3,
                    "key4" to attributeValue4
                )
            )
            .build()

        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setCustomEvent(event)
            .build()

        val result = convertTrackingEvent(trackingEvent)

        assertTrue(result is CustomEvent)
        result as CustomEvent
        assertEquals("my_custom_event", result.eventName)
        assertEquals("USD", result.currency)
        assertEquals(1000, result.revenueInCents)
        assertEquals(
            mapOf("key1" to "my_value", "key2" to 1000, "key3" to false, "key4" to 3.14),
            result.attributes
        )
    }


    @Test
    fun `convertTrackingEvent should return PurchaseEvent when event is PURCHASE`() {
        // Arrange
        val purchaseEvent = Event.PurchaseEvent.newBuilder()
            .addItemIds("item456")
            .setQuantity(1)
            .setTransactionId("txn123")
            .setProductPriceInCents(5000)
            .setCurrency("EUR")
            .setRevenueInCents(4500)
            .setProductCategory("Books")
            .setCartId("cart101")
            .setPaymentMethod("Credit Card")
            .setTaxInCents(500)
            .setShippingCostInCents(0)
            .setDiscountInCents(500)
            .build()

        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setPurchase(purchaseEvent)
            .build()

        // Act
        val result = convertTrackingEvent(trackingEvent)

        // Assert
        assertTrue(result is PurchaseEvent)
        result as PurchaseEvent
        assertEquals(listOf("item456"), result.itemIds)
        assertEquals(1, result.quantity)
        assertEquals("txn123", result.transactionId)
        assertEquals(5000, result.productPriceInCents)
        assertEquals("EUR", result.currency)
        assertEquals(4500, result.revenueInCents)
        assertEquals("Books", result.productCategory)
        assertEquals("cart101", result.cartId)
        assertEquals("Credit Card", result.paymentMethod)
        assertEquals(500, result.taxInCents)
        assertEquals(0, result.shippingCostInCents)
        assertEquals(500, result.discountInCents)
    }
}