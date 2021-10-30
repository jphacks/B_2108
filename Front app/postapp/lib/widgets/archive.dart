import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Archive extends StatelessWidget {
  Archive(this.created_at);
  final String created_at;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text("${created_at}にポストされました"),
        ),
      ),
    );
  }
}
