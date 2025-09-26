import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationFormScreen extends StatelessWidget {
  const ApplicationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application Form',
          style: GoogleFonts.orbitron(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              'Login Successful!',
              style: GoogleFonts.exo2(fontSize: 24, color: Colors.white),
            ),
             const SizedBox(height: 10),
             Text(
              'Welcome to HostelMate.',
              style: GoogleFonts.exo2(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}