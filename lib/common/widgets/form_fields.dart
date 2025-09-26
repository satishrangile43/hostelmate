import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

Widget buildTextField(
    {required String label,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType? keyboardType}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: TextFormField(
      controller: controller,
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

Widget buildDatePicker({
  required BuildContext context,
  required String label,
  required DateTime? selectedDate,
  required Function(DateTime) onDateSelected,
}) {
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
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1980),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      controller: TextEditingController(
          text: selectedDate == null
              ? ''
              : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
    ),
  );
}

Widget buildDropdown(
    {required String label,
    required List<String> items,
    required TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      value: controller.text.isEmpty ? null : controller.text,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        controller.text = newValue!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a $label';
        }
        return null;
      },
    ),
  );
}

Widget buildFileUpload(
    {required BuildContext context,
    required String label,
    required File? file,
    required Function(File) onPicked}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(label, style: const TextStyle(fontSize: 16))),
            ElevatedButton.icon(
              onPressed: () => _pickImage(context, onPicked),
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload'),
            ),
          ],
        ),
        if (file != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.file(
              file,
              height: 100,
            ),
          ),
      ],
    ),
  );
}

Future<void> _pickImage(
    BuildContext context, Function(File) onPicked) async {
  final source = await showDialog<ImageSource>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Select Image Source'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, ImageSource.camera),
          child: const Text('Camera'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, ImageSource.gallery),
          child: const Text('Gallery'),
        ),
      ],
    ),
  );

  if (source != null) {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      onPicked(File(pickedFile.path));
    }
  }
}
