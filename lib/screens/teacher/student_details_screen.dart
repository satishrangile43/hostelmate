import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDetailsScreen extends StatelessWidget {
  final String studentId;
  const StudentDetailsScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details', style: GoogleFonts.orbitron(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Text('Details for $studentId'),
      ),
    );
  }
}