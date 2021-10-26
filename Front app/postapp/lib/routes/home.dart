import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("すべての受信トレイ"),
      ),
      body: Center(child: Text("すべての受信トレイ")),
    );
  }
}
