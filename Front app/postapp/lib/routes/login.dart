import 'package:flutter/material.dart';
import 'package:postapp/routes/registerpage.dart';
import 'package:grpc/grpc.dart';
import 'package:postapp/protos/notifier.pb.dart';
import 'package:postapp/protos/notifier.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String _message = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('楽々ポストにようこそ')),
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'User name',
                        hintText: 'rcc@example.com',
                        icon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
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
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var useremail = unameController.text;
                          var pwd = pwdController.text;
                          // setState(() {
                          //   _message = "User name : $uname\nPassword : ";
                          // });
                          signup(useremail, pwd);
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_message),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text('Sign up'),
                )
              ],
            )),
      ),
    ));
  }
}

Future<void> signup(String uemail, String upass) async {
  final channel = ClientChannel(
    '127.0.0.1',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = NotifierServiceClient(channel);

  // const uid = 1;

  try {
    var response = await stub.registerPost(RegisterRequest()
      ..userName = 'a'
      ..email = uemail
      ..password = upass
      ..roomNumber = 101
      ..apartmentName = 'RCC'
      ..machineID = 1);
    debugPrint('Register Response is: ${response.token}');
  } catch (e) {
    debugPrint('Caught error: $e');
  }
  await channel.shutdown();
}
