
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lodge_complaint_screen.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  // Dummy Data
  final String studentName = "Jane Doe";
  final String roomNumber = "A-203";
  final String feeStatus = "Paid";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: GoogleFonts.orbitron()),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 30),
            _buildInfoSection(context),
            const SizedBox(height: 30),
            _buildComplaintSection(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LodgeComplaintScreen()),
          );
        },
        label: const Text('Lodge Complaint'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(studentName, style: GoogleFonts.orbitron(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Student', style: TextStyle(fontSize: 16, color: Colors.grey[400])),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Hostel Details'),
        _buildInfoCard(context, icon: Icons.king_bed, title: 'Room Number', value: roomNumber),
        const SizedBox(height: 16),
        _buildInfoCard(context, icon: Icons.payment, title: 'Fee Status', value: feeStatus, isHighlighted: true),
      ],
    );
  }

  Widget _buildInfoCard(BuildContext context, {required IconData icon, required String title, required String value, bool isHighlighted = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted ? Border.all(color: Theme.of(context).colorScheme.primary, width: 1) : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 30),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey[400])),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComplaintSection(BuildContext context) {
    final complaints = [
      {'category': 'Maintenance', 'description': 'Leaky faucet in the bathroom.', 'status': 'Resolved'},
      {'category': 'Cleaning', 'description': 'Corridor not cleaned for 2 days.', 'status': 'In Progress'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('My Complaints'),
        if (complaints.isEmpty)
          const Center(child: Text('No complaints lodged yet.')),
        if (complaints.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              final complaint = complaints[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                color: Theme.of(context).colorScheme.surface,
                child: ListTile(
                  title: Text(complaint['category']!),
                  subtitle: Text(complaint['description']!),
                  trailing: Text(complaint['status']!, style: TextStyle(color: _getStatusColor(complaint['status']!))),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: GoogleFonts.orbitron(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Resolved':
        return Colors.greenAccent;
      case 'In Progress':
        return Colors.orangeAccent;
      default:
        return Colors.grey;
    }
  }
}
