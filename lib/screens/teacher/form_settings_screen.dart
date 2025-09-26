import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormSettingsScreen extends StatelessWidget {
  const FormSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Settings', style: GoogleFonts.orbitron(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: const Center(
        child: Text('Form Settings Screen'),
      ),
    );
  }
}