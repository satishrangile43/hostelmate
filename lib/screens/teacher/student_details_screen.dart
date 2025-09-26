import 'package:flutter/material.dart';

class StudentDetailsScreen extends StatelessWidget {
  final String studentId;
  const StudentDetailsScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Text('Details for $studentId'),
      ),
    );
  }
}