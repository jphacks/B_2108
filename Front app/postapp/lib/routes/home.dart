import 'package:flutter/material.dart';
import 'package:postapp/widgets/inbox.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('すべての受信トレイ'),
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
    );
  }
}
