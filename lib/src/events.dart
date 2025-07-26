import 'package:equatable/equatable.dart';

/// Base class for all tracking events
sealed class TrackingEvent extends Equatable {
  const TrackingEvent();
}

///Event to track when a user completes their registration
class CompleteRegistrationEvent extends TrackingEvent {
  const CompleteRegistrationEvent();

  @override
  List<Object?> get props => [];
}

/// Event to track a product being added to the cart
class AddedToCartEvent extends TrackingEvent {
  const AddedToCartEvent({
    required this.itemId,
    required this.quantity,
    required this.productPriceInCents,
    required this.currency,
    this.productCategory,
    this.cartId,
  });

  /// The unique id of the item or product
  final String itemId;

  /// The quantity of the item or product
  final int quantity;

  /// The price in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the price is $10.99, the
  /// price in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the price would be 109 if the price is 109 Yen.
  final int productPriceInCents;

  /// The currency of the product in ISO 4217 format
  ///
  /// For example, USD, JPY, EUR, etc.
  final String currency;

  /// The category of the product
  final String? productCategory;

  /// The id (session id) of the cart
  final String? cartId;

  @override
  List<Object?> get props => [
    itemId,
    quantity,
    productPriceInCents,
    currency,
    productCategory,
    cartId,
  ];
}

/// Event to track a subscription
class SubscriptionEvent extends TrackingEvent {
  const SubscriptionEvent({this.currencyCode, this.predictedLtvValueInCents});

  /// The currency of the product in ISO 4217 format
  ///
  /// For example, USD, JPY, EUR, etc.
  final String? currencyCode;

  /// The predicted LTV value in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the price is $10.99, the
  /// price in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the price would be 109 if the price is 109 Yen.
  final int? predictedLtvValueInCents;

  @override
  List<Object?> get props => [currencyCode, predictedLtvValueInCents];
}

/// Custom event to track a custom event
class CustomEvent extends TrackingEvent {
  const CustomEvent({
    required this.eventName,
    this.attributes,
    this.currency,
    this.revenueInCents,
  });

  /// The name of the event make sure it matches the event in your ad network.
  final String eventName;

  /// Attributes associated with the event
  ///
  /// make sure to only use primitive types as values
  /// for example: String, Int, Double, Boolean, etc.
  final Map<String, Object>? attributes;

  /// The revenue in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the revenue is $10.99, the
  /// revenue in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the revenue would be 109 if the revenue is 109 Yen.
  final int? revenueInCents;

  /// The currency of the revenue in ISO 4217 format
  ///
  /// For example, USD, JPY, EUR, etc.
  final String? currency;

  @override
  List<Object?> get props => [eventName, attributes, revenueInCents, currency];
}

class PurchaseEvent extends TrackingEvent {
  const PurchaseEvent({
    required this.itemIds,
    required this.quantity,
    required this.transactionId,
    required this.productPriceInCents,
    required this.currency,
    required this.revenueInCents,
    this.productCategory,
    this.cartId,
    this.paymentMethod,
    this.taxInCents,
    this.shippingCostInCents,
    this.discountInCents,
  });

  /// The unique ids of the items or products
  final List<String> itemIds;

  /// The quantity of the item or product
  final int quantity;

  /// The price in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the price is $10.99, the
  /// price in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the price would be 109 if the price is 109 Yen.
  final int productPriceInCents;

  /// The revenue in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the revenue is $10.99, the
  /// revenue in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the revenue would be 109 if the revenue is 109 Yen.
  final int revenueInCents;

  /// The unique id of the transaction
  final String transactionId;

  /// The currency of the product in ISO 4217 format
  ///
  /// For example, USD, JPY, EUR, etc.
  final String currency;

  /// The category of the product
  final String? productCategory;

  /// The id (session id) of the cart
  final String? cartId;

  /// The payment method used for the transaction
  ///
  /// For example, credit card, paypal, etc.
  final String? paymentMethod;

  /// The tax amount in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the tax is $10.99, the
  /// tax in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the tax would be 109 if the tax is 109 Yen.
  final int? taxInCents;

  /// The shipping cost in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the shipping cost is $10.99, the
  /// shipping cost in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the shipping cost would be 109 if the shipping cost is 109 Yen.
  final int? shippingCostInCents;

  /// The discount amount in cents or in the lowest currency unit.
  ///
  /// For example, if the currency is USD, in case the discount is $10.99, the
  /// discount in cents would be 1099. In case of single digit currencies, such as
  /// the currency is Yen (JPY), the discount would be 109 if the discount is 109 Yen.
  final int? discountInCents;

  @override
  List<Object?> get props => [
    itemIds,
    quantity,
    productPriceInCents,
    currency,
    productCategory,
    cartId,
    transactionId,
    paymentMethod,
    taxInCents,
    shippingCostInCents,
    discountInCents,
    revenueInCents,
  ];
}
