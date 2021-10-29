///
//  Generated code. Do not modify.
//  source: notifier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'roomNumber', '3': 4, '4': 1, '5': 5, '10': 'roomNumber'},
    const {'1': 'apartmentName', '3': 5, '4': 1, '5': 9, '10': 'apartmentName'},
    const {'1': 'machineID', '3': 6, '4': 1, '5': 5, '10': 'machineID'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSGgoIdXNlck5hbWUYASABKAlSCHVzZXJOYW1lEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQSHgoKcm9vbU51bWJlchgEIAEoBVIKcm9vbU51bWJlchIkCg1hcGFydG1lbnROYW1lGAUgASgJUg1hcGFydG1lbnROYW1lEhwKCW1hY2hpbmVJRBgGIAEoBVIJbWFjaGluZUlE');
@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = const {
  '1': 'RegisterResponse',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 5, '10': 'uid'},
    const {'1': 'apartmentName', '3': 3, '4': 1, '5': 9, '10': 'apartmentName'},
    const {'1': 'roomNumber', '3': 4, '4': 1, '5': 5, '10': 'roomNumber'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode('ChBSZWdpc3RlclJlc3BvbnNlEhQKBXRva2VuGAEgASgJUgV0b2tlbhIQCgN1aWQYAiABKAVSA3VpZBIkCg1hcGFydG1lbnROYW1lGAMgASgJUg1hcGFydG1lbnROYW1lEh4KCnJvb21OdW1iZXIYBCABKAVSCnJvb21OdW1iZXI=');
@$core.Deprecated('Use notifierRequestDescriptor instead')
const NotifierRequest$json = const {
  '1': 'NotifierRequest',
  '2': const [
    const {'1': 'machineID', '3': 1, '4': 1, '5': 5, '10': 'machineID'},
  ],
};

/// Descriptor for `NotifierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifierRequestDescriptor = $convert.base64Decode('Cg9Ob3RpZmllclJlcXVlc3QSHAoJbWFjaGluZUlEGAEgASgFUgltYWNoaW5lSUQ=');
@$core.Deprecated('Use notifierResponseDescriptor instead')
const NotifierResponse$json = const {
  '1': 'NotifierResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `NotifierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifierResponseDescriptor = $convert.base64Decode('ChBOb3RpZmllclJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use pushRequestDescriptor instead')
const PushRequest$json = const {
  '1': 'PushRequest',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 5, '10': 'uid'},
  ],
};

/// Descriptor for `PushRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushRequestDescriptor = $convert.base64Decode('CgtQdXNoUmVxdWVzdBIQCgN1aWQYASABKAVSA3VpZA==');
@$core.Deprecated('Use pushReplyDescriptor instead')
const PushReply$json = const {
  '1': 'PushReply',
  '2': const [
    const {'1': 'flag', '3': 1, '4': 1, '5': 8, '10': 'flag'},
  ],
};

/// Descriptor for `PushReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushReplyDescriptor = $convert.base64Decode('CglQdXNoUmVwbHkSEgoEZmxhZxgBIAEoCFIEZmxhZw==');
@$core.Deprecated('Use historyRequestDescriptor instead')
const HistoryRequest$json = const {
  '1': 'HistoryRequest',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 5, '10': 'uid'},
  ],
};

/// Descriptor for `HistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List historyRequestDescriptor = $convert.base64Decode('Cg5IaXN0b3J5UmVxdWVzdBIQCgN1aWQYASABKAVSA3VpZA==');
@$core.Deprecated('Use historyResponseDescriptor instead')
const HistoryResponse$json = const {
  '1': 'HistoryResponse',
  '2': const [
    const {'1': 'history', '3': 1, '4': 3, '5': 9, '10': 'history'},
  ],
};

/// Descriptor for `HistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List historyResponseDescriptor = $convert.base64Decode('Cg9IaXN0b3J5UmVzcG9uc2USGAoHaGlzdG9yeRgBIAMoCVIHaGlzdG9yeQ==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 5, '10': 'uid'},
    const {'1': 'apartmentName', '3': 2, '4': 1, '5': 9, '10': 'apartmentName'},
    const {'1': 'roomNumber', '3': 3, '4': 1, '5': 5, '10': 'roomNumber'},
    const {'1': 'token', '3': 4, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEhAKA3VpZBgBIAEoBVIDdWlkEiQKDWFwYXJ0bWVudE5hbWUYAiABKAlSDWFwYXJ0bWVudE5hbWUSHgoKcm9vbU51bWJlchgDIAEoBVIKcm9vbU51bWJlchIUCgV0b2tlbhgEIAEoCVIFdG9rZW4=');
