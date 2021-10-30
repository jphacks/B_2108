import 'package:flutter/material.dart';
import 'package:postapp/widgets/inbox.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter入門アカデミー'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Inbox("2021-09-10 10:10"),

        // const Divider(
        //   height: 15,
        //   thickness: 2.5,
        //   indent: 20,
        //   endIndent: 20,
        // ),
        // Inbox("2021-09-10 10:10"),
        // const Divider(
        //   height: 15,
        //   thickness: 2.5,
        //   indent: 20,
        //   endIndent: 20,
        // ),
        // Inbox("2021-09-10 10:10"),
        // const Divider(
        //   height: 15,
        //   thickness: 2.5,
        //   indent: 20,
        //   endIndent: 20,
        // ),
        // Inbox("2021-09-10 10:10"),
      ]),
    ));
  }
}
