//
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum TrackingEvent_Event {
  userSignedUpOrLoggedIn,
  addedToCart,
  couponApplied,
  purchase,
  notSet
}

/// Base message for all tracking events
class TrackingEvent extends $pb.GeneratedMessage {
  factory TrackingEvent({
    UserSignedUpOrLoggedInEvent? userSignedUpOrLoggedIn,
    AddedToCartEvent? addedToCart,
    CouponAppliedEvent? couponApplied,
    PurchaseEvent? purchase,
  }) {
    final $result = create();
    if (userSignedUpOrLoggedIn != null) {
      $result.userSignedUpOrLoggedIn = userSignedUpOrLoggedIn;
    }
    if (addedToCart != null) {
      $result.addedToCart = addedToCart;
    }
    if (couponApplied != null) {
      $result.couponApplied = couponApplied;
    }
    if (purchase != null) {
      $result.purchase = purchase;
    }
    return $result;
  }
  TrackingEvent._() : super();
  factory TrackingEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TrackingEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TrackingEvent_Event>
      _TrackingEvent_EventByTag = {
    1: TrackingEvent_Event.userSignedUpOrLoggedIn,
    2: TrackingEvent_Event.addedToCart,
    3: TrackingEvent_Event.couponApplied,
    4: TrackingEvent_Event.purchase,
    0: TrackingEvent_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TrackingEvent',
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<UserSignedUpOrLoggedInEvent>(
        1, _omitFieldNames ? '' : 'userSignedUpOrLoggedIn',
        subBuilder: UserSignedUpOrLoggedInEvent.create)
    ..aOM<AddedToCartEvent>(2, _omitFieldNames ? '' : 'addedToCart',
        subBuilder: AddedToCartEvent.create)
    ..aOM<CouponAppliedEvent>(3, _omitFieldNames ? '' : 'couponApplied',
        subBuilder: CouponAppliedEvent.create)
    ..aOM<PurchaseEvent>(4, _omitFieldNames ? '' : 'purchase',
        subBuilder: PurchaseEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TrackingEvent clone() => TrackingEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TrackingEvent copyWith(void Function(TrackingEvent) updates) =>
      super.copyWith((message) => updates(message as TrackingEvent))
          as TrackingEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TrackingEvent create() => TrackingEvent._();
  TrackingEvent createEmptyInstance() => create();
  static $pb.PbList<TrackingEvent> createRepeated() =>
      $pb.PbList<TrackingEvent>();
  @$core.pragma('dart2js:noInline')
  static TrackingEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrackingEvent>(create);
  static TrackingEvent? _defaultInstance;

  TrackingEvent_Event whichEvent() =>
      _TrackingEvent_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  UserSignedUpOrLoggedInEvent get userSignedUpOrLoggedIn => $_getN(0);
  @$pb.TagNumber(1)
  set userSignedUpOrLoggedIn(UserSignedUpOrLoggedInEvent v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserSignedUpOrLoggedIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserSignedUpOrLoggedIn() => clearField(1);
  @$pb.TagNumber(1)
  UserSignedUpOrLoggedInEvent ensureUserSignedUpOrLoggedIn() => $_ensure(0);

  @$pb.TagNumber(2)
  AddedToCartEvent get addedToCart => $_getN(1);
  @$pb.TagNumber(2)
  set addedToCart(AddedToCartEvent v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAddedToCart() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedToCart() => clearField(2);
  @$pb.TagNumber(2)
  AddedToCartEvent ensureAddedToCart() => $_ensure(1);

  @$pb.TagNumber(3)
  CouponAppliedEvent get couponApplied => $_getN(2);
  @$pb.TagNumber(3)
  set couponApplied(CouponAppliedEvent v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCouponApplied() => $_has(2);
  @$pb.TagNumber(3)
  void clearCouponApplied() => clearField(3);
  @$pb.TagNumber(3)
  CouponAppliedEvent ensureCouponApplied() => $_ensure(2);

  @$pb.TagNumber(4)
  PurchaseEvent get purchase => $_getN(3);
  @$pb.TagNumber(4)
  set purchase(PurchaseEvent v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPurchase() => $_has(3);
  @$pb.TagNumber(4)
  void clearPurchase() => clearField(4);
  @$pb.TagNumber(4)
  PurchaseEvent ensurePurchase() => $_ensure(3);
}

/// Event to track a user signing up or logging in
class UserSignedUpOrLoggedInEvent extends $pb.GeneratedMessage {
  factory UserSignedUpOrLoggedInEvent() => create();
  UserSignedUpOrLoggedInEvent._() : super();
  factory UserSignedUpOrLoggedInEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserSignedUpOrLoggedInEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserSignedUpOrLoggedInEvent',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserSignedUpOrLoggedInEvent clone() =>
      UserSignedUpOrLoggedInEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserSignedUpOrLoggedInEvent copyWith(
          void Function(UserSignedUpOrLoggedInEvent) updates) =>
      super.copyWith(
              (message) => updates(message as UserSignedUpOrLoggedInEvent))
          as UserSignedUpOrLoggedInEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSignedUpOrLoggedInEvent create() =>
      UserSignedUpOrLoggedInEvent._();
  UserSignedUpOrLoggedInEvent createEmptyInstance() => create();
  static $pb.PbList<UserSignedUpOrLoggedInEvent> createRepeated() =>
      $pb.PbList<UserSignedUpOrLoggedInEvent>();
  @$core.pragma('dart2js:noInline')
  static UserSignedUpOrLoggedInEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserSignedUpOrLoggedInEvent>(create);
  static UserSignedUpOrLoggedInEvent? _defaultInstance;
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
    final $result = create();
    if (itemId != null) {
      $result.itemId = itemId;
    }
    if (quantity != null) {
      $result.quantity = quantity;
    }
    if (productPriceInCents != null) {
      $result.productPriceInCents = productPriceInCents;
    }
    if (currency != null) {
      $result.currency = currency;
    }
    if (productCategory != null) {
      $result.productCategory = productCategory;
    }
    if (cartId != null) {
      $result.cartId = cartId;
    }
    return $result;
  }
  AddedToCartEvent._() : super();
  factory AddedToCartEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddedToCartEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddedToCartEvent',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'itemId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'productPriceInCents', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'currency')
    ..aOS(5, _omitFieldNames ? '' : 'productCategory')
    ..aOS(6, _omitFieldNames ? '' : 'cartId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AddedToCartEvent clone() => AddedToCartEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AddedToCartEvent copyWith(void Function(AddedToCartEvent) updates) =>
      super.copyWith((message) => updates(message as AddedToCartEvent))
          as AddedToCartEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddedToCartEvent create() => AddedToCartEvent._();
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
  set itemId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get productPriceInCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set productPriceInCents($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProductPriceInCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductPriceInCents() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get currency => $_getSZ(3);
  @$pb.TagNumber(4)
  set currency($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get productCategory => $_getSZ(4);
  @$pb.TagNumber(5)
  set productCategory($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProductCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearProductCategory() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cartId => $_getSZ(5);
  @$pb.TagNumber(6)
  set cartId($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCartId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCartId() => clearField(6);
}

/// Event to track a coupon being applied to a cart
class CouponAppliedEvent extends $pb.GeneratedMessage {
  factory CouponAppliedEvent({
    $core.String? couponCode,
    $core.String? cartId,
  }) {
    final $result = create();
    if (couponCode != null) {
      $result.couponCode = couponCode;
    }
    if (cartId != null) {
      $result.cartId = cartId;
    }
    return $result;
  }
  CouponAppliedEvent._() : super();
  factory CouponAppliedEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CouponAppliedEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CouponAppliedEvent',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'couponCode')
    ..aOS(2, _omitFieldNames ? '' : 'cartId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CouponAppliedEvent clone() => CouponAppliedEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CouponAppliedEvent copyWith(void Function(CouponAppliedEvent) updates) =>
      super.copyWith((message) => updates(message as CouponAppliedEvent))
          as CouponAppliedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CouponAppliedEvent create() => CouponAppliedEvent._();
  CouponAppliedEvent createEmptyInstance() => create();
  static $pb.PbList<CouponAppliedEvent> createRepeated() =>
      $pb.PbList<CouponAppliedEvent>();
  @$core.pragma('dart2js:noInline')
  static CouponAppliedEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CouponAppliedEvent>(create);
  static CouponAppliedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get couponCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set couponCode($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCouponCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouponCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cartId => $_getSZ(1);
  @$pb.TagNumber(2)
  set cartId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCartId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCartId() => clearField(2);
}

/// Event to track a purchase
class PurchaseEvent extends $pb.GeneratedMessage {
  factory PurchaseEvent({
    $core.String? itemId,
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
    final $result = create();
    if (itemId != null) {
      $result.itemId = itemId;
    }
    if (quantity != null) {
      $result.quantity = quantity;
    }
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    if (productPriceInCents != null) {
      $result.productPriceInCents = productPriceInCents;
    }
    if (currency != null) {
      $result.currency = currency;
    }
    if (revenueInCents != null) {
      $result.revenueInCents = revenueInCents;
    }
    if (productCategory != null) {
      $result.productCategory = productCategory;
    }
    if (cartId != null) {
      $result.cartId = cartId;
    }
    if (paymentMethod != null) {
      $result.paymentMethod = paymentMethod;
    }
    if (taxInCents != null) {
      $result.taxInCents = taxInCents;
    }
    if (shippingCostInCents != null) {
      $result.shippingCostInCents = shippingCostInCents;
    }
    if (discountInCents != null) {
      $result.discountInCents = discountInCents;
    }
    return $result;
  }
  PurchaseEvent._() : super();
  factory PurchaseEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PurchaseEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PurchaseEvent',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'itemId')
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

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PurchaseEvent clone() => PurchaseEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PurchaseEvent copyWith(void Function(PurchaseEvent) updates) =>
      super.copyWith((message) => updates(message as PurchaseEvent))
          as PurchaseEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseEvent create() => PurchaseEvent._();
  PurchaseEvent createEmptyInstance() => create();
  static $pb.PbList<PurchaseEvent> createRepeated() =>
      $pb.PbList<PurchaseEvent>();
  @$core.pragma('dart2js:noInline')
  static PurchaseEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PurchaseEvent>(create);
  static PurchaseEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get itemId => $_getSZ(0);
  @$pb.TagNumber(1)
  set itemId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasItemId() => $_has(0);
  @$pb.TagNumber(1)
  void clearItemId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transactionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set transactionId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTransactionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get productPriceInCents => $_getIZ(3);
  @$pb.TagNumber(4)
  set productPriceInCents($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProductPriceInCents() => $_has(3);
  @$pb.TagNumber(4)
  void clearProductPriceInCents() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get revenueInCents => $_getIZ(5);
  @$pb.TagNumber(6)
  set revenueInCents($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRevenueInCents() => $_has(5);
  @$pb.TagNumber(6)
  void clearRevenueInCents() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get productCategory => $_getSZ(6);
  @$pb.TagNumber(7)
  set productCategory($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasProductCategory() => $_has(6);
  @$pb.TagNumber(7)
  void clearProductCategory() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get cartId => $_getSZ(7);
  @$pb.TagNumber(8)
  set cartId($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCartId() => $_has(7);
  @$pb.TagNumber(8)
  void clearCartId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get paymentMethod => $_getSZ(8);
  @$pb.TagNumber(9)
  set paymentMethod($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPaymentMethod() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentMethod() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get taxInCents => $_getIZ(9);
  @$pb.TagNumber(10)
  set taxInCents($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTaxInCents() => $_has(9);
  @$pb.TagNumber(10)
  void clearTaxInCents() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get shippingCostInCents => $_getIZ(10);
  @$pb.TagNumber(11)
  set shippingCostInCents($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasShippingCostInCents() => $_has(10);
  @$pb.TagNumber(11)
  void clearShippingCostInCents() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get discountInCents => $_getIZ(11);
  @$pb.TagNumber(12)
  set discountInCents($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDiscountInCents() => $_has(11);
  @$pb.TagNumber(12)
  void clearDiscountInCents() => clearField(12);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
