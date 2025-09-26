
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send a Message'),
      ),
      body: const Center(
        child: Text('A broadcast message can be sent from here.'),
      ),
    );
  }
}
