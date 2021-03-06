import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:postapp/protos/notifier.pb.dart';
import 'package:postapp/protos/notifier.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';


class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("History"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            reload_record();
          },
          child: const Text('reload'),
        )));

  }
}

Future<void> reload_record() async {
  final channel = ClientChannel(
    '127.0.0.1',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = NotifierServiceClient(channel);

  // const uid = 1;

  try {
    var response = await stub.getHistory(HistoryRequest()..uid = 1);
    debugPrint('Register Response is: ${response.history}');
  } catch (e) {
    debugPrint('Caught error: $e');
  }
  await channel.shutdown();
}
