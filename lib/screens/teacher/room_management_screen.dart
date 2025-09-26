import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomManagementScreen extends StatelessWidget {
  const RoomManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Management', style: GoogleFonts.orbitron(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: const Center(
        child: Text('Room Management Screen'),
      ),
    );
  }
}