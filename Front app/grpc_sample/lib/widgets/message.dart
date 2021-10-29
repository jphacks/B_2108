import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const Message(
      {required this.icon, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black54,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.archive),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(icon),
                    backgroundColor: Colors.pink,
                  ),
                  Text(
                    this.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ],
              ),
              Text(
                this.message,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
