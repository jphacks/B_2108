///
//  Generated code. Do not modify.
//  source: notifier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'notifier.pb.dart' as $0;
export 'notifier.pb.dart';

class NotifierServiceClient extends $grpc.Client {
  static final _$registerPost =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/notifierDefine.NotifierService/RegisterPost',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RegisterResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/notifierDefine.NotifierService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));
  static final _$notifier =
      $grpc.ClientMethod<$0.NotifierRequest, $0.NotifierResponse>(
          '/notifierDefine.NotifierService/Notifier',
          ($0.NotifierRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NotifierResponse.fromBuffer(value));
  static final _$push = $grpc.ClientMethod<$0.PushRequest, $0.PushReply>(
      '/notifierDefine.NotifierService/Push',
      ($0.PushRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PushReply.fromBuffer(value));
  static final _$getHistory =
      $grpc.ClientMethod<$0.HistoryRequest, $0.HistoryResponse>(
          '/notifierDefine.NotifierService/GetHistory',
          ($0.HistoryRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.HistoryResponse.fromBuffer(value));

  NotifierServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RegisterResponse> registerPost(
      $0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.NotifierResponse> notifier($0.NotifierRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$notifier, request, options: options);
  }

  $grpc.ResponseStream<$0.PushReply> push($0.PushRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$push, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.HistoryResponse> getHistory($0.HistoryRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHistory, request, options: options);
  }
}

abstract class NotifierServiceBase extends $grpc.Service {
  $core.String get $name => 'notifierDefine.NotifierService';

  NotifierServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'RegisterPost',
        registerPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NotifierRequest, $0.NotifierResponse>(
        'Notifier',
        notifier_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NotifierRequest.fromBuffer(value),
        ($0.NotifierResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PushRequest, $0.PushReply>(
        'Push',
        push_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.PushRequest.fromBuffer(value),
        ($0.PushReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HistoryRequest, $0.HistoryResponse>(
        'GetHistory',
        getHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HistoryRequest.fromBuffer(value),
        ($0.HistoryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterResponse> registerPost_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return registerPost(call, await request);
  }

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.NotifierResponse> notifier_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NotifierRequest> request) async {
    return notifier(call, await request);
  }

  $async.Stream<$0.PushReply> push_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PushRequest> request) async* {
    yield* push(call, await request);
  }

  $async.Future<$0.HistoryResponse> getHistory_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HistoryRequest> request) async {
    return getHistory(call, await request);
  }

  $async.Future<$0.RegisterResponse> registerPost(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.NotifierResponse> notifier(
      $grpc.ServiceCall call, $0.NotifierRequest request);
  $async.Stream<$0.PushReply> push(
      $grpc.ServiceCall call, $0.PushRequest request);
  $async.Future<$0.HistoryResponse> getHistory(
      $grpc.ServiceCall call, $0.HistoryRequest request);
}
