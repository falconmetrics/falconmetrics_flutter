// This is a generated file - do not edit.
//
// Generated from event.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum TrackingEvent_Event {
  completeRegistration,
  addedToCart,
  subscribe,
  purchase,
  customEvent,
  notSet
}

/// Base message for all tracking events
class TrackingEvent extends $pb.GeneratedMessage {
  factory TrackingEvent({
    CompleteRegistrationEvent? completeRegistration,
    AddedToCartEvent? addedToCart,
    SubscriptionEvent? subscribe,
    PurchaseEvent? purchase,
    CustomEvent? customEvent,
  }) {
    final result = create();
    if (completeRegistration != null)
      result.completeRegistration = completeRegistration;
    if (addedToCart != null) result.addedToCart = addedToCart;
    if (subscribe != null) result.subscribe = subscribe;
    if (purchase != null) result.purchase = purchase;
    if (customEvent != null) result.customEvent = customEvent;
    return result;
  }

  TrackingEvent._();

  factory TrackingEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TrackingEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, TrackingEvent_Event>
      _TrackingEvent_EventByTag = {
    1: TrackingEvent_Event.completeRegistration,
    2: TrackingEvent_Event.addedToCart,
    3: TrackingEvent_Event.subscribe,
    4: TrackingEvent_Event.purchase,
    5: TrackingEvent_Event.customEvent,
    0: TrackingEvent_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrackingEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<CompleteRegistrationEvent>(
        1, _omitFieldNames ? '' : 'completeRegistration',
        subBuilder: CompleteRegistrationEvent.create)
    ..aOM<AddedToCartEvent>(2, _omitFieldNames ? '' : 'addedToCart',
        subBuilder: AddedToCartEvent.create)
    ..aOM<SubscriptionEvent>(3, _omitFieldNames ? '' : 'subscribe',
        subBuilder: SubscriptionEvent.create)
    ..aOM<PurchaseEvent>(4, _omitFieldNames ? '' : 'purchase',
        subBuilder: PurchaseEvent.create)
    ..aOM<CustomEvent>(5, _omitFieldNames ? '' : 'customEvent',
        subBuilder: CustomEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrackingEvent clone() => TrackingEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TrackingEvent copyWith(void Function(TrackingEvent) updates) =>
      super.copyWith((message) => updates(message as TrackingEvent))
          as TrackingEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackingEvent create() => TrackingEvent._();
  @$core.override
  TrackingEvent createEmptyInstance() => create();
  static $pb.PbList<TrackingEvent> createRepeated() =>
      $pb.PbList<TrackingEvent>();
  @$core.pragma('dart2js:noInline')
  static TrackingEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrackingEvent>(create);
  static TrackingEvent? _defaultInstance;

  TrackingEvent_Event whichEvent() =>
      _TrackingEvent_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CompleteRegistrationEvent get completeRegistration => $_getN(0);
  @$pb.TagNumber(1)
  set completeRegistration(CompleteRegistrationEvent value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCompleteRegistration() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompleteRegistration() => $_clearField(1);
  @$pb.TagNumber(1)
  CompleteRegistrationEvent ensureCompleteRegistration() => $_ensure(0);

  @$pb.TagNumber(2)
  AddedToCartEvent get addedToCart => $_getN(1);
  @$pb.TagNumber(2)
  set addedToCart(AddedToCartEvent value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAddedToCart() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedToCart() => $_clearField(2);
  @$pb.TagNumber(2)
  AddedToCartEvent ensureAddedToCart() => $_ensure(1);

  @$pb.TagNumber(3)
  SubscriptionEvent get subscribe => $_getN(2);
  @$pb.TagNumber(3)
  set subscribe(SubscriptionEvent value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSubscribe() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubscribe() => $_clearField(3);
  @$pb.TagNumber(3)
  SubscriptionEvent ensureSubscribe() => $_ensure(2);

  @$pb.TagNumber(4)
  PurchaseEvent get purchase => $_getN(3);
  @$pb.TagNumber(4)
  set purchase(PurchaseEvent value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPurchase() => $_has(3);
  @$pb.TagNumber(4)
  void clearPurchase() => $_clearField(4);
  @$pb.TagNumber(4)
  PurchaseEvent ensurePurchase() => $_ensure(3);

  @$pb.TagNumber(5)
  CustomEvent get customEvent => $_getN(4);
  @$pb.TagNumber(5)
  set customEvent(CustomEvent value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCustomEvent() => $_has(4);
  @$pb.TagNumber(5)
  void clearCustomEvent() => $_clearField(5);
  @$pb.TagNumber(5)
  CustomEvent ensureCustomEvent() => $_ensure(4);
}

/// Event to track when a user completes their registration
class CompleteRegistrationEvent extends $pb.GeneratedMessage {
  factory CompleteRegistrationEvent() => create();

  CompleteRegistrationEvent._();

  factory CompleteRegistrationEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompleteRegistrationEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompleteRegistrationEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompleteRegistrationEvent clone() =>
      CompleteRegistrationEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompleteRegistrationEvent copyWith(
          void Function(CompleteRegistrationEvent) updates) =>
      super.copyWith((message) => updates(message as CompleteRegistrationEvent))
          as CompleteRegistrationEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompleteRegistrationEvent create() => CompleteRegistrationEvent._();
  @$core.override
  CompleteRegistrationEvent createEmptyInstance() => create();
  static $pb.PbList<CompleteRegistrationEvent> createRepeated() =>
      $pb.PbList<CompleteRegistrationEvent>();
  @$core.pragma('dart2js:noInline')
  static CompleteRegistrationEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompleteRegistrationEvent>(create);
  static CompleteRegistrationEvent? _defaultInstance;
}

/// Event to track a product being added to the cart
class AddedToCartEvent extends $pb.GeneratedMessage {
  factory AddedToCartEvent({
    $core.String? itemId,
    $core.int? quantity,
    $core.int? productPriceInCents,
    $core.String? currency,
    $core.String? productCategory,
    $core.String? cartId,
  }) {
    final result = create();
    if (itemId != null) result.itemId = itemId;
    if (quantity != null) result.quantity = quantity;
    if (productPriceInCents != null)
      result.productPriceInCents = productPriceInCents;
    if (currency != null) result.currency = currency;
    if (productCategory != null) result.productCategory = productCategory;
    if (cartId != null) result.cartId = cartId;
    return result;
  }

  AddedToCartEvent._();

  factory AddedToCartEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddedToCartEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddedToCartEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'itemId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'productPriceInCents', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'currency')
    ..aOS(5, _omitFieldNames ? '' : 'productCategory')
    ..aOS(6, _omitFieldNames ? '' : 'cartId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddedToCartEvent clone() => AddedToCartEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddedToCartEvent copyWith(void Function(AddedToCartEvent) updates) =>
      super.copyWith((message) => updates(message as AddedToCartEvent))
          as AddedToCartEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddedToCartEvent create() => AddedToCartEvent._();
  @$core.override
  AddedToCartEvent createEmptyInstance() => create();
  static $pb.PbList<AddedToCartEvent> createRepeated() =>
      $pb.PbList<AddedToCartEvent>();
  @$core.pragma('dart2js:noInline')
  static AddedToCartEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddedToCartEvent>(create);
  static AddedToCartEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get itemId => $_getSZ(0);
  @$pb.TagNumber(1)
  set itemId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get productPriceInCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set productPriceInCents($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProductPriceInCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductPriceInCents() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get currency => $_getSZ(3);
  @$pb.TagNumber(4)
  set currency($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get productCategory => $_getSZ(4);
  @$pb.TagNumber(5)
  set productCategory($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasProductCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearProductCategory() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get cartId => $_getSZ(5);
  @$pb.TagNumber(6)
  set cartId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCartId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCartId() => $_clearField(6);
}

/// Event to track a subscription
class SubscriptionEvent extends $pb.GeneratedMessage {
  factory SubscriptionEvent({
    $core.String? currency,
    $core.int? predictedLtvValueInCents,
  }) {
    final result = create();
    if (currency != null) result.currency = currency;
    if (predictedLtvValueInCents != null)
      result.predictedLtvValueInCents = predictedLtvValueInCents;
    return result;
  }

  SubscriptionEvent._();

  factory SubscriptionEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubscriptionEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubscriptionEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currency')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'predictedLtvValueInCents',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionEvent clone() => SubscriptionEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubscriptionEvent copyWith(void Function(SubscriptionEvent) updates) =>
      super.copyWith((message) => updates(message as SubscriptionEvent))
          as SubscriptionEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscriptionEvent create() => SubscriptionEvent._();
  @$core.override
  SubscriptionEvent createEmptyInstance() => create();
  static $pb.PbList<SubscriptionEvent> createRepeated() =>
      $pb.PbList<SubscriptionEvent>();
  @$core.pragma('dart2js:noInline')
  static SubscriptionEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubscriptionEvent>(create);
  static SubscriptionEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currency => $_getSZ(0);
  @$pb.TagNumber(1)
  set currency($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrency() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrency() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get predictedLtvValueInCents => $_getIZ(1);
  @$pb.TagNumber(2)
  set predictedLtvValueInCents($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPredictedLtvValueInCents() => $_has(1);
  @$pb.TagNumber(2)
  void clearPredictedLtvValueInCents() => $_clearField(2);
}

/// Event to track a purchase
class PurchaseEvent extends $pb.GeneratedMessage {
  factory PurchaseEvent({
    $core.Iterable<$core.String>? itemIds,
    $core.int? quantity,
    $core.String? transactionId,
    $core.int? productPriceInCents,
    $core.String? currency,
    $core.int? revenueInCents,
    $core.String? productCategory,
    $core.String? cartId,
    $core.String? paymentMethod,
    $core.int? taxInCents,
    $core.int? shippingCostInCents,
    $core.int? discountInCents,
  }) {
    final result = create();
    if (itemIds != null) result.itemIds.addAll(itemIds);
    if (quantity != null) result.quantity = quantity;
    if (transactionId != null) result.transactionId = transactionId;
    if (productPriceInCents != null)
      result.productPriceInCents = productPriceInCents;
    if (currency != null) result.currency = currency;
    if (revenueInCents != null) result.revenueInCents = revenueInCents;
    if (productCategory != null) result.productCategory = productCategory;
    if (cartId != null) result.cartId = cartId;
    if (paymentMethod != null) result.paymentMethod = paymentMethod;
    if (taxInCents != null) result.taxInCents = taxInCents;
    if (shippingCostInCents != null)
      result.shippingCostInCents = shippingCostInCents;
    if (discountInCents != null) result.discountInCents = discountInCents;
    return result;
  }

  PurchaseEvent._();

  factory PurchaseEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PurchaseEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PurchaseEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'itemIds')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'transactionId')
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'productPriceInCents', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'currency')
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'revenueInCents', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'productCategory')
    ..aOS(8, _omitFieldNames ? '' : 'cartId')
    ..aOS(9, _omitFieldNames ? '' : 'paymentMethod')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'taxInCents', $pb.PbFieldType.O3)
    ..a<$core.int>(
        11, _omitFieldNames ? '' : 'shippingCostInCents', $pb.PbFieldType.O3)
    ..a<$core.int>(
        12, _omitFieldNames ? '' : 'discountInCents', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseEvent clone() => PurchaseEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseEvent copyWith(void Function(PurchaseEvent) updates) =>
      super.copyWith((message) => updates(message as PurchaseEvent))
          as PurchaseEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseEvent create() => PurchaseEvent._();
  @$core.override
  PurchaseEvent createEmptyInstance() => create();
  static $pb.PbList<PurchaseEvent> createRepeated() =>
      $pb.PbList<PurchaseEvent>();
  @$core.pragma('dart2js:noInline')
  static PurchaseEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PurchaseEvent>(create);
  static PurchaseEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get itemIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get transactionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set transactionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get productPriceInCents => $_getIZ(3);
  @$pb.TagNumber(4)
  set productPriceInCents($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProductPriceInCents() => $_has(3);
  @$pb.TagNumber(4)
  void clearProductPriceInCents() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get revenueInCents => $_getIZ(5);
  @$pb.TagNumber(6)
  set revenueInCents($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRevenueInCents() => $_has(5);
  @$pb.TagNumber(6)
  void clearRevenueInCents() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get productCategory => $_getSZ(6);
  @$pb.TagNumber(7)
  set productCategory($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasProductCategory() => $_has(6);
  @$pb.TagNumber(7)
  void clearProductCategory() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get cartId => $_getSZ(7);
  @$pb.TagNumber(8)
  set cartId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCartId() => $_has(7);
  @$pb.TagNumber(8)
  void clearCartId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get paymentMethod => $_getSZ(8);
  @$pb.TagNumber(9)
  set paymentMethod($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPaymentMethod() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentMethod() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get taxInCents => $_getIZ(9);
  @$pb.TagNumber(10)
  set taxInCents($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTaxInCents() => $_has(9);
  @$pb.TagNumber(10)
  void clearTaxInCents() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get shippingCostInCents => $_getIZ(10);
  @$pb.TagNumber(11)
  set shippingCostInCents($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasShippingCostInCents() => $_has(10);
  @$pb.TagNumber(11)
  void clearShippingCostInCents() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get discountInCents => $_getIZ(11);
  @$pb.TagNumber(12)
  set discountInCents($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasDiscountInCents() => $_has(11);
  @$pb.TagNumber(12)
  void clearDiscountInCents() => $_clearField(12);
}

/// Event to track a custom event
class CustomEvent extends $pb.GeneratedMessage {
  factory CustomEvent({
    $core.String? eventName,
    $core.Iterable<$core.MapEntry<$core.String, AttributeValue>>? attributes,
  }) {
    final result = create();
    if (eventName != null) result.eventName = eventName;
    if (attributes != null) result.attributes.addEntries(attributes);
    return result;
  }

  CustomEvent._();

  factory CustomEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventName')
    ..m<$core.String, AttributeValue>(2, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'CustomEvent.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: AttributeValue.create,
        valueDefaultOrMaker: AttributeValue.getDefault,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomEvent clone() => CustomEvent()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomEvent copyWith(void Function(CustomEvent) updates) =>
      super.copyWith((message) => updates(message as CustomEvent))
          as CustomEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomEvent create() => CustomEvent._();
  @$core.override
  CustomEvent createEmptyInstance() => create();
  static $pb.PbList<CustomEvent> createRepeated() => $pb.PbList<CustomEvent>();
  @$core.pragma('dart2js:noInline')
  static CustomEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomEvent>(create);
  static CustomEvent? _defaultInstance;

  /// The name of the event
  @$pb.TagNumber(1)
  $core.String get eventName => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventName() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventName() => $_clearField(1);

  /// Attributes associated with the event
  /// Values are restricted to primitive types (String, Int, Double, Boolean, etc.)
  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, AttributeValue> get attributes => $_getMap(1);
}

enum AttributeValue_Value {
  stringValue,
  intValue,
  doubleValue,
  boolValue,
  notSet
}

/// Union type to represent primitive values for attributes
class AttributeValue extends $pb.GeneratedMessage {
  factory AttributeValue({
    $core.String? stringValue,
    $core.int? intValue,
    $core.double? doubleValue,
    $core.bool? boolValue,
  }) {
    final result = create();
    if (stringValue != null) result.stringValue = stringValue;
    if (intValue != null) result.intValue = intValue;
    if (doubleValue != null) result.doubleValue = doubleValue;
    if (boolValue != null) result.boolValue = boolValue;
    return result;
  }

  AttributeValue._();

  factory AttributeValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AttributeValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, AttributeValue_Value>
      _AttributeValue_ValueByTag = {
    1: AttributeValue_Value.stringValue,
    2: AttributeValue_Value.intValue,
    3: AttributeValue_Value.doubleValue,
    4: AttributeValue_Value.boolValue,
    0: AttributeValue_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttributeValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOS(1, _omitFieldNames ? '' : 'stringValue')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'intValue', $pb.PbFieldType.O3)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..aOB(4, _omitFieldNames ? '' : 'boolValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttributeValue clone() => AttributeValue()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AttributeValue copyWith(void Function(AttributeValue) updates) =>
      super.copyWith((message) => updates(message as AttributeValue))
          as AttributeValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttributeValue create() => AttributeValue._();
  @$core.override
  AttributeValue createEmptyInstance() => create();
  static $pb.PbList<AttributeValue> createRepeated() =>
      $pb.PbList<AttributeValue>();
  @$core.pragma('dart2js:noInline')
  static AttributeValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributeValue>(create);
  static AttributeValue? _defaultInstance;

  AttributeValue_Value whichValue() =>
      _AttributeValue_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get stringValue => $_getSZ(0);
  @$pb.TagNumber(1)
  set stringValue($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStringValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get intValue => $_getIZ(1);
  @$pb.TagNumber(2)
  set intValue($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIntValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntValue() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get doubleValue => $_getN(2);
  @$pb.TagNumber(3)
  set doubleValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDoubleValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearDoubleValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(3);
  @$pb.TagNumber(4)
  set boolValue($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoolValue() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
