
import 'package:flutter/material.dart';

class RoomManagementScreen extends StatelessWidget {
  const RoomManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Management'),
      ),
      body: const Center(
        child: Text('A grid of all rooms will be shown here.'),
      ),
    );
  }
}
