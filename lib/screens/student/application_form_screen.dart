
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({super.key});

  @override
  State<ApplicationFormScreen> createState() => _ApplicationFormScreenState();
}

class _ApplicationFormScreenState extends State<ApplicationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _rulesConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel Application Form', style: GoogleFonts.orbitron()),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Hostel Selection'),
              _buildDropdown('University', ['University A', 'University B']),
              _buildDropdown('Hostel', ['Hostel 1', 'Hostel 2']),
              const SizedBox(height: 24),

              _buildSectionTitle('Student Information'),
              _buildTextField(label: 'Student\'s Name'),
              _buildTextField(label: 'Father\'s/Guardian\'s Name'),
              _buildTextField(label: 'Class / Semester'),
              _buildTextField(label: 'Caste / Category'),
              _buildDatePicker(label: 'Date of Birth'),
              _buildTextField(label: 'Blood Group'),
              _buildTextField(label: 'Mobile Number (Student)', keyboardType: TextInputType.phone),
              _buildTextField(label: 'Mobile Number (Guardian)', keyboardType: TextInputType.phone),
              _buildTextField(label: 'Permanent Address', maxLines: 3),
              const SizedBox(height: 24),

              _buildSectionTitle('Local Guardian'),
              _buildTextField(label: 'Local Guardian\'s Name'),
              _buildTextField(label: 'Local Guardian\'s Address', maxLines: 3),
              const SizedBox(height: 24),

              _buildSectionTitle('Document Checklist'),
              _buildFileUpload('College Admission Receipt'),
              _buildFileUpload('Aadhaar Card Copy'),
              _buildFileUpload('Passport Size Photo'),
              const SizedBox(height: 24),

              _buildSectionTitle('Hostel Rules'),
              Container(
                height: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade700),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const SingleChildScrollView(
                  child: Text(
                    '1. Rule one...\n2. Rule two...\n3. Rule three...\n(Full list of rules here)',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                title: const Text('I confirm that I have read and understood all the rules...'),
                value: _rulesConfirmed,
                onChanged: (bool? value) {
                  setState(() {
                    _rulesConfirmed = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _rulesConfirmed) {
                      // Submit application logic
                    }
                  },
                  child: const Text('Submit Application', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: GoogleFonts.orbitron(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildTextField({required String label, int maxLines = 1, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDatePicker({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () async {
          // Date picker logic
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1980),
            lastDate: DateTime.now(),
          );
        },
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }

  Widget _buildFileUpload(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
          ElevatedButton.icon(
            onPressed: () { /* File upload logic */ },
            icon: const Icon(Icons.upload_file),
            label: const Text('Upload'),
          ),
        ],
      ),
    );
  }
}
