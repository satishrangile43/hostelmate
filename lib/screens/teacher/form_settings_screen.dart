
import 'package:flutter/material.dart';

class FormSettingsScreen extends StatefulWidget {
  const FormSettingsScreen({super.key});

  @override
  State<FormSettingsScreen> createState() => _FormSettingsScreenState();
}

class _FormSettingsScreenState extends State<FormSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  final List<String> _universities = ['University A', 'University B'];
  final List<String> _hostels = ['Hostel 1', 'Hostel 2'];
  final List<String> _rules = ['Rule one...', 'Rule two...', 'Rule three...'];

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Settings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Application Period'),
              _buildDatePicker(label: 'Start Date', controller: _startDateController),
              _buildDatePicker(label: 'End Date', controller: _endDateController),
              const SizedBox(height: 24),
              _buildEditableList(
                title: 'Available Universities',
                items: _universities,
                onAdd: () => setState(() => _universities.add('New University')),
                onRemove: (index) => setState(() => _universities.removeAt(index)),
              ),
              const SizedBox(height: 24),
              _buildEditableList(
                title: 'Available Hostels',
                items: _hostels,
                onAdd: () => setState(() => _hostels.add('New Hostel')),
                onRemove: (index) => setState(() => _hostels.removeAt(index)),
              ),
              const SizedBox(height: 24),
              _buildEditableList(
                title: 'Hostel Rules',
                items: _rules,
                onAdd: () => setState(() => _rules.add('New Rule')),
                onRemove: (index) => setState(() => _rules.removeAt(index)),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Save settings logic
                    }
                  },
                  child: const Text('Save Changes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildDatePicker({required String label, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
          );
          if (pickedDate != null) {
            String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
            controller.text = formattedDate;
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a date';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEditableList({
    required String title,
    required List<String> items,
    required VoidCallback onAdd,
    required Function(int) onRemove,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: items[index],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onChanged: (value) {
                        items[index] = value;
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                    onPressed: () => onRemove(index),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          label: const Text('Add New'),
        ),
      ],
    );
  }
}
