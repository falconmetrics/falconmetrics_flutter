import io.falconmetrics.falconmetrics_flutter.convertTrackingEvent
import io.falconmetrics.sdk.AddedToCartEvent
import io.falconmetrics.sdk.CouponAppliedEvent
import io.falconmetrics.sdk.PurchaseEvent
import io.falconmetrics.sdk.UserSignedUpOrLoggedInEvent
import org.junit.jupiter.api.Assertions.assertTrue
import kotlin.test.Test
import kotlin.test.assertEquals

class ConvertProtobufEventTest {

    @Test
    fun `It should return UserSignedUpOrLoggedInEvent when event is USER_SIGNED_UP_OR_LOGGED_IN`() {
        // Arrange
        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setUserSignedUpOrLoggedIn(Event.UserSignedUpOrLoggedInEvent.getDefaultInstance())
            .build()

        val result = convertTrackingEvent(trackingEvent)

        assertTrue(result is UserSignedUpOrLoggedInEvent)
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
        val couponAppliedEvent = Event.CouponAppliedEvent.newBuilder()
            .setCouponCode("SAVE20")
            .setCartId("cart789")
            .build()

        val trackingEvent = Event.TrackingEvent.newBuilder()
            .setCouponApplied(couponAppliedEvent)
            .build()

        val result = convertTrackingEvent(trackingEvent)

        assertTrue(result is CouponAppliedEvent)
        result as CouponAppliedEvent
        assertEquals("SAVE20", result.couponCode)
        assertEquals("cart789", result.cartId)
    }

    @Test
    fun `convertTrackingEvent should return PurchaseEvent when event is PURCHASE`() {
        // Arrange
        val purchaseEvent = Event.PurchaseEvent.newBuilder()
            .setItemId("item456")
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
        assertEquals("item456", result.itemId)
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