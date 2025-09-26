
import 'package:flutter/material.dart';

class StudentApplicationDetailScreen extends StatelessWidget {
  const StudentApplicationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Application'),
      ),
      body: const Center(
        child: Text('Application details will be shown here.'),
      ),
    );
  }
}
