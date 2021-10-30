import 'package:flutter/material.dart';
import 'package:postapp/widgets/archive.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Archive("2021-09-10 10:10"),
        Archive("2021-09-10 10:10"),
        Archive("2021-09-10 10:10"),
      ]),
    );
  }
}
