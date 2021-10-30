import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  String _message = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Login Form')),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: unameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'User name',
                    hintText: 'rcc@example.com',
                    icon: Icon(Icons.email_outlined),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: unameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'User name',
                    hintText: 'rcc@example.com',
                    icon: Icon(Icons.email_outlined),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
