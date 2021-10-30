import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Inbox extends StatelessWidget {
  Inbox(this.created_at);
  final String created_at;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: <Step>[
        Step(
          title: const Text('Step 1 title'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 1')),
        ),
        Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
        Step(
          title: Text('Step 3 title'),
          content: Text('Content for Step 3'),
        ),
      ],
    );
  }
}