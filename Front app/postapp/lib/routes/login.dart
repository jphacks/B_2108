import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
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
      appBar: AppBar(title: const Text('Login Form')),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: unameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'User name',
                        hintText: 'rcc@example.com',
                        icon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: pwdController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'password',
                        hintText: 'Enter your password',
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        var uname = unameController.text;
                        var pwd = pwdController.text;
                        setState(() {
                          _message = "User name : $uname\nPassword : ";
                        });
                      },
                      child: const Text('Login'),
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
