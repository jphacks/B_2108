import 'package:flutter/material.dart';
import 'package:postapp/widgets/mail_list.dart';
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
        MailList(
          Icons.person,
          "おじいちゃん",
          "time: 何か届きました",
        ),
        MailList(
          Icons.person,
          "久米酒",
          "おいしいよー",
        ),
        MailList(
          Icons.person,
          "久米酒",
          "おいしいよー",
        ),
        MailList(
          Icons.person,
          "久米酒",
          "おいしいよー",
        ),
      ]),
    );
  }
}
