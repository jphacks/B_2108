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
      body: const Center(child: Text("History")),
    );
  }
}

// Future<void> main(List<String> args) async {
//   final channel = ClientChannel(
//     'localhost',
//     port: 50051,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   );
//   final stub = NotifierClient(channel);
//   final name = args.isNotEmpty ? args[0] : 'world';

//   try {
//     var response = await stub.sayHello(RegisterRequest()..name = name);
//     print('Greeter client received: ${response.message}');
//     response = await stub.sayHelloAgain(HelloRequest()..name = name);
//     print('Greeter client received: ${response.message}');
//   } catch (e) {
//     print('Caught error: $e');
//   }
//   await channel.shutdown();
// }

// class FrontClientService {
//   User user = User();
//    RegisterPost(

//   )

  
// }
