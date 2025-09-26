import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentApplicationDetailScreen extends StatelessWidget {
  // हम बाद में यहाँ छात्र का पूरा डेटा प्राप्त करेंगे
  // अभी के लिए, हम सिर्फ नाम पास कर रहे हैं
  final String studentName;

  const StudentApplicationDetailScreen({
    super.key,
    required this.studentName,
  });

  // आवेदन को Approve करने का लॉजिक
  void _approveApplication(BuildContext context) {
    // TODO: Firebase में छात्र की स्थिति को 'Approved' में बदलने का लॉजिक यहाँ जोड़ें
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Application for $studentName has been approved.'),
        backgroundColor: Colors.green,
      ),
    );
    // Optionally, navigate back
    Navigator.of(context).pop();
  }

  // Refill का अनुरोध करने का लॉजिक
  void _requestRefill(BuildContext context) {
    // TODO: Firebase में छात्र की स्थिति को 'Refill' में बदलने और एक संदेश भेजने का लॉजिक यहाँ जोड़ें
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Refill request sent for $studentName.'),
        backgroundColor: Colors.orange,
      ),
    );
    // Optionally, navigate back
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Details', style: GoogleFonts.orbitron()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reviewing Application for:',
              style: GoogleFonts.exo2(fontSize: 18, color: Colors.grey[400]),
            ),
            Text(
              studentName,
              style: GoogleFonts.orbitron(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const Divider(height: 32),

            // यहाँ हम बाद में छात्र की पूरी जानकारी दिखाएंगे
            // जैसे: पिता का नाम, पता, दस्तावेज़ आदि।
            const Text('Full application details will be shown here...'),

            const SizedBox(height: 40),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () => _approveApplication(context),
          icon: const Icon(Icons.check_circle),
          label: const Text('Approve'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => _requestRefill(context),
          icon: const Icon(Icons.edit),
          label: const Text('Request Refill'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[600],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
