
import 'package:flutter/material.dart';

class AllStudentsScreen extends StatelessWidget {
  const AllStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Students'),
      ),
      body: const Center(
        child: Text('A list of all approved students will be shown here.'),
      ),
    );
  }
}
