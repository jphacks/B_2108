import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpc/widgets/inbox.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('すべての受信トレイ'),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Inbox(
          Icons.person,
          "おじいちゃん",
          "time: 何か届きました",
        ),
        Inbox(
          Icons.person,
          "久米酒",
          "おいしいよー",
        ),
        Inbox(
          Icons.person,
          "久米酒",
          "おいしいよー",
        ),
        Inbox(
          Icons.person,
          "久米酒",
          "おいしいよー",
        ),
      ]),
    );
  }
}
