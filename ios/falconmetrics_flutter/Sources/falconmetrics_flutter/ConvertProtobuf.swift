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
    case .completeRegistration:
        return FalconMetricsSdk.shared.createCompleteRegistrationBuilder()

    case .addedToCart:
        return FalconMetricsSdk.shared.createAddToCartBuilder()
            .withItemId( event.addedToCart.itemID)
            .withQuantity(Int(event.addedToCart.quantity))
            .withProductPrice(Int(event.addedToCart.productPriceInCents))
            .withCurrency(event.addedToCart.currency)
            .withProductCategory( event.addedToCart.productCategory)
            .withCartId( event.addedToCart.cartID)

    case .subscribe:
        return FalconMetricsSdk.shared.createSubscriptionBuilder()
            .withCurrency( event.subscribe.currency)
            .withPredictedValueInCents(Int(event.subscribe.predictedLtvValueInCents))
        

    case .purchase:
        return FalconMetricsSdk.shared.createPurchaseBuilder()
            .withItemIds(event.purchase.itemIds)
            .withQuantity(Int(event.purchase.quantity))
            .withTransactionId( event.purchase.transactionID)
            .withProductPrice(Int(event.purchase.productPriceInCents))
            .withCurrency(event.purchase.currency)
            .withProductCategory(event.purchase.productCategory)
            .withCartId(event.purchase.cartID)
            .withPaymentMethod(event.purchase.paymentMethod)
            .withTax(Int( event.purchase.taxInCents))
            .withShipping(Int(event.purchase.shippingCostInCents))
            .withDiscount(Int(event.purchase.discountInCents))
        
    case .customEvent:
        return FalconMetricsSdk.shared.createCustomEventBuilder()
            .withAttributes(event.customEvent.attributes)
            .withEventName(event.customEvent.eventName)
            .withCurrency(event.customEvent.currency)
            .withRevenueInCents(Int(event.customEvent.revenueInCents))

    @unknown default:
        throw NSError(domain: "TrackingError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unknown event case"])
    }


func convertUserData(_ userData: Pb_UserData) -> UserData {
    var builder = FalconMetricsSdk.shared.createUserDataBuilder()
    
    if userData.hasEmail && !userData.email.isEmpty {
        builder = builder.withEmail(userData.email)
    }
    if userData.hasPhoneNumber && !userData.phoneNumber.isEmpty {
        builder = builder.withPhoneNumber(userData.phoneNumber)
    }
    if userData.hasFirstName && !userData.firstName.isEmpty {
        builder = builder.withFirstName(userData.firstName)
    }
    if userData.hasLastName && !userData.lastName.isEmpty {
        builder = builder.withLastName(userData.lastName)
    }
    if userData.hasDateOfBirth && !userData.dateOfBirth.isEmpty {
        builder = builder.withDateOfBirth(userData.dateOfBirth)
    }
    if userData.hasCity && !userData.city.isEmpty {
        builder = builder.withCity(userData.city)
    }
    if userData.hasState && !userData.state.isEmpty {
        builder = builder.withState(userData.state)
    }
    if userData.hasPostalCode && !userData.postalCode.isEmpty {
        builder = builder.withPostalCode(userData.postalCode)
    }
    if userData.hasCountry && !userData.country.isEmpty {
        builder = builder.withCountry(userData.country)
    }
    
    return builder.build()
}
}
