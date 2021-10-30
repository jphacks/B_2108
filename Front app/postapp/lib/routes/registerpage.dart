import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:postapp/routes/login.dart';
import 'package:grpc/grpc.dart';
import 'package:postapp/protos/notifier.pb.dart';
import 'package:postapp/protos/notifier.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController unameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController roomnumController = TextEditingController();
  TextEditingController apartController = TextEditingController();
  TextEditingController machineController = TextEditingController();

  String _message = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: unameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Japan Hackers',
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "passwords can't be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'User Email',
                        hintText: 'rcc@example.com',
                        icon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User Email can't be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pwdController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'password',
                        hintText: 'Enter your password',
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "passwords can't be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: roomnumController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Room Number',
                        hintText: '101',
                        icon: Icon(Icons.meeting_room_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill out all informations";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: apartController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Apartment Name',
                        hintText: 'RCC Building',
                        icon: Icon(Icons.account_balance_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill out all informations";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: machineController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Machine ID',
                        hintText: '100000',
                        icon: Icon(Icons.adb_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please fill out all informations";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var uname = unameController.text;
                          var email = emailController.text;
                          var pwd = pwdController.text;
                          int roomnum = int.parse(roomnumController.text);
                          var apartm = apartController.text;
                          int machineID = int.parse(machineController.text);

                          // setState(() {
                          //   _message = "User name : $uname\nPassword : ";
                          // });
                          signup(uname, email, pwd, roomnum, apartm, machineID);
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_message),
                ),
              ],
            )),
      ),
    ));
  }
}

Future<void> signup(String uname, String uemail, String upass, int roomnum,
    String apartm, int machine) async {
  final channel = ClientChannel(
    '127.0.0.1',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = NotifierServiceClient(channel);

  // const uid = 1;

  try {
    var response = await stub.registerPost(RegisterRequest()
      ..userName = uname
      ..email = uemail
      ..password = upass
      ..roomNumber = roomnum
      ..apartmentName = apartm
      ..machineID = machine);
    debugPrint('Register Response is: ${response.token}');
  } catch (e) {
    debugPrint('Caught error: $e');
  }
  await channel.shutdown();
  runApp(const LoginScreen());
}
