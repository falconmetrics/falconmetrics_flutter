//
//  Generated code. Do not modify.
//  source: event.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use trackingEventDescriptor instead')
const TrackingEvent$json = {
  '1': 'TrackingEvent',
  '2': [
    {'1': 'user_signed_up_or_logged_in', '3': 1, '4': 1, '5': 11, '6': '.UserSignedUpOrLoggedInEvent', '9': 0, '10': 'userSignedUpOrLoggedIn'},
    {'1': 'added_to_cart', '3': 2, '4': 1, '5': 11, '6': '.AddedToCartEvent', '9': 0, '10': 'addedToCart'},
    {'1': 'coupon_applied', '3': 3, '4': 1, '5': 11, '6': '.CouponAppliedEvent', '9': 0, '10': 'couponApplied'},
    {'1': 'purchase', '3': 4, '4': 1, '5': 11, '6': '.PurchaseEvent', '9': 0, '10': 'purchase'},
  ],
  '8': [
    {'1': 'event'},
  ],
};

/// Descriptor for `TrackingEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackingEventDescriptor = $convert.base64Decode(
    'Cg1UcmFja2luZ0V2ZW50ElsKG3VzZXJfc2lnbmVkX3VwX29yX2xvZ2dlZF9pbhgBIAEoCzIcLl'
    'VzZXJTaWduZWRVcE9yTG9nZ2VkSW5FdmVudEgAUhZ1c2VyU2lnbmVkVXBPckxvZ2dlZEluEjcK'
    'DWFkZGVkX3RvX2NhcnQYAiABKAsyES5BZGRlZFRvQ2FydEV2ZW50SABSC2FkZGVkVG9DYXJ0Ej'
    'wKDmNvdXBvbl9hcHBsaWVkGAMgASgLMhMuQ291cG9uQXBwbGllZEV2ZW50SABSDWNvdXBvbkFw'
    'cGxpZWQSLAoIcHVyY2hhc2UYBCABKAsyDi5QdXJjaGFzZUV2ZW50SABSCHB1cmNoYXNlQgcKBW'
    'V2ZW50');

@$core.Deprecated('Use userSignedUpOrLoggedInEventDescriptor instead')
const UserSignedUpOrLoggedInEvent$json = {
  '1': 'UserSignedUpOrLoggedInEvent',
};

/// Descriptor for `UserSignedUpOrLoggedInEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSignedUpOrLoggedInEventDescriptor = $convert.base64Decode(
    'ChtVc2VyU2lnbmVkVXBPckxvZ2dlZEluRXZlbnQ=');

@$core.Deprecated('Use addedToCartEventDescriptor instead')
const AddedToCartEvent$json = {
  '1': 'AddedToCartEvent',
  '2': [
    {'1': 'item_id', '3': 1, '4': 1, '5': 9, '10': 'itemId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'product_price_in_cents', '3': 3, '4': 1, '5': 5, '10': 'productPriceInCents'},
    {'1': 'currency', '3': 4, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'product_category', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'productCategory', '17': true},
    {'1': 'cart_id', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'cartId', '17': true},
  ],
  '8': [
    {'1': '_product_category'},
    {'1': '_cart_id'},
  ],
};

/// Descriptor for `AddedToCartEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addedToCartEventDescriptor = $convert.base64Decode(
    'ChBBZGRlZFRvQ2FydEV2ZW50EhcKB2l0ZW1faWQYASABKAlSBml0ZW1JZBIaCghxdWFudGl0eR'
    'gCIAEoBVIIcXVhbnRpdHkSMwoWcHJvZHVjdF9wcmljZV9pbl9jZW50cxgDIAEoBVITcHJvZHVj'
    'dFByaWNlSW5DZW50cxIaCghjdXJyZW5jeRgEIAEoCVIIY3VycmVuY3kSLgoQcHJvZHVjdF9jYX'
    'RlZ29yeRgFIAEoCUgAUg9wcm9kdWN0Q2F0ZWdvcnmIAQESHAoHY2FydF9pZBgGIAEoCUgBUgZj'
    'YXJ0SWSIAQFCEwoRX3Byb2R1Y3RfY2F0ZWdvcnlCCgoIX2NhcnRfaWQ=');

@$core.Deprecated('Use couponAppliedEventDescriptor instead')
const CouponAppliedEvent$json = {
  '1': 'CouponAppliedEvent',
  '2': [
    {'1': 'coupon_code', '3': 1, '4': 1, '5': 9, '10': 'couponCode'},
    {'1': 'cart_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'cartId', '17': true},
  ],
  '8': [
    {'1': '_cart_id'},
  ],
};

/// Descriptor for `CouponAppliedEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List couponAppliedEventDescriptor = $convert.base64Decode(
    'ChJDb3Vwb25BcHBsaWVkRXZlbnQSHwoLY291cG9uX2NvZGUYASABKAlSCmNvdXBvbkNvZGUSHA'
    'oHY2FydF9pZBgCIAEoCUgAUgZjYXJ0SWSIAQFCCgoIX2NhcnRfaWQ=');

@$core.Deprecated('Use purchaseEventDescriptor instead')
const PurchaseEvent$json = {
  '1': 'PurchaseEvent',
  '2': [
    {'1': 'item_id', '3': 1, '4': 1, '5': 9, '10': 'itemId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'transaction_id', '3': 3, '4': 1, '5': 9, '10': 'transactionId'},
    {'1': 'product_price_in_cents', '3': 4, '4': 1, '5': 5, '10': 'productPriceInCents'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'revenue_in_cents', '3': 6, '4': 1, '5': 5, '10': 'revenueInCents'},
    {'1': 'product_category', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'productCategory', '17': true},
    {'1': 'cart_id', '3': 8, '4': 1, '5': 9, '9': 1, '10': 'cartId', '17': true},
    {'1': 'payment_method', '3': 9, '4': 1, '5': 9, '9': 2, '10': 'paymentMethod', '17': true},
    {'1': 'tax_in_cents', '3': 10, '4': 1, '5': 5, '9': 3, '10': 'taxInCents', '17': true},
    {'1': 'shipping_cost_in_cents', '3': 11, '4': 1, '5': 5, '9': 4, '10': 'shippingCostInCents', '17': true},
    {'1': 'discount_in_cents', '3': 12, '4': 1, '5': 5, '9': 5, '10': 'discountInCents', '17': true},
  ],
  '8': [
    {'1': '_product_category'},
    {'1': '_cart_id'},
    {'1': '_payment_method'},
    {'1': '_tax_in_cents'},
    {'1': '_shipping_cost_in_cents'},
    {'1': '_discount_in_cents'},
  ],
};

/// Descriptor for `PurchaseEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseEventDescriptor = $convert.base64Decode(
    'Cg1QdXJjaGFzZUV2ZW50EhcKB2l0ZW1faWQYASABKAlSBml0ZW1JZBIaCghxdWFudGl0eRgCIA'
    'EoBVIIcXVhbnRpdHkSJQoOdHJhbnNhY3Rpb25faWQYAyABKAlSDXRyYW5zYWN0aW9uSWQSMwoW'
    'cHJvZHVjdF9wcmljZV9pbl9jZW50cxgEIAEoBVITcHJvZHVjdFByaWNlSW5DZW50cxIaCghjdX'
    'JyZW5jeRgFIAEoCVIIY3VycmVuY3kSKAoQcmV2ZW51ZV9pbl9jZW50cxgGIAEoBVIOcmV2ZW51'
    'ZUluQ2VudHMSLgoQcHJvZHVjdF9jYXRlZ29yeRgHIAEoCUgAUg9wcm9kdWN0Q2F0ZWdvcnmIAQ'
    'ESHAoHY2FydF9pZBgIIAEoCUgBUgZjYXJ0SWSIAQESKgoOcGF5bWVudF9tZXRob2QYCSABKAlI'
    'AlINcGF5bWVudE1ldGhvZIgBARIlCgx0YXhfaW5fY2VudHMYCiABKAVIA1IKdGF4SW5DZW50c4'
    'gBARI4ChZzaGlwcGluZ19jb3N0X2luX2NlbnRzGAsgASgFSARSE3NoaXBwaW5nQ29zdEluQ2Vu'
    'dHOIAQESLwoRZGlzY291bnRfaW5fY2VudHMYDCABKAVIBVIPZGlzY291bnRJbkNlbnRziAEBQh'
    'MKEV9wcm9kdWN0X2NhdGVnb3J5QgoKCF9jYXJ0X2lkQhEKD19wYXltZW50X21ldGhvZEIPCg1f'
    'dGF4X2luX2NlbnRzQhkKF19zaGlwcGluZ19jb3N0X2luX2NlbnRzQhQKEl9kaXNjb3VudF9pbl'
    '9jZW50cw==');

