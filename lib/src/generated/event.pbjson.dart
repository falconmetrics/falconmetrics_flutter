// This is a generated file - do not edit.
//
// Generated from event.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use trackingEventDescriptor instead')
const TrackingEvent$json = {
  '1': 'TrackingEvent',
  '2': [
    {
      '1': 'complete_registration',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pb.CompleteRegistrationEvent',
      '9': 0,
      '10': 'completeRegistration'
    },
    {
      '1': 'added_to_cart',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pb.AddedToCartEvent',
      '9': 0,
      '10': 'addedToCart'
    },
    {
      '1': 'subscribe',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.pb.SubscriptionEvent',
      '9': 0,
      '10': 'subscribe'
    },
    {
      '1': 'purchase',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.pb.PurchaseEvent',
      '9': 0,
      '10': 'purchase'
    },
    {
      '1': 'custom_event',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.pb.CustomEvent',
      '9': 0,
      '10': 'customEvent'
    },
  ],
  '8': [
    {'1': 'event'},
  ],
};

/// Descriptor for `TrackingEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackingEventDescriptor = $convert.base64Decode(
    'Cg1UcmFja2luZ0V2ZW50ElQKFWNvbXBsZXRlX3JlZ2lzdHJhdGlvbhgBIAEoCzIdLnBiLkNvbX'
    'BsZXRlUmVnaXN0cmF0aW9uRXZlbnRIAFIUY29tcGxldGVSZWdpc3RyYXRpb24SOgoNYWRkZWRf'
    'dG9fY2FydBgCIAEoCzIULnBiLkFkZGVkVG9DYXJ0RXZlbnRIAFILYWRkZWRUb0NhcnQSNQoJc3'
    'Vic2NyaWJlGAMgASgLMhUucGIuU3Vic2NyaXB0aW9uRXZlbnRIAFIJc3Vic2NyaWJlEi8KCHB1'
    'cmNoYXNlGAQgASgLMhEucGIuUHVyY2hhc2VFdmVudEgAUghwdXJjaGFzZRI0CgxjdXN0b21fZX'
    'ZlbnQYBSABKAsyDy5wYi5DdXN0b21FdmVudEgAUgtjdXN0b21FdmVudEIHCgVldmVudA==');

@$core.Deprecated('Use completeRegistrationEventDescriptor instead')
const CompleteRegistrationEvent$json = {
  '1': 'CompleteRegistrationEvent',
};

/// Descriptor for `CompleteRegistrationEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeRegistrationEventDescriptor =
    $convert.base64Decode('ChlDb21wbGV0ZVJlZ2lzdHJhdGlvbkV2ZW50');

@$core.Deprecated('Use addedToCartEventDescriptor instead')
const AddedToCartEvent$json = {
  '1': 'AddedToCartEvent',
  '2': [
    {'1': 'item_id', '3': 1, '4': 1, '5': 9, '10': 'itemId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {
      '1': 'product_price_in_cents',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'productPriceInCents'
    },
    {'1': 'currency', '3': 4, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'product_category',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'productCategory',
      '17': true
    },
    {
      '1': 'cart_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'cartId',
      '17': true
    },
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

@$core.Deprecated('Use subscriptionEventDescriptor instead')
const SubscriptionEvent$json = {
  '1': 'SubscriptionEvent',
  '2': [
    {
      '1': 'currency',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'currency',
      '17': true
    },
    {
      '1': 'predicted_ltv_value_in_cents',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'predictedLtvValueInCents',
      '17': true
    },
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_predicted_ltv_value_in_cents'},
  ],
};

/// Descriptor for `SubscriptionEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionEventDescriptor = $convert.base64Decode(
    'ChFTdWJzY3JpcHRpb25FdmVudBIfCghjdXJyZW5jeRgBIAEoCUgAUghjdXJyZW5jeYgBARJDCh'
    'xwcmVkaWN0ZWRfbHR2X3ZhbHVlX2luX2NlbnRzGAIgASgFSAFSGHByZWRpY3RlZEx0dlZhbHVl'
    'SW5DZW50c4gBAUILCglfY3VycmVuY3lCHwodX3ByZWRpY3RlZF9sdHZfdmFsdWVfaW5fY2VudH'
    'M=');

@$core.Deprecated('Use purchaseEventDescriptor instead')
const PurchaseEvent$json = {
  '1': 'PurchaseEvent',
  '2': [
    {'1': 'item_ids', '3': 1, '4': 3, '5': 9, '10': 'itemIds'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'transaction_id', '3': 3, '4': 1, '5': 9, '10': 'transactionId'},
    {
      '1': 'product_price_in_cents',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'productPriceInCents'
    },
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'revenue_in_cents', '3': 6, '4': 1, '5': 5, '10': 'revenueInCents'},
    {
      '1': 'product_category',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'productCategory',
      '17': true
    },
    {
      '1': 'cart_id',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'cartId',
      '17': true
    },
    {
      '1': 'payment_method',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'paymentMethod',
      '17': true
    },
    {
      '1': 'tax_in_cents',
      '3': 10,
      '4': 1,
      '5': 5,
      '9': 3,
      '10': 'taxInCents',
      '17': true
    },
    {
      '1': 'shipping_cost_in_cents',
      '3': 11,
      '4': 1,
      '5': 5,
      '9': 4,
      '10': 'shippingCostInCents',
      '17': true
    },
    {
      '1': 'discount_in_cents',
      '3': 12,
      '4': 1,
      '5': 5,
      '9': 5,
      '10': 'discountInCents',
      '17': true
    },
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
    'Cg1QdXJjaGFzZUV2ZW50EhkKCGl0ZW1faWRzGAEgAygJUgdpdGVtSWRzEhoKCHF1YW50aXR5GA'
    'IgASgFUghxdWFudGl0eRIlCg50cmFuc2FjdGlvbl9pZBgDIAEoCVINdHJhbnNhY3Rpb25JZBIz'
    'ChZwcm9kdWN0X3ByaWNlX2luX2NlbnRzGAQgASgFUhNwcm9kdWN0UHJpY2VJbkNlbnRzEhoKCG'
    'N1cnJlbmN5GAUgASgJUghjdXJyZW5jeRIoChByZXZlbnVlX2luX2NlbnRzGAYgASgFUg5yZXZl'
    'bnVlSW5DZW50cxIuChBwcm9kdWN0X2NhdGVnb3J5GAcgASgJSABSD3Byb2R1Y3RDYXRlZ29yeY'
    'gBARIcCgdjYXJ0X2lkGAggASgJSAFSBmNhcnRJZIgBARIqCg5wYXltZW50X21ldGhvZBgJIAEo'
    'CUgCUg1wYXltZW50TWV0aG9kiAEBEiUKDHRheF9pbl9jZW50cxgKIAEoBUgDUgp0YXhJbkNlbn'
    'RziAEBEjgKFnNoaXBwaW5nX2Nvc3RfaW5fY2VudHMYCyABKAVIBFITc2hpcHBpbmdDb3N0SW5D'
    'ZW50c4gBARIvChFkaXNjb3VudF9pbl9jZW50cxgMIAEoBUgFUg9kaXNjb3VudEluQ2VudHOIAQ'
    'FCEwoRX3Byb2R1Y3RfY2F0ZWdvcnlCCgoIX2NhcnRfaWRCEQoPX3BheW1lbnRfbWV0aG9kQg8K'
    'DV90YXhfaW5fY2VudHNCGQoXX3NoaXBwaW5nX2Nvc3RfaW5fY2VudHNCFAoSX2Rpc2NvdW50X2'
    'luX2NlbnRz');

@$core.Deprecated('Use customEventDescriptor instead')
const CustomEvent$json = {
  '1': 'CustomEvent',
  '2': [
    {'1': 'event_name', '3': 1, '4': 1, '5': 9, '10': 'eventName'},
    {
      '1': 'attributes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.pb.CustomEvent.AttributesEntry',
      '10': 'attributes'
    },
    {
      '1': 'currency',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'currency',
      '17': true
    },
    {
      '1': 'revenue_in_cents',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'revenueInCents',
      '17': true
    },
  ],
  '3': [CustomEvent_AttributesEntry$json],
  '8': [
    {'1': '_currency'},
    {'1': '_revenue_in_cents'},
  ],
};

@$core.Deprecated('Use customEventDescriptor instead')
const CustomEvent_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.pb.AttributeValue',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `CustomEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customEventDescriptor = $convert.base64Decode(
    'CgtDdXN0b21FdmVudBIdCgpldmVudF9uYW1lGAEgASgJUglldmVudE5hbWUSPwoKYXR0cmlidX'
    'RlcxgCIAMoCzIfLnBiLkN1c3RvbUV2ZW50LkF0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxIf'
    'CghjdXJyZW5jeRgDIAEoCUgAUghjdXJyZW5jeYgBARItChByZXZlbnVlX2luX2NlbnRzGAQgAS'
    'gFSAFSDnJldmVudWVJbkNlbnRziAEBGlEKD0F0dHJpYnV0ZXNFbnRyeRIQCgNrZXkYASABKAlS'
    'A2tleRIoCgV2YWx1ZRgCIAEoCzISLnBiLkF0dHJpYnV0ZVZhbHVlUgV2YWx1ZToCOAFCCwoJX2'
    'N1cnJlbmN5QhMKEV9yZXZlbnVlX2luX2NlbnRz');

@$core.Deprecated('Use attributeValueDescriptor instead')
const AttributeValue$json = {
  '1': 'AttributeValue',
  '2': [
    {'1': 'string_value', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    {'1': 'int_value', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'intValue'},
    {'1': 'double_value', '3': 3, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'bool_value', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `AttributeValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attributeValueDescriptor = $convert.base64Decode(
    'Cg5BdHRyaWJ1dGVWYWx1ZRIjCgxzdHJpbmdfdmFsdWUYASABKAlIAFILc3RyaW5nVmFsdWUSHQ'
    'oJaW50X3ZhbHVlGAIgASgFSABSCGludFZhbHVlEiMKDGRvdWJsZV92YWx1ZRgDIAEoAUgAUgtk'
    'b3VibGVWYWx1ZRIfCgpib29sX3ZhbHVlGAQgASgISABSCWJvb2xWYWx1ZUIHCgV2YWx1ZQ==');
