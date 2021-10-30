import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Inbox extends StatelessWidget {
  Inbox(this.created_at);
  final String created_at;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (BuildContext context,
          {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
        return Row();
      },
      steps: <Step>[
        Step(
          title: Text('${created_at}にポストされました'),
          content: Text(""),
        ),
        Step(
          title: Text('${created_at}にポストされました'),
          content: Text(""),
        ),
      ],
    );
  }
}
